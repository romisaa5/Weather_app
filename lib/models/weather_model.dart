class WeatherModel {
  final String cityname;
  final DateTime date;
  final double temp;
  final double maxtemp;
  final double mintemp;
  final String? image;
  final String weathercondition;
  WeatherModel(
      {required this.cityname,
      required this.date,
      required this.temp,
      required this.maxtemp,
      required this.mintemp,
      this.image,
      required this.weathercondition});
  factory WeatherModel.fromjson(json) {
    return WeatherModel(
      image:json['forecast']['forecastday'][0]['day']['condition']['icon'] ,
        cityname: json['location']['name'],
        date:DateTime.parse(json['current']['last_updated']),
        temp: json['forecast']['forecastday'][0]['day']['avgtemp_c'],
        maxtemp: json['forecast']['forecastday'][0]['day']['maxtemp_c'],
        mintemp:json['forecast']['forecastday'][0]['day']['mintemp_c'],
        weathercondition:json['forecast']['forecastday'][0]['day']['condition']['text']
        );
  }
}
