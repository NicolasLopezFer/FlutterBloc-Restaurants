import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:restaurants_test/bloc/user/user_bloc.dart';

import '../../helpers/icons_custom.dart';
import '../../widgets/text_form_field_custom.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String emailField = '';
  String passwordField = '';

  @override
  Widget build(BuildContext context) {
    final userBloc = BlocProvider.of<UserBloc>(context);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: Text('Inicio sesión'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            _createEmail(userBloc),
            SizedBox(height: 15),
            _createPassword(userBloc),
            SizedBox(height: 30),
            _createButton(userBloc),
          ],
        ),
      ),
    );
  }

  Widget _createEmail(UserBloc bloc) {
    return BlocBuilder<UserBloc, UserState>(builder: (_, state) {
      return TextFormFieldCustom(
        hintText: 'Correo',
        onChanged: (String value) {
          emailField = value;

          bloc.add(ChangeCredentials(emailField, passwordField,
              state.validEmail, state.validPassword));
        },
        suffixIcon: sufixIcon(state.validEmail),
      );
    });
  }

  Widget _createPassword(UserBloc bloc) {
    return BlocBuilder<UserBloc, UserState>(builder: (_, state) {
      return TextFormFieldCustom(
        hintText: 'Contraseña',
        onChanged: (String value) {
          passwordField = value;

          bloc.add(ChangeCredentials(emailField, passwordField,
              state.validEmail, state.validPassword));
        },
        suffixIcon: sufixIcon(state.validPassword),
      );
    });
  }

  Widget _createButton(UserBloc bloc) {
    return BlocBuilder<UserBloc, UserState>(builder: (_, state) {
      return Container(
        width: double.infinity,
        child: TextButton(
          child: Text('Iniciar sesión'),
          style: TextButton.styleFrom(
            primary: Colors.white,
            backgroundColor: state.validEmail && state.validPassword
                ? Colors.red
                : Colors.grey,
            onSurface: Colors.grey,
          ),
          onPressed: state.validEmail && state.validPassword
              ? () {
                  bloc.add(LoginUser(state.email, state.password));
                }
              : () {},
        ),
      );
    });
  }
}
