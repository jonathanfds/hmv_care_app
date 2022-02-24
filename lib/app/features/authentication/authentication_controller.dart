import 'dart:async';

import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import '../../data/services/authentication/api_auth_service.dart';
import '../../data/services/interfaces/authentication_service.dart';
import 'authentication_state.dart';
import '../../../core/utils/constants.dart';

class AuthenticationController extends GetxController {
  final IAuthenticationService authService;
  AuthenticationController(this.authService);

  final _state = AuthenticationState().obs;
  set state(value) => _state.value = value;
  get state => _state.value;
  late Box<dynamic> _hiveBox;
  @override
  void onInit() async {
    super.onInit();
    _hiveBox = Hive.box(AppConfig.HIVEBOX_STORAGE);
    await init();
  }

  init() async {
    if (GetPlatform.isMobile) {
      Amplify.Hub.listen([HubChannel.Auth], (hubEvent) async {
        switch (hubEvent.eventName) {
          case 'SIGNED_IN':
            print('USER IS SIGNED IN');
            state = Authenticated(await authService.getUserInfo());
            break;
          case 'SIGNED_OUT':
            print('USER IS SIGNED OUT');
            state = UnAuthenticated();
            break;
          case 'SESSION_EXPIRED':
            print('SESSION HAS EXPIRED');
            state = UnAuthenticated();
            break;
          case 'USER_DELETED':
            print('USER HAS BEEN DELETED');
            state = UnAuthenticated();
            break;
        }
      });
    }
    bool isAuthenticated = await authService.isAuthenticated();

    state = isAuthenticated
        ? Authenticated(await authService.getUserInfo())
        : UnAuthenticated();
  }

  Future<bool?> login(String username, String password) async {
    var loginResult = await authService.loginUser(username, password);
    if (loginResult == true) {
      _hiveBox.put('username', username);
    }
    if (loginResult == true && authService is ApiAuthService) {
      state = Authenticated(await authService.getUserInfo());
    }
    return loginResult;
  }

  Future logout() async {
    await authService.logoutUser();
    _hiveBox.clear();
    if (authService is ApiAuthService) {
      state = UnAuthenticated();
    }
  }

  Future<String> getToken() async {
    return await authService.getAuthorizationToken();
  }
}
