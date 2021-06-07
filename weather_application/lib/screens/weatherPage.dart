import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:weather_application/Models/responseClass.dart';
import 'package:weather_application/Models/weatherClassModel.dart';

//import '../Models/cityList.dart';
//import '../Models/cityList.dart';

class WeatherPage extends StatefulWidget {
  @override
  _WeatherPageState createState() => _WeatherPageState();
}

class _WeatherPageState extends State<WeatherPage> {
  List<WeatherModel> weather = [];

  Future getData(String city) async {
    final params = {
      'q': city,
      'appid': '666debcab45f763590f1a66d93cb227a',
      'units': 'metric'
    };
    final uri =
        Uri.https('api.openweathermap.org', '/data/2.5/weather', params);
    var response = await http.get(uri);

    final json = jsonDecode(response.body);
    return Response.fromJson(json);
  }

  Future<String> getWeatherInfo() async {
    List<String> cityList = ["Delhi", "Mumbai", "Kolkata", "Bangalore", "Pune"];

    cityList.forEach((element) async {
      final response = await getData(element.toString());
      //setState(() {
      _response = response;
      //});

      weather.add(WeatherModel(
          state: this._response.cityInfo,
          temperature: this._response.temperatureInfo.temperature.toString(),
          weather: this._response.weatherInfo.description));
    });

    return 'true';
  }

  Response _response;

  //List<ResponseWeather> weatherResponse =

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[400],
      appBar: AppBar(
        backgroundColor: Colors.grey[700],
        toolbarHeight: 40,
        title: Text("Weather Information"),
      ),
      body: FutureBuilder(
        future: getWeatherInfo(),
        builder: (context, snapshot) {
          if (snapshot.data != null) {
            return ListView.builder(
                itemCount: weather.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.only(
                        bottom: 0, top: 0, left: 0, right: 0),
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
                            "assets/sunny.png",
                            height: 60,
                            width: 60,
                          ),
                          SizedBox(width: 30),
                          Padding(
                            padding: const EdgeInsets.only(top: 20),
                            child: Column(
                              children: [
                                Text(
                                  weather[index].state,
                                  style: TextStyle(
                                      fontSize: 30,
                                      fontWeight: FontWeight.bold),
                                ),
                                Text(weather[index].weather)
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
                                weather[index].temperature,
                                //textAlign: TextAlign.left,

                                style: TextStyle(
                                  fontSize: 40,
                                ),
                              ),
                              Image.asset("assets/icon.png",
                                  height: 10, width: 10),
                            ],
                          ),
                        ],
                      ),
                    ),
                  );
                });
          }
          return Text("In progress...");
        },
      ),
      //nbackgroundColor: Color.fromRGBO(193, 193, 193, 1),
    );
  }
}
