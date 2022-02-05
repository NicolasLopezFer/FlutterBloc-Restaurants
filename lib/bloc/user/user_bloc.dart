import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart' as fbAuth;
import 'package:firebase_core/firebase_core.dart';
import 'package:meta/meta.dart';
import 'package:restaurants_test/helpers/validators.dart';
import 'package:restaurants_test/models/user.dart';

part 'user_event.dart';
part 'user_state.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  UserBloc() : super(UserInitialState()) {
    Firebase.initializeApp();

    on<InitialUser>(_initUserCred);
    on<LoginUser>(_onLoginUser);
    on<RegisterUser>(_onRegisterUser);
    on<LogoutUser>(_onLogoutUser);
    on<ChangeCredentials>(_onChangeCredentials);
  }

  void _initUserCred(InitialUser event, emit) {
    emit(UserInitialState());
  }

  void _onLoginUser(LoginUser event, emit) async {
    fbAuth.UserCredential userCredential = await fbAuth.FirebaseAuth.instance
        .signInWithEmailAndPassword(
            email: event.email, password: event.password);

    print('PENDIENTE');
    print(userCredential);
  }

  void _onRegisterUser(RegisterUser event, emit) async {
    fbAuth.UserCredential userCredential = await fbAuth.FirebaseAuth.instance
        .createUserWithEmailAndPassword(
            email: event.email, password: event.password);

    User newUser = User(email: userCredential.user!.email!);

    emit(UserLoginState(newUser));
  }

  void _onLogoutUser(LogoutUser event, emit) {}

  void _onChangeCredentials(ChangeCredentials event, emit) {
    bool valEmail = validateEmail(event.email);
    bool valPassword = validatePassword(event.password);

    emit(UserChangeCredentials(
        event.email, valEmail, event.password, valPassword));
  }
}
