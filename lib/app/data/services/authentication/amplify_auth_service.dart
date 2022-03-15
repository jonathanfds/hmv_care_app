import 'package:amplify_auth_cognito/amplify_auth_cognito.dart';
import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:get/get.dart';
import 'package:hmv_care_app/app/data/models/login_user.dart';
import 'dart:async';
import 'package:jwt_decode/jwt_decode.dart';
import '../interfaces/authentication_service.dart';

class AmplifyAuthService extends GetxService implements IAuthenticationService {
  Future<IAuthenticationService> init() async {
    return this;
  }

  @override
  Future<bool> registerUser(User user, String password) async {
    Map<CognitoUserAttributeKey, String> userAttributes = {
      CognitoUserAttributeKey.email: user.email!,
      CognitoUserAttributeKey.name: user.name!,
      // additional attributes as needed
    };
    var signUpResult = await Amplify.Auth.signUp(
        username: user.username,
        password: password,
        options: CognitoSignUpOptions(userAttributes: userAttributes));

    return signUpResult.isSignUpComplete;
  }

  @override
  Future<bool?> loginUser(String username, String password) async {
    try {
      var signInResult =
          await Amplify.Auth.signIn(username: username, password: password);
      var result = signInResult.isSignedIn;
      return result;
    } catch (e) {
      if (e is UserNotFoundException || e is NotAuthorizedException) {
        return false;
      }
      e.printError(info: 'signIn Error');
    }
    return null;
  }

  @override
  Future<bool> confirmUser(String username, String code) async {
    var signUpResult = await Amplify.Auth.confirmSignUp(
        username: username, confirmationCode: code);

    return signUpResult.isSignUpComplete;
  }

  @override
  Future<bool> isAuthenticated() async {
    try {
      var session = await Amplify.Auth.fetchAuthSession();
      return session.isSignedIn;
    } catch (e) {
      e.printError(info: 'FetchAuthSession Error');
    }
    return false;
  }

  @override
  Future logoutUser() async {
    await Amplify.Auth.signOut();
  }

  @override
  Future<User> getUserInfo() async {
    Amplify.DataStore.start();
    var session = await Amplify.Auth.fetchAuthSession(
        options: CognitoSessionOptions(getAWSCredentials: true));
    var currentUser = await Amplify.Auth.getCurrentUser();
    var userAttrs = await Amplify.Auth.fetchUserAttributes();
    print('UserAttributes found !');
    print(userAttrs.asMap());
    for (var element in userAttrs) {
      print('Key: ${element.userAttributeKey}');
    }
    var cognitoSession = session as CognitoAuthSession;
    String token = cognitoSession.userPoolTokens?.idToken ?? "";
    Map<String, dynamic> payload = Jwt.parseJwt(token);
    // Access the groups
    List<String> groups = List<String>.from(payload['cognito:groups']);

    User user = User(
        username: currentUser.username,
        userId: currentUser.userId,
        cpf: getAttribute(payload, 'custom:cpf'),
        nomeMae: getAttribute(payload, 'custom:nome_mae'),
        email: getAttribute(payload, 'email'),
        name: getAttribute(payload, 'name'),
        endereco: getAttribute(payload, 'address'),
        telefone: getAttribute(payload, 'phone_number'),
        dtNascimento: getAttribute(payload, 'birthdate'),
        sexo: getAttribute(payload, 'gender'),
        groups: groups);

    return user;
  }

  String? getAttribute(Map<String, dynamic> attributes, String name) {
    try {
      if (attributes.containsKey(name)) {
        if (attributes[name] is Map &&
            attributes[name].containsKey('formatted')) {
          return attributes[name]['formatted'].toString();
        }
        return attributes[name].toString();
      }
    } catch (e) {
      print(e);
    }
    return null;
  }

  @override
  Future<String> getAuthorizationToken() async {
    var session = await Amplify.Auth.fetchAuthSession(
        options: CognitoSessionOptions(getAWSCredentials: true));
    var cognitoSession = session as CognitoAuthSession;
    return cognitoSession.userPoolTokens?.idToken ?? "";
  }
}
