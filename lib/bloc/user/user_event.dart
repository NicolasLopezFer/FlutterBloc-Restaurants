part of 'user_bloc.dart';

@immutable
abstract class UserEvent {}

class LoginUser extends UserEvent {
  final String name;
  final String email;
  LoginUser(this.name, this.email);
}

class LogoutUser extends UserEvent {}
