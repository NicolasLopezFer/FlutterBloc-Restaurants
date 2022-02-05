import 'package:flutter/material.dart';

class RestaurantsHome extends StatelessWidget {
  const RestaurantsHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Busca restaurantes'),
      ),
      body: Center(
        child: Text('Abre'),
      ),
    );
  }
}
