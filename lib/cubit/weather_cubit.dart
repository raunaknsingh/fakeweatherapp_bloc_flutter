import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:weather_bloc_flutter/data/model/weather.dart';

import '../data/weather_repository.dart';

part 'weather_state.dart';

class WeatherCubit extends Cubit<WeatherState> {
  final WeatherRepository _weatherRepository;
  WeatherCubit(this._weatherRepository) : super(const WeatherInitial());

  Future<void> getWeather(String cityName) async {
    try {
      emit(const WeatherLoading());
      Weather weather = await _weatherRepository.fetchWeather(cityName);
      emit(WeatherLoaded(weather));
    } on NetworkException {
      emit(const WeatherError(
          "Couldn't fetch weather. Is the device connected?"));
    }
  }
}
