import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weatherapp/cubits/get_weather_cubit/get_weather_cubit.dart';
import 'package:weatherapp/cubits/get_weather_cubit/get_weather_states.dart';
import 'package:weatherapp/main.dart';
import 'package:weatherapp/screens/no_weather_body.dart';
import 'package:weatherapp/screens/weather_info_body.dart';
import 'package:weatherapp/views/searchview.dart';

class Homescreen extends StatefulWidget {
  const Homescreen({super.key});

  @override
  _HomescreenState createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> {
  String _weatherCondition = 'default'; // اللون الافتراضي

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: getthemecolor(_weatherCondition), // استخدام اللون المحسوب
        actions: [
          IconButton(
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(builder: (context) {
                return Searchview();
              }));
            },
            icon: Icon(Icons.search),
          ),
        ],
        title: Padding(
          padding: const EdgeInsets.only(left: 105.0),
          child: Text(
            "Weather App",
            style: TextStyle(
              fontSize: 22,
              fontFamily: "second",
              fontWeight: FontWeight.bold,
              color:  Color.fromARGB(255, 33, 32, 32),
              shadows: [
                Shadow(
                  blurRadius: 8.0,
                  color: const Color.fromARGB(255, 42, 43, 44).withOpacity(0.5),
                  offset: const Offset(5, 5),
                ),
              ],
            ),
          ),
        ),
      ),
      body: BlocListener<GetWeatherCubit, WeatherState>(
        listener: (context, state) {
          if (state is WeatherLoadedState) {
            setState(() {
              _weatherCondition = state.weatherModel?.weathercondition ?? 'default';
            });
          }
        },
        child: BlocBuilder<GetWeatherCubit, WeatherState>(
          builder: (context, state) {
            if (state is NoWeatherState) {
              return NoWeatherBody();
            } else if (state is WeatherLoadedState) {
              return WeatherInfoBody(weather: state.weatherModel);
            } else {
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'There was an error, Try Again',
                      style: TextStyle(fontFamily: 'second', fontSize: 23),
                    ),
                    SizedBox(height: 14),
                    Image.asset('assets/images/icons8-search-60.png'),
                  ],
                ),
              );
            }
          },
        ),
      ),
    );
  }
}
