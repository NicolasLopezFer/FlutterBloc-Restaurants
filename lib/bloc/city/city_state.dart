part of 'city_bloc.dart';

@immutable
abstract class CityState {
  final City? city;

  CityState({this.city});
}

class CityInitialState extends CityState {
  CityInitialState() : super(city: null);
}

class SetCityState extends CityState {
  final City newCity;
  SetCityState(this.newCity) : super(city: newCity);
}
