import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bloc/user/user_bloc.dart';
import '../../helpers/icons_custom.dart';
import '../../widgets/text_form_field_custom.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  String emailField = '';
  String passwordField = '';

  @override
  Widget build(BuildContext context) {
    final userBloc = BlocProvider.of<UserBloc>(context);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: Text('Registro'),
      ),
      body: BlocBuilder<UserBloc, UserState>(builder: (_, state) {
        if (state.user != null) {
          Navigator.pop(context);
        }

        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              _createEmail(userBloc, state),
              SizedBox(height: 15),
              _createPassword(userBloc, state),
              SizedBox(height: 30),
              _createButton(userBloc, state),
            ],
          ),
        );
      }),
    );
  }

  Widget _createEmail(UserBloc bloc, UserState state) {
    return TextFormFieldCustom(
      hintText: 'Correo',
      onChanged: (String value) {
        emailField = value;

        bloc.add(ChangeCredentials(emailField, passwordField, state.validEmail,
            state.validPassword, ''));
      },
      suffixIcon: sufixIcon(state.validEmail),
    );
  }

  Widget _createPassword(UserBloc bloc, UserState state) {
    return TextFormFieldCustom(
      hintText: 'Contraseña',
      onChanged: (String value) {
        passwordField = value;

        bloc.add(ChangeCredentials(emailField, passwordField, state.validEmail,
            state.validPassword, ''));
      },
      suffixIcon: sufixIcon(state.validPassword),
    );
  }

  Widget _createButton(UserBloc bloc, UserState state) {
    return Column(
      children: [
        Container(
          width: double.infinity,
          child: TextButton(
            child: Text('Registrarse'),
            style: TextButton.styleFrom(
              primary: Colors.white,
              backgroundColor: state.validEmail && state.validPassword
                  ? Colors.red
                  : Colors.grey,
              onSurface: Colors.grey,
            ),
            onPressed: state.validEmail && state.validPassword
                ? () async {
                    bloc.add(RegisterUser(state.email, state.password));
                  }
                : () {},
          ),
        ),
        state.errorMessage == ''
            ? SizedBox()
            : Text(
                state.errorMessage,
                style: TextStyle(color: Colors.red),
              )
      ],
    );
  }
}
