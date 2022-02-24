import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../models/login_user.dart';

abstract class IAuthenticationService {
  Future<bool> registerUser(User user, String password);

  Future<bool?> loginUser(String username, String password);

  Future<bool> confirmUser(String username, String code);

  Future<bool> isAuthenticated();

  Future<User> getUserInfo();

  Future logoutUser();

  Future<String> getAuthorizationToken();
}
