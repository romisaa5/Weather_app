import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weatherapp/cubits/get_weather_cubit/get_weather_cubit.dart';
import 'package:weatherapp/main.dart';
import 'package:weatherapp/models/weather_model.dart';

class WeatherInfoBody extends StatelessWidget {
  final WeatherModel weather;

  const WeatherInfoBody({super.key, required this.weather});
  @override
  Widget build(BuildContext context) {
    WeatherModel weathermodel =
        BlocProvider.of<GetWeatherCubit>(context).weatherModel!;
    return  Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(colors:[getthemecolor(weathermodel.weathercondition),
        getthemecolor(weathermodel.weathercondition)[300]!,
        getthemecolor(weathermodel.weathercondition)[50]!,],
          begin: Alignment.topCenter,end: Alignment.bottomCenter,)
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal:  16.0),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                weathermodel.cityname,
                style: const TextStyle(
                    fontFamily: "second",
                    fontSize: 25,
                    fontWeight: FontWeight.bold),
              ),
              Text(
                'Updated at ${weathermodel.date.hour}:${weathermodel.date.minute}',
                style: TextStyle(
                  fontFamily: "second",
                  fontSize: 16,
                ),
              ),
              SizedBox(
                height: 35,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Image.network("https:${weathermodel.image}"),
                  Text(
                    " ${weathermodel.temp}",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  Column(
                    children: [
                      Text("Maxtemp: ${weathermodel.maxtemp.round()}"),
                      Text("Mintemp: ${weathermodel.mintemp.round()}")
                    ],
                  ),
                ],
              ),
              SizedBox(
                height: 30,
              ),
              Text(
                weathermodel.weathercondition!,
                style: TextStyle(fontFamily: "second", fontSize: 26),
              )
            ],
          ),
      
      ),
    );
  }
}
