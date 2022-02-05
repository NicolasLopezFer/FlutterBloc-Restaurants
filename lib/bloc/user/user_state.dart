part of 'user_bloc.dart';

@immutable
abstract class UserState {
  final bool authenticated;
  final String email;
  final String password;
  final bool validEmail;
  final bool validPassword;
  final User? user;

  const UserState({
    this.authenticated = false,
    this.password = '',
    this.email = '',
    this.validEmail = false,
    this.validPassword = false,
    this.user,
  });
}

class UserInitialState extends UserState {
  const UserInitialState()
      : super(
          authenticated: false,
          user: null,
          email: '',
          password: '',
          validEmail: false,
          validPassword: false,
        );
}

class UserLoginState extends UserState {
  final User logUser;
  const UserLoginState(this.logUser)
      : super(authenticated: true, user: logUser);
}

class UserLogoutState extends UserState {}

class UserChangeCredentials extends UserState {
  final String email;
  final bool validEmail;
  final String password;
  final bool validPassword;
  const UserChangeCredentials(
    this.email,
    this.validEmail,
    this.password,
    this.validPassword,
  ) : super(
            email: email,
            validEmail: validEmail,
            password: password,
            validPassword: validPassword);
}
