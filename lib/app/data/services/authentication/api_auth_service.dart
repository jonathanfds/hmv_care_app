import 'package:amplify_auth_cognito/amplify_auth_cognito.dart';
import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:hmv_care_app/app/data/models/login_user.dart';
import 'package:hmv_care_app/app/data/services/interfaces/authentication_service.dart';
import 'package:dio/dio.dart';
import 'package:amazon_cognito_identity_dart_2/cognito.dart';
import 'package:uuid/uuid.dart';
import '../../../../core/utils/constants.dart';
import '../../providers/hive_cognito_storage.dart';

class ApiAuthService extends GetxService implements IAuthenticationService {
  late Box<dynamic> _hiveBox;
  late HiveCognitoStorage _storage;
  final userPool =
      CognitoUserPool(AppConfig.COGNITO_USER_POOL, AppConfig.CLIENT_ID);

  Future<ApiAuthService> init() async {
    _hiveBox = Hive.box(AppConfig.HIVEBOX_STORAGE);
    _storage = HiveCognitoStorage(_hiveBox);
    return this;
  }

  @override
  Future<bool> confirmUser(String username, String code) async {
    final cognitoUser = CognitoUser(username, userPool);

    bool registrationConfirmed = false;
    try {
      registrationConfirmed = await cognitoUser.confirmRegistration(code);
    } catch (e) {
      print(e);
    }
    return registrationConfirmed;
  }

  @override
  Future<bool> isAuthenticated() async {
    try {
      var username = _hiveBox.get('username');
      if (username != null) {
        final cognitoUser =
            CognitoUser(_hiveBox.get('username'), userPool, storage: _storage);
        var session = await cognitoUser.getSession();
        return session != null;
      }
    } catch (e) {
      print(e);
    }
    return false;
  }

  @override
  Future<bool?> loginUser(String username, String password) async {
    final cognitoUser = CognitoUser(username, userPool, storage: _storage);
    final authDetails = AuthenticationDetails(
      username: username,
      password: password,
    );
    CognitoUserSession? session;
    try {
      session = await cognitoUser.authenticateUser(authDetails);
      await cognitoUser.cacheTokens();
    } catch (e) {
      print(e);
    }
    return session != null;
  }

  @override
  Future logoutUser() async {
    final cognitoUser =
        CognitoUser(_hiveBox.get('username'), userPool, storage: _storage);
    await cognitoUser.signOut();
    return;
  }

  @override
  Future<bool> registerUser(User user, String password) async {
    final userAttributes = [
      AttributeArg(name: 'custom:cpf', value: user.cpf),
      AttributeArg(name: 'custom:nome_mae', value: user.nomeMae),
      AttributeArg(name: 'email', value: user.email),
      AttributeArg(name: 'name', value: user.name),
      AttributeArg(name: 'address', value: user.endereco),
      AttributeArg(name: 'phone_number', value: user.telefone),
      AttributeArg(name: 'birthdate', value: user.dtNascimento),
      AttributeArg(name: 'gender', value: user.sexo),
      AttributeArg(name: 'custom:paciente_id', value: Uuid().v4())
    ];

    CognitoUserPoolData data;
    try {
      data = await userPool.signUp(
        user.email!,
        password,
        userAttributes: userAttributes,
      );
      return true;
    } catch (e) {
      print(e);
    }
    return false;
  }

  @override
  Future<User> getUserInfo() async {
    final cognitoUser =
        CognitoUser(_hiveBox.get('username'), userPool, storage: _storage);
    List<CognitoUserAttribute> attributes = [];
    var session = await cognitoUser.getSession();
    var username = await cognitoUser.getUsername();
    try {
      attributes = await cognitoUser.getUserAttributes() ?? [];
    } catch (e) {
      print(e);
    }

    Map<String, dynamic> payLoad = session!.getIdToken().decodePayload();
    List<String> groups = List<String>.from(payLoad['cognito:groups']);

    User user = User(
        username: username!,
        userId: getAttribute(attributes, 'sub'),
        cpf: getAttribute(attributes, 'custom:cpf'),
        nomeMae: getAttribute(attributes, 'custom:nome_mae'),
        email: getAttribute(attributes, 'email'),
        name: getAttribute(attributes, 'name'),
        endereco: getAttribute(attributes, 'address'),
        telefone: getAttribute(attributes, 'phone_number'),
        dtNascimento: getAttribute(attributes, 'birthdate'),
        sexo: getAttribute(attributes, 'gender'),
        groups: groups);

    return user;
  }

  String? getAttribute(List<CognitoUserAttribute> attributes, String name) {
    try {
      return attributes.firstWhere((t) => t.getName() == name).value;
    } catch (e) {}
    return null;
  }

  Future<bool?> refreshToken(String username, String password) async {
    return false;
  }

  @override
  Future<String> getAuthorizationToken() async {
    var username = _hiveBox.get('username');
    final cognitoUser =
        CognitoUser(_hiveBox.get('username'), userPool, storage: _storage);
    var session = await cognitoUser.getSession();
    var token = session?.getIdToken().getJwtToken();
    //Checar se o Token esta expirado, se sim renovar
    //await cognitoUser.refreshSession(session!.refreshToken!);
    return token ?? "";
  }
}
