import 'package:flutter/material.dart';
import 'package:weatherapp/main.dart';

class NoWeatherBody extends StatelessWidget {
  const NoWeatherBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: 
    
      Container(
        width: double.infinity,
        height: double.infinity,
      decoration: BoxDecoration(
        gradient: LinearGradient(colors:[getthemecolor('default'),
        getthemecolor('default')[300]!,
        getthemecolor('default')[50]!,],
          begin: Alignment.topCenter,end: Alignment.bottomCenter,)
      ),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [Column(
                children: [
             const Text(
                  "There is No Weather !",
                  style: TextStyle(
                    fontSize: 25,
                    fontFamily: "second",
                    color: Color.fromARGB(255, 40, 39, 39),
                    shadows: [
                      Shadow(
                        blurRadius: 10.0,
                        color: Color.fromARGB(255, 79, 79, 79),
                        offset: Offset(5, 5),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 12,),
                const Text(
                  "Start Searching Now 🔎",
                  style: TextStyle(
                      fontSize: 18, fontFamily: "second", color: Color.fromARGB(255, 33, 33, 33)),
                ),
                ],
              )
               ,
                Image.asset(
                  'assets/images/cloudy.png',
                  width: 250,
                  height: 250,
                ),
              ],
            ),
          ),
        ),
      )
    ;
  }
}
