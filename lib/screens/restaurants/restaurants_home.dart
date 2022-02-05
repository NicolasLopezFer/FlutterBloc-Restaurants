import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:restaurants_test/bloc/city/city_bloc.dart';
import 'package:restaurants_test/bloc/restaurant/restaurant_bloc.dart';

import '../../widgets/text_form_field_custom.dart';

class RestaurantsHome extends StatefulWidget {
  const RestaurantsHome({Key? key}) : super(key: key);

  @override
  State<RestaurantsHome> createState() => _RestaurantsHomeState();
}

class _RestaurantsHomeState extends State<RestaurantsHome> {
  String cityName = '';

  @override
  Widget build(BuildContext context) {
    final cityBloc = BlocProvider.of<CityBloc>(context);
    final restaurantBloc = BlocProvider.of<RestaurantBloc>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Busca restaurantes'),
        backgroundColor: Colors.red,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        child: Column(
          children: [
            _createCityField(cityBloc),
            _createCityButton(cityBloc),
            SizedBox(height: 10),
            BlocBuilder<CityBloc, CityState>(builder: (_, state) {
              if (state.city == null) {
                return SizedBox();
              }

              if (state.city!.lat == '' && state.city!.lon == '') {
                return SizedBox();
              }

              return Text(
                  'Restaurantes de la ciudad: ${state.city!.cityName}, en lat: ${state.city!.lat} y long: ${state.city!.lon}');
            }),
            _createRestaurantList(restaurantBloc),
          ],
        ),
      ),
    );
  }

  _createCityField(CityBloc cityBloc) {
    return BlocBuilder<CityBloc, CityState>(builder: (_, state) {
      return TextFormFieldCustom(
        hintText: 'Ciudad',
        onChanged: (String value) {
          cityName = value;
        },
      );
    });
  }

  _createCityButton(CityBloc cityBloc) {
    return Container(
      width: double.infinity,
      child: TextButton(
        child: Text('Buscar restaurantes'),
        style: TextButton.styleFrom(
          primary: Colors.white,
          backgroundColor: Colors.red,
          onSurface: Colors.grey,
        ),
        onPressed: () async {
          cityBloc.add(SetCity(newNameCity: cityName));
        },
      ),
    );
  }

  _createRestaurantList(RestaurantBloc restaurantBloc) {
    return BlocBuilder<RestaurantBloc, RestaurantState>(builder: (_, state) {
      return Expanded(
        child: ListView(
          children: [
            Text('Restaurante1'),
            Text('Restaurante1'),
            Text('Restaurante1'),
            Text('Restaurante1'),
            Text('Restaurante1'),
            Text('Restaurante1'),
            Text('Restaurante1'),
            Text('Restaurante1'),
            Text('Restaurante1'),
            Text('Restaurante1'),
            Text('Restaurante1'),
            Text('Restaurante1'),
            Text('Restaurante1'),
            Text('Restaurante1'),
            Text('Restaurante1'),
            Text('Restaurante1'),
            Text('Restaurante1'),
            Text('Restaurante1'),
            Text('Restaurante1'),
            Text('Restaurante1'),
            Text('Restaurante1'),
            Text('Restaurante1'),
            Text('Restaurante1'),
            Text('Restaurante1'),
            Text('Restaurante1'),
            Text('Restaurante1'),
            Text('Restaurante1'),
            Text('Restaurante1'),
            Text('Restaurante1'),
            Text('Restaurante1'),
            Text('Restaurante1'),
            Text('Restaurante1'),
            Text('Restaurante1'),
            Text('Restaurante1'),
            Text('Restaurante1'),
            Text('Restaurante1'),
            Text('Restaurante1'),
            Text('Restaurante1'),
            Text('Restaurante1'),
          ],
        ),
      );
    });
  }
}
