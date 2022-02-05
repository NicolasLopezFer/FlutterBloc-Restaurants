part of 'user_bloc.dart';

@immutable
abstract class UserState {
  final bool authenticated;
  final User? user;

  const UserState({
    this.authenticated = false,
    this.user,
  });
}

class UserInitialState extends UserState {
  const UserInitialState() : super(authenticated: false, user: null);
}

class UserLoginState extends UserState {
  final User logUser;
  const UserLoginState(this.logUser)
      : super(authenticated: true, user: logUser);
}

class UserLogoutState extends UserState {
  const UserLogoutState() : super(authenticated: false, user: null);
}
