import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import './providers/weather_provider.dart';
import './screens/home_page.dart';
import './screens/search_screen.dart';

void main() {
  runApp(ChangeNotifierProvider(create: (context) => WeatherProvider(), child: const WeatherApp()));
}

class WeatherApp extends StatelessWidget {
  const WeatherApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Provider.of<WeatherProvider>(context).getWeatherModel == null
            ? Colors.lightBlue
            : Provider.of<WeatherProvider>(context).getWeatherModel!.getThemeColor(),
      ),
      title: 'Weather app',
      home: HomePage(),
      routes: {
        SearchScreen.rn: (context) => SearchScreen(),
      },
    );
  }
}
