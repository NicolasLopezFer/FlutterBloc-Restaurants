import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:restaurants_test/bloc/user/user_bloc.dart';
import 'package:restaurants_test/screens/auth/auth_home.dart';
import 'package:restaurants_test/screens/auth/login.dart';
import 'package:restaurants_test/screens/auth/register.dart';

import '../restaurants/restaurants_home.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserBloc, UserState>(
      builder: (_, state) {
        if (state.user == null) {
          return HomeAuth();
        }

        return RestaurantsHome();
      },
    );
  }
}
