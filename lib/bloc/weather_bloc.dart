import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../data/model/weather.dart';
import '../data/weather_repository.dart';

part 'weather_event.dart';
part 'weather_state.dart';

class WeatherBloc extends Bloc<WeatherEvent, WeatherState> {
  final WeatherRepository _weatherRepository;
  WeatherBloc(this._weatherRepository) : super(const WeatherInitial()) {
    on<WeatherEvent>((event, emit) async {
      if (event is GetWeather) {
        try {
          emit(const WeatherLoading());
          Weather weather =
              await _weatherRepository.fetchWeather(event.cityName);
          emit(WeatherLoaded(weather));
        } on NetworkException {
          emit(const WeatherError(
              "Couldn't fetch weather. Is the device connected?"));
        }
      }
    });
  }
}
