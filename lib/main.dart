import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weatherapp/cubits/get_weather_cubit/get_weather_cubit.dart';
import 'package:weatherapp/cubits/get_weather_cubit/get_weather_states.dart';
import 'package:weatherapp/views/homescreen.dart';

void main() {
  runApp(const WeatherApp());
}

class WeatherApp extends StatelessWidget {
  const WeatherApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => GetWeatherCubit(),
        child: Builder(
          builder: (context) => BlocBuilder<GetWeatherCubit, WeatherState>(
            builder: (context, state) {
              return MaterialApp(
                theme: ThemeData(
                  primarySwatch: getthemecolor(
                    BlocProvider.of<GetWeatherCubit>(context)
                        .weatherModel
                        ?.weathercondition,
                  ),
                ),
                debugShowCheckedModeBanner: false,
                home: const Scaffold(
                  resizeToAvoidBottomInset: false,
                  body: Homescreen(),
                ),
              );
            },
          ),
        ));
  }
}

MaterialColor getthemecolor(String? condition) {
  if (condition == null || condition == 'default') {
    return Colors.blueGrey;
  } else if (condition == 'Sunny') {
    return Colors.orange as MaterialColor;
  } else if (condition == 'clear') {
    return Colors.blue as MaterialColor;
  } else if (condition == 'Patchy rain nearby') {
    return Colors.lightBlue as MaterialColor;
  } else if (condition == 'Cloudy') {
    return Colors.cyan as MaterialColor;
  } else if (condition == 'Mist' || condition.contains('fog')) {
    return Colors.blueGrey as MaterialColor;
  } else if (condition.contains('Rain')) {
    return Colors.blue as MaterialColor;
  } else if (condition.contains('Sleet')) {
    return Colors.cyan as MaterialColor;
  } else if (condition.contains('Snow')) {
    return Colors.white as MaterialColor;
  } else if (condition.contains('drizzle')) {
    return Colors.lightBlueAccent as MaterialColor;
  } else if (condition.contains('thunder')) {
    return Colors.purple as MaterialColor;
  } else if (condition == 'Overcast') {
    return Colors.teal as MaterialColor;
  } else if (condition.contains('blizzard') ||
      condition.contains('heavy snow')) {
    return Colors.grey as MaterialColor;
  } else {
    return Colors.cyan as MaterialColor;
  }
}
