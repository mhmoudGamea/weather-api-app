import 'package:flutter/material.dart';

class WeatherModel {
  final String cityName;
  final DateTime date;
  final double avgTemp;
  final double minTemp;
  final double maxTemp;
  final String condition;
  final String icon;

  WeatherModel({
    required this.cityName,
    required this.date,
    required this.avgTemp,
    required this.minTemp,
    required this.maxTemp,
    required this.condition,
    required this.icon,
  });

  factory WeatherModel.fromJson(dynamic jsonData) {
    // jsonData => the whole json data from my api
    var jsonRepeatedData = jsonData['forecast']['forecastday'][0]['day'];
    return WeatherModel(
      cityName: jsonData['location']['name'],
      date: DateTime.parse(jsonData['current']['last_updated']),
      avgTemp: jsonRepeatedData['avgtemp_c'],
      minTemp: jsonRepeatedData['mintemp_c'],
      maxTemp: jsonRepeatedData['maxtemp_c'],
      condition: jsonRepeatedData['condition']['text'],
      icon: jsonData['current']['condition']['icon'],
    );
  }

  String getImage() {
    if (condition == 'Moderate rain' ||
        condition == 'Patchy rain possible' ||
        condition == 'Patchy light rain' ||
        condition == 'Light rain' ||
        condition == 'Light rain shower' ||
        condition == 'Moderate or heavy rain shower') {
      return 'assets/images/light_rain.png';
    } else if (condition == 'Sunny' && avgTemp >= 29) {
      return 'assets/images/sad_sun.png';
    }else if (condition == 'Sunny') {
      return 'assets/images/smiling_sun.png';
    } else if (condition == 'Partly cloudy' ||
        condition == 'cloudy' ||
        condition == 'Overcast' ||
        condition == 'Mist') {
      return 'assets/images/windy_weather.png';
    } else if (condition == 'Patchy snow possible' ||
        condition == 'Patchy light drizzle' ||
        condition == 'Light drizzle' ||
        condition == 'Freezing drizzle' ||
        condition == 'Heavy freezing drizzle' ||
        condition == 'Patchy heavy snow' ||
        condition == 'Heavy snow' ||
        condition == 'Light snow showers' ||
        condition == 'Moderate or heavy snow showers') {
      return 'assets/images/snow.png';
    } else if (condition == 'Patchy sleet possible' ||
        condition == 'Light freezing rain' ||
        condition == 'Moderate or heavy freezing rain' ||
        condition == 'Light sleet' ||
        condition == 'Moderate or heavy sleet' ||
        condition == 'Light snow showers' ||
        condition == 'Moderate or heavy sleet showers') {
      return 'assets/images/sleet.png';
    } else if (condition == 'Patchy freezing drizzle possible') {
      return 'assets/images/snow_storm.png';
    } else if (condition == 'Thundery outbreaks possible') {
      return 'assets/images/lightning_strike.png';
    } else if (condition == 'Blowing snow' || condition == 'Blizzard') {
      return 'assets/images/wind.png';
    } else if (condition == 'Fog' || condition == 'Freezing fog') {
      return 'assets/images/foggy_night_1.png';
    } else if (condition == 'Heavy rain at times' || condition == 'Heavy rain') {
      return 'assets/images/heavy_rain.png';
    } else if (condition == 'Moderate rain at times' || condition == 'Moderate rain') {
      return 'assets/images/moderate_rain.png';
    } else if (condition == 'Light snow' ||
        condition == 'Patchy moderate snow' ||
        condition == 'Moderate snow') {
      return 'assets/images/light_snow.png';
    } else if (condition == 'Ice pellets') {
      return 'assets/images/icy.png';
    } else if (condition == 'Torrential rain shower' ||
        condition == 'Light sleet showers' ||
        condition == 'Moderate or heavy sleet showers') {
      return 'assets/images/torrential_rain.png';
    } else if (condition == 'Patchy light rain with thunder' ||
        condition == 'Moderate or heavy rain with thunder') {
      return 'assets/images/storm.png';
    }
    return icon;
  }

  MaterialColor getThemeColor() {
    if (condition == 'Moderate rain' ||
        condition == 'Patchy rain possible' ||
        condition == 'Patchy light rain' ||
        condition == 'Light rain' ||
        condition == 'Light rain shower' ||
        condition == 'Moderate or heavy rain shower' ||
        condition == 'Heavy rain at times' ||
        condition == 'Heavy rain' ||
        condition == 'Moderate rain at times' ||
        condition == 'Moderate rain' ||
        condition == 'Torrential rain shower' ||
        condition == 'Light sleet showers' ||
        condition == 'Moderate or heavy sleet showers') {
      return Colors.blue;
    } else if (condition == 'Sunny') {
      return Colors.orange;
    } else if (condition == 'Patchy snow possible' ||
        condition == 'Patchy light drizzle' ||
        condition == 'Light drizzle' ||
        condition == 'Freezing drizzle' ||
        condition == 'Heavy freezing drizzle' ||
        condition == 'Patchy heavy snow' ||
        condition == 'Heavy snow' ||
        condition == 'Light snow showers' ||
        condition == 'Moderate or heavy snow showers' ||
        condition == 'Light snow' ||
        condition == 'Patchy moderate snow' ||
        condition == 'Moderate snow' ||
        condition == 'Patchy sleet possible' ||
        condition == 'Light freezing rain' ||
        condition == 'Moderate or heavy freezing rain' ||
        condition == 'Light sleet' ||
        condition == 'Moderate or heavy sleet' ||
        condition == 'Light snow showers' ||
        condition == 'Moderate or heavy sleet showers' ||
        condition == 'Patchy freezing drizzle possible' ||
        condition == 'Blowing snow' ||
        condition == 'Blizzard' ||
        condition == 'Ice pellets') {
      return Colors.lightBlue;
    }
    return Colors.blueGrey;
  }

  @override
  String toString() {
    return 'WeatherModel{date: $date, avgTemp: $avgTemp, minTemp: $minTemp, maxTemp: $maxTemp, condition: $condition}';
  }
}

/*
// here i use a named constructor which is simply another approach to build the object
// i also use factory constructor which always return an object
// it's a rule any data i get it from the internet i should use factory with named constructor
*/
