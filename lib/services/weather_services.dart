import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:weatherapp/models/weather_model.dart';

class WeatherServices {
  final Dio dio;

  WeatherServices( this.dio);
  final String baseUrl = 'https://api.weatherapi.com/v1';
  final String Apikey = '168c5dee78914905a9a02349242911';
  Future<WeatherModel> getcurrentweather({required String cityname}) async {
    try {
      Response response = await dio
          .get('$baseUrl/forecast.json?key=$Apikey&q=$cityname&days=1');
      WeatherModel weatherModel = WeatherModel.fromjson(response.data);
      return weatherModel;
    } on DioException catch (e) {
      final String errmassege = e.response?.data['error']['message'] ??
          'opps there was an error,try later!';
      throw Exception(errmassege);
    } catch (e) {
      log(e.toString());
      throw Exception('opps there was an error,try later!');
    }
  }
}
