import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:restaurants_test/screens/auth/login.dart';
import 'package:restaurants_test/screens/auth/register.dart';

import '../../bloc/user/user_bloc.dart';

class HomeAuth extends StatelessWidget {
  const HomeAuth({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.red,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(height: 50),
            ImageIcon(
              AssetImage('assets/home_icon.png'),
              color: Colors.white,
              size: 150,
            ),
            SizedBox(height: 50),
            Column(
              children: [
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 50),
                  width: double.infinity,
                  child: TextButton(
                    child: Text('Ingresar'),
                    style: TextButton.styleFrom(
                      primary: Colors.black,
                      backgroundColor: Colors.white,
                      onSurface: Colors.grey,
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => LoginPage(),
                        ),
                      );
                    },
                  ),
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 50),
                  width: double.infinity,
                  child: TextButton(
                    child: Text('Registrarse'),
                    style: TextButton.styleFrom(
                      primary: Colors.black,
                      backgroundColor: Colors.white,
                      onSurface: Colors.grey,
                    ),
                    onPressed: () {
                      BlocProvider.of<UserBloc>(context).add(InitialUser());

                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => RegisterPage(),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
            SizedBox(height: 5),
          ],
        ),
      ),
    );
  }
}
