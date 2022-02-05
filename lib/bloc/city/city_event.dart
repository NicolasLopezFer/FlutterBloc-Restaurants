part of 'city_bloc.dart';

@immutable
abstract class CityEvent {}

class SetCity extends CityEvent {
  final City? city;
  final String newNameCity;
  SetCity({this.city, required this.newNameCity});
}
