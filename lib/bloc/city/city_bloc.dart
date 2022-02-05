import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:restaurants_test/models/city.dart';
import 'package:restaurants_test/network_layer/http_request.dart';

part 'city_event.dart';
part 'city_state.dart';

class CityBloc extends Bloc<CityEvent, CityState> {
  CityBloc() : super(CityInitialState()) {
    final HttpRequest _httpRequest = HttpRequest();
    final String path = "geocode.xyz";

    on<SetCity>((SetCity event, emit) async {
      // Do request to get lat lon

      var res = await _httpRequest.getRequest(
        path,
        '/',
        queryParameters: {
          "locate": '${event.newNameCity}',
          "geoit": 'JSON',
        },
      );

      print(res);

      //Emit the new city with lat lon
    });
  }
}
