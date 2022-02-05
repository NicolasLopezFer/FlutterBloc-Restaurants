part of 'user_bloc.dart';

@immutable
abstract class UserEvent {}

class InitialUser extends UserEvent {}

class LoginUser extends UserEvent {
  final String password;
  final String email;
  LoginUser(this.password, this.email);
}

class RegisterUser extends UserEvent {
  final String email;
  final String password;
  RegisterUser(this.email, this.password);
}

class LogoutUser extends UserEvent {}

class ChangeCredentials extends UserEvent {
  final String email;
  final String password;
  final bool valEmail;
  final bool valPassword;
  final String errorMessage;
  ChangeCredentials(
    this.email,
    this.password,
    this.valEmail,
    this.valPassword,
    this.errorMessage,
  );
}

class ChangeErrorMessage extends UserEvent {
  final String errorMessage;
  ChangeErrorMessage(this.errorMessage);
}
