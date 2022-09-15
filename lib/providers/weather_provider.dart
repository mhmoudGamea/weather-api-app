
import 'package:flutter/material.dart';
import '../models/weather_model.dart';

class WeatherProvider with ChangeNotifier {
  WeatherModel? _weatherModel;

  set setWeatherModel(WeatherModel? weatherModel) {
    _weatherModel = weatherModel;
    notifyListeners();
  }

  WeatherModel? get getWeatherModel => _weatherModel;
}