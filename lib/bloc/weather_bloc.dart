import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../data/model/weather.dart';
import '../data/weather_repository.dart';

part 'weather_event.dart';
part 'weather_state.dart';

class WeatherBloc extends Bloc<WeatherEvent, WeatherState> {
  final WeatherRepository _weatherRepository;

  WeatherBloc(this._weatherRepository) : super(WeatherInitial()) {
    on<GetWeather>((event, emit) async {
      try {
        emit(WeatherLoading());
        final Weather weather =
            await _weatherRepository.fetchWeather(event.cityName);
        emit(WeatherLoaded(weather));
      } on NetworkException {
        emit(WeatherError("Couldn't fetch weather. Is the device online?"));
      }
    });
  }

  // Old format
  // @override
  // Stream<WeatherState> mapEventToState(
  //   WeatherEvent event,
  // ) async* {
  //   if (event is GetWeather) {
  //     try {
  //       yield const WeatherLoading();
  //       final Weather weather =
  //           await _weatherRepository.fetchWeather(event.cityName);
  //       yield WeatherLoaded(weather);
  //     } on NetworkException {
  //       yield WeatherError("Couldn't fetch weather. Is the device online?");
  //     }
  //   }
  // }
}
