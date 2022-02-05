import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:restaurants_test/models/user.dart';

part 'user_event.dart';
part 'user_state.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  UserBloc() : super(UserInitialState()) {
    on<LoginUser>(_onLoginUser);
    on<LogoutUser>(_onLogoutUser);
  }

  void _onLoginUser(LoginUser event, emit) {
    print('Login event');
  }

  void _onLogoutUser(LogoutUser event, emit) {
    print('Logout event');
  }
}
