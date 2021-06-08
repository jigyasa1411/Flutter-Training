import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:http/http.dart' as http;
import 'package:weather_app/Model/responseClass.dart';
import 'package:weather_app/Model/weatherModel.dart';

class WeatherPage extends StatefulWidget {
  @override
  _WeatherPageState createState() => _WeatherPageState();
}

class _WeatherPageState extends State<WeatherPage> {
  List<WeatherModel> weather = [];
  int temp = 0;

  Future getData(String city) async {
    final params = {
      'q': city,
      'appid': '2f8796eefe67558dc205b09dd336d022',
      'units': 'metric'
    };
    final uri =
        Uri.https('api.openweathermap.org', '/data/2.5/weather', params);
    var response = await http.get(uri);

    final json = jsonDecode(response.body);
    return Response.fromJson(json);
  }

  Response _response;
  Future<String> getWeatherInfo() async {
    final response = await getData("London");

    _response = response;

    return 'true';
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: getWeatherInfo(),
      builder: (context, snapshot) {
        if (snapshot.data != null) {
          return Scaffold(
            body: Container(
                padding: EdgeInsets.only(left: 20, right: 20, top: 30),
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    fit: BoxFit.fill,
                    image: AssetImage("assets/morning.jpg"),
                  ),
                ),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        SvgPicture.asset("assets/cloud.svg",
                            color: Color.fromRGBO(226, 243, 246, 1),
                            height: 50,
                            width: 50),
                        Text(_response.clouds.all.toString() + "%",
                            style: TextStyle(
                                color: Color.fromRGBO(226, 243, 246, 1),
                                fontSize: 20)),
                        Spacer(),
                        SvgPicture.asset("assets/wind.svg",
                            color: Color.fromRGBO(226, 243, 246, 1),
                            height: 50,
                            width: 50),
                        Text(_response.wind.speed.toString() + " m/s",
                            style: TextStyle(
                                color: Color.fromRGBO(226, 243, 246, 1),
                                fontSize: 20)),
                        Spacer(),
                        SvgPicture.asset("assets/humidity.svg",
                            color: Color.fromRGBO(226, 243, 246, 1),
                            height: 50,
                            width: 50),
                        Text(_response.main.humidity.round().toString() + " %",
                            style: TextStyle(
                                color: Color.fromRGBO(226, 243, 246, 1),
                                fontSize: 20)),
                      ],
                    ),

                    /***COLUMN Started */
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          _response.main.temp.round().toString(),
                          style: TextStyle(
                              fontSize: 150,
                              color: Color.fromRGBO(226, 243, 246, 1)),
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              "\u00b0C",
                              style: TextStyle(
                                  fontSize: 40,
                                  color: Color.fromRGBO(226, 243, 246, 1)),
                            ),
                            SizedBox(height: 5),
                            Row(
                              children: [
                                SvgPicture.asset("assets/high.svg",
                                    color: Color.fromRGBO(226, 243, 246, 1),
                                    height: 20,
                                    width: 20),
                                Text(
                                  _response.main.tempMax.round().toString() +
                                      "\u00b0C",
                                  style: TextStyle(
                                      fontSize: 15,
                                      color: Color.fromRGBO(226, 243, 246, 1)),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                SvgPicture.asset("assets/low.svg",
                                    color: Color.fromRGBO(226, 243, 246, 1),
                                    height: 20,
                                    width: 20),
                                Text(
                                  _response.main.tempMin.round().toString() +
                                      "\u00b0C",
                                  style: TextStyle(
                                      fontSize: 15,
                                      color: Color.fromRGBO(226, 243, 246, 1)),
                                ),
                              ],
                            )
                          ],
                        )
                      ],
                    ),

                    /******COLUMN */
                    Column(
                      children: [
                        Text(
                          _response.name + "," + _response.sys.country,
                          style: TextStyle(
                              color: Color.fromRGBO(226, 243, 246, 1),
                              fontSize: 30),
                        ),
                        Text(
                          "Haze",
                          style: TextStyle(
                              color: Color.fromRGBO(226, 243, 246, 1),
                              fontSize: 20),
                        ),
                        SvgPicture.asset(
                          "assets/weather/cloudy.svg",
                          color: Color.fromRGBO(226, 243, 246, 1),
                          height: 200,
                          width: 150,
                        )
                      ],
                    )
                  ],
                )),
          );
        }
        return CircularProgressIndicator();
      },
    );
  }
}
