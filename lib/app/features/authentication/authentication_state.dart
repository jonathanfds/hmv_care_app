import '../../data/models/login_user.dart';

class AuthenticationState {
  const AuthenticationState();
}

class AuthenticationLoading extends AuthenticationState {}

class UnAuthenticated extends AuthenticationState {}

class Authenticated extends AuthenticationState {
  Authenticated(this.userInfo);
  User userInfo;
}
