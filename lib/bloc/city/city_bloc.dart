import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'city_event.dart';
part 'city_state.dart';

class CityBloc extends Bloc<CityEvent, CityState> {
  CityBloc() : super(CityInitial()) {
    on<CityEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
