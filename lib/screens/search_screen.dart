import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../custom/my_text.dart';
import '../models/weather_model.dart';
import '../providers/weather_provider.dart';
import '../services/weather_service.dart';

class SearchScreen extends StatelessWidget {
  static const rn = '/search_screen';

  SearchScreen({Key? key}) : super(key: key);

  late String cityName;
  final myController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final setData = Provider.of<WeatherProvider>(context, listen: false);
    return Scaffold(
      appBar: AppBar(
        title: MyText(
          text: 'Search a City',
          size: 20,
          bold: FontWeight.bold,
        ),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          child: TextField(
            controller: myController,
            onSubmitted: (cityName) async {
              this.cityName = cityName;
              late WeatherModel weather;
              try {
                weather = await WeatherService.getWeather(name: this.cityName);
              } catch (error) {
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                  content: MyText(
                    text: error.toString(),
                    size: 14,
                  ),
                  backgroundColor: Colors.red[200],
                ));
              }
              setData.setWeatherModel = weather;
              Navigator.of(context).pop();
            },
            decoration: InputDecoration(
                label: MyText(
                  text: 'Search',
                  size: 15,
                ),
                hintText: 'Enter a City',
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                suffixIcon: IconButton(
                    onPressed: () async {
                      cityName = myController.text;
                      print(myController.text);
                      late WeatherModel weather;
                      try {
                        weather = await WeatherService.getWeather(name: this.cityName);
                      } catch (error) {
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                          content: MyText(
                            text: error.toString(),
                            size: 14,
                          ),
                          backgroundColor: Colors.red[200],
                        ));
                      }
                      setData.setWeatherModel =
                          weather;
                      Navigator.of(context).pop();
                    },
                    icon: const Icon(Icons.search)),
                contentPadding: const EdgeInsets.symmetric(vertical: 25, horizontal: 15)),
          ),
        ),
      ),
    );
  }
}
