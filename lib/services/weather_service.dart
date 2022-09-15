import 'dart:convert';

import 'package:http/http.dart' as http;

import '../models/weather_model.dart';

class WeatherService {
  static Future<WeatherModel> getWeather({required String name}) async {
    WeatherModel weather;
    try {
      Uri url = Uri.parse(
          'https://api.weatherapi.com/v1/forecast.json?key=a49205c998ba422ea1780051220809&q=$name&days=1&aqi=no&alerts=no');
      final response = await http.get(url);
      if(response.statusCode >= 400) {
        throw Exception(json.decode(response.body)['error']['message']);
      }
      // here i have the whole json data from my api
      Map<String, dynamic> data = json.decode(response.body);

      // calling my named constructor fromJson to automatically build an object from WeatherModel class
      weather = WeatherModel.fromJson(data);
    }catch(error) {
      rethrow;
    }
    return weather;
  }
}
