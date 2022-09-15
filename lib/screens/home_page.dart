import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/models/weather_model.dart';

import './search_screen.dart';
import '../custom/my_text.dart';
import '../providers/weather_provider.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final weatherData = Provider.of<WeatherProvider>(context).getWeatherModel;
    return Scaffold(
      appBar: AppBar(
        title: MyText(
          text: 'Weather app',
          size: 22,
          bold: FontWeight.bold,
        ),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.of(context).pushNamed(SearchScreen.rn);
              },
              icon: const Icon(Icons.search, size: 26)),
        ],
      ),
      body: weatherData == null
          ? Center(
              child: Column(mainAxisSize: MainAxisSize.min, children: [
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    MyText(
                      text: 'There is no weather',
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Image.asset('assets/images/wildfire.png', width: 30),
                  ],
                ),
                MyText(
                  text: 'Start searching now',
                ),
              ]),
            )
          : Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    weatherData.getThemeColor(),
                    weatherData.getThemeColor()[300]!,
                    weatherData.getThemeColor()[100]!
                  ]
                )
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Spacer(
                    flex: 3,
                  ),
                  MyText(
                    text: weatherData.cityName,
                    size: 22,
                    bold: FontWeight.w900,
                    letterSpacing: 2,
                  ),
                  MyText(
                    text: 'updated: ${weatherData.date.hour}:${weatherData.date.minute}',
                    size: 16,
                  ),
                  const Spacer(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Image.asset(weatherData.getImage(), width: 60),
                      MyText(
                        text: weatherData.avgTemp.toStringAsFixed(1),
                        size: 22,
                        bold: FontWeight.w900,
                        letterSpacing: 2,
                      ),
                      Column(
                        children: [
                          MyText(
                            text: 'max: ${weatherData.maxTemp.toInt()}',
                            size: 16,
                          ),
                          MyText(
                            text: 'min: ${weatherData.minTemp.toInt()}',
                            size: 16,
                          ),
                        ],
                      )
                    ],
                  ),
                  const Spacer(),
                  MyText(
                    text: weatherData.condition,
                    size: 22,
                    bold: FontWeight.w900,
                    letterSpacing: 2,
                  ),
                  const Spacer(
                    flex: 7,
                  ),
                ],
              ),
            ),
    );
  }
}
