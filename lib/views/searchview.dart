import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weatherapp/cubits/get_weather_cubit/get_weather_cubit.dart';
import 'package:weatherapp/cubits/get_weather_cubit/get_weather_states.dart';
import 'package:weatherapp/main.dart';
import 'package:weatherapp/models/weather_model.dart';

class Searchview extends StatelessWidget {
  const Searchview({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<GetWeatherCubit, WeatherState>(
        builder: (context, state) {
          // اللون الافتراضي
          MaterialColor defaultColor = Colors.blueGrey;

          // لون الخلفية بناءً على حالة `Cubit`
          MaterialColor backgroundColor = defaultColor;

          if (state is WeatherLoadedState) {
            // إذا تم تحميل بيانات الطقس بنجاح
            WeatherModel weatherModel = state.weatherModel;
            backgroundColor = getthemecolor(weatherModel.weathercondition);
          }

          return Container(
            width: double.infinity,
            height: double.infinity,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  backgroundColor,
                  backgroundColor[300]!,
                  backgroundColor[50]!,
                ],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
            ),
            child: Center(
              child: Column(
                children: [
                  const SizedBox(
                    height: 70,
                  ),
                  const Text(
                    "Search City",
                    style: TextStyle(
                      fontSize: 32,
                      fontFamily: "second",
                      fontWeight: FontWeight.bold,
                      color: Color.fromARGB(255, 215, 225, 230),
                      shadows: [
                        Shadow(
                          blurRadius: 8.0,
                          color: Color.fromARGB(255, 94, 118, 130),
                          offset: Offset(5, 5),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Image.asset(
                    "assets/images/clouds-and-sun (1).png",
                    height: 120,
                    width: 120,
                  ),
                  const SizedBox(
                    height: 70,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 12.0),
                    child: TextField(
                      onSubmitted: (value) async {
                        var getweathercubit =
                            BlocProvider.of<GetWeatherCubit>(context);
                        getweathercubit.getweather(value);
                        Navigator.pop(context);
                      },
                      decoration: InputDecoration(
                        contentPadding: const EdgeInsets.symmetric(
                            vertical: 20, horizontal: 15),
                        suffixIcon: IconButton(
                          onPressed: () {},
                          icon: const Icon(Icons.search),
                        ),
                        labelText: " Search",
                        labelStyle: const TextStyle(color: Colors.black),
                        hintText: "Enter City Name",
                        fillColor: Colors.white,
                        filled: true,
                        enabledBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                              color: Color.fromARGB(255, 157, 186, 204)),
                          borderRadius: BorderRadius.circular(17),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: const BorderSide(color: Colors.blueGrey),
                          borderRadius: BorderRadius.circular(17),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

WeatherModel? weatherModel;
