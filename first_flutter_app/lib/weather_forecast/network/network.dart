import 'dart:convert';

import 'package:firstflutterapp/weather_forecast/model/weather_forecast_model.dart';
import 'package:firstflutterapp/weather_forecast/util/forecast_util.dart';
import 'package:http/http.dart';

class Network {
  Future<WeatherForecastModel> getWeatherForecast({ String cityName }) async {
    var finalUrl = "https://api.openweathermap.org/data/2.5/forecast/daily?q=" + cityName + "&units=metric&cnt=7&appid=" + Util.appId + "&units=imperial";

    final response = await get(Uri.parse(Uri.encodeFull(finalUrl)));
    //print("URL: " + Uri.encodeFull(finalUrl));

    if (response.statusCode == 200) {
      //print("weather data ${response.body}");
      return WeatherForecastModel.fromJson(json.decode(response.body));
    } else {
      throw Exception("Error getting weather forecast");
    }
  }
}