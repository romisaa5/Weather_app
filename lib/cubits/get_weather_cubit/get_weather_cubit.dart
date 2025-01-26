import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weatherapp/cubits/get_weather_cubit/get_weather_states.dart';
import 'package:weatherapp/models/weather_model.dart';
import 'package:weatherapp/services/weather_services.dart';

class GetWeatherCubit extends Cubit<WeatherState> {
  GetWeatherCubit() : super(NoWeatherState());
   WeatherModel ?weatherModel;
  getweather(value) async {
    try {
 weatherModel =
          await WeatherServices(Dio()).getcurrentweather(cityname: value);
      emit(WeatherLoadedState(weatherModel!));
    } catch (e) {
      emit(WeatherFailuerState(e.toString()));
    }
  }
}
