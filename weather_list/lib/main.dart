import 'dart:ui';

import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: Scaffold(
          backgroundColor: Colors.grey[350],
          body: WeatherList(),
        ));
  }
}

class WeatherClass {
  String city;
  String currentWeather;
  String weatherImage;
  String temperature;

  WeatherClass(
      {this.city, this.currentWeather, this.weatherImage, this.temperature});
}

List<WeatherClass> place = [
  WeatherClass(
      city: "Berlin",
      currentWeather: "Snowing",
      weatherImage: "assets/snow.png",
      temperature: "-02\u00b0C"),
  WeatherClass(
      city: "Bangalore",
      currentWeather: "Thunderstorms",
      weatherImage: "assets/thunder.png",
      temperature: "23\u00b0C"),
  WeatherClass(
      city: "London",
      currentWeather: "Rainy",
      weatherImage: "assets/rain.png",
      temperature: "15\u00b0C"),
  WeatherClass(
      city: "NewYork",
      currentWeather: "Cloudy",
      weatherImage: "assets/cloudy.png",
      temperature: "18\u00b0C"),
  WeatherClass(
      city: "LasVegas",
      currentWeather: "Overcast",
      weatherImage: "assets/overcast.png",
      temperature: "18\u00b0C"),
  WeatherClass(
      city: "Sydney",
      currentWeather: "Sunny",
      weatherImage: "assets/sunny.png",
      temperature: "32\u00b0C"),
  WeatherClass(
      city: "Kolkata",
      currentWeather: "Sunny",
      weatherImage: "assets/sunny.png",
      temperature: "33\u00b0C"),
  WeatherClass(
      city: "Mumbai",
      currentWeather: "Rainy",
      weatherImage: "assets/rain.png",
      temperature: "23\u00b0C"),
];

class WeatherList extends StatefulWidget {
  @override
  _WeatherListState createState() => _WeatherListState();
}

class _WeatherListState extends State<WeatherList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[400],
      appBar: AppBar(
        backgroundColor: Colors.grey[700],
        toolbarHeight: 40,
        title: Text("Weather Information"),
      ),
      body: ListView.builder(
          itemCount: place.length,
          itemBuilder: (context, index) {
            return Padding(
              padding:
                  const EdgeInsets.only(bottom: 0, top: 0, left: 0, right: 0),
              child: Container(
                decoration: BoxDecoration(
                    border: Border.all(width: 1, color: Colors.grey),
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        Color.fromRGBO(215, 221, 222, 1),
                        Color.fromRGBO(205, 205, 205, 1),
                        Colors.grey,
                      ],
                    )),
                height: 100,
                width: 100,
                child: Row(
                  children: [
                    SizedBox(width: 20),
                    Image.asset(
                      place[index].weatherImage,
                      height: 60,
                      width: 60,
                    ),
                    SizedBox(width: 30),
                    Padding(
                      padding: const EdgeInsets.only(top: 20),
                      child: Column(
                        children: [
                          Text(
                            place[index].city,
                            style: TextStyle(
                                fontSize: 30, fontWeight: FontWeight.bold),
                          ),
                          Text(place[index].currentWeather)
                        ],
                      ),
                    ),
                    //SizedBox(width: 60),
                    Spacer(flex: 1),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,

                      //padding: const EdgeInsets.only(left: 0),
                      children: [
                        Text(
                          place[index].temperature,
                          //textAlign: TextAlign.left,

                          style: TextStyle(
                            fontSize: 40,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            );
          }),
    );
  }
}
