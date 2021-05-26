import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'login_page.dart';
import 'signup_page.dart';
import 'login.dart';

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
      weatherImage: "assets/weatherImages/snow.png",
      temperature: "-02\u00b0C"),
  WeatherClass(
      city: "Bangalore",
      currentWeather: "Thunderstorms",
      weatherImage: "assets/weatherImages/thunder.png",
      temperature: "23\u00b0C"),
  WeatherClass(
      city: "London",
      currentWeather: "Rainy",
      weatherImage: "assets/weatherImages/rain.png",
      temperature: "15\u00b0C"),
  WeatherClass(
      city: "NewYork",
      currentWeather: "Cloudy",
      weatherImage: "assets/weatherImages/cloudy.png",
      temperature: "18\u00b0C"),
  WeatherClass(
      city: "LasVegas",
      currentWeather: "Overcast",
      weatherImage: "assets/weatherImages/overcast.png",
      temperature: "18\u00b0C"),
  WeatherClass(
      city: "Sydney",
      currentWeather: "Sunny",
      weatherImage: "assets/weatherImages/sunny.png",
      temperature: "32\u00b0C"),
  WeatherClass(
      city: "Kolkata",
      currentWeather: "Sunny",
      weatherImage: "assets/weatherImages/sunny.png",
      temperature: "33\u00b0C"),
  WeatherClass(
      city: "Mumbai",
      currentWeather: "Rainy",
      weatherImage: "assets/weatherImages/rain.png",
      temperature: "23\u00b0C"),
];

class WeatherList extends StatefulWidget {
  @override
  _WeatherListState createState() => _WeatherListState();
}

class _WeatherListState extends State<WeatherList> {
  final _key = GlobalKey<ScaffoldState>();
  SharedPreferences sharedPreferences;
  String username;
  String password;
  void initState() {
    super.initState();
    initial();
  }

  void initial() async {
    sharedPreferences = await SharedPreferences.getInstance();
    setState(() {
      username = sharedPreferences.getString('username');
      password = sharedPreferences.getString('password');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _key,
      backgroundColor: Colors.grey[400],
      appBar: AppBar(
        backgroundColor: Colors.grey[500],
        toolbarHeight: 40,
        title: Text("Weather Information"),
      ),
      drawer: SafeArea(
        child: Drawer(
            child: Column(
          children: [
            TextButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => SignUpPage()));
                },
                child: Text("SignUp")),
            TextButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => WeatherList()));
                },
                child: Text("WeatherList")),
            TextButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => LoginPage()));
                },
                child: Text("Log In")),
            TextButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => Login()));
                },
                child: Text("Successive Technologies Log In")),
            TextButton(
                onPressed: () {
                  sharedPreferences.setBool('login', true);
                  Navigator.pushReplacement(context,
                      new MaterialPageRoute(builder: (context) => Login()));
                },
                child: Text("Sign Out")),
          ],
        )),
      ),
      body: ListView.builder(
          itemCount: place.length,
          itemBuilder: (context, index) {
            return Padding(
              padding:
                  const EdgeInsets.only(bottom: 0, top: 0, left: 0, right: 0),
              child: InkWell(
                onTap: () {
                  print("Information");
                  print("City: " + place[index].city);
                  print("Temperature: " + place[index].temperature);
                  print("Current Weather: " + place[index].currentWeather);
                },
                child: Container(
                  decoration: BoxDecoration(
                      border: Border.all(width: 1, color: Colors.grey),
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          Color.fromRGBO(215, 221, 222, 1),
                          //Color.fromRGBO(205, 205, 205, 1),
                          Color.fromRGBO(217, 221, 223, 1),
                          Color.fromRGBO(202, 203, 202, 1),
                        ],
                      )),
                  height: 100,
                  width: 100,
                  child: Row(
                    children: [
                      SizedBox(width: 20),
                      InkWell(
                        onTap: () {
                          print("Image of a " +
                              place[index].currentWeather +
                              " day.");
                        },
                        child: Image.asset(
                          place[index].weatherImage,
                          height: 60,
                          width: 60,
                        ),
                      ),
                      SizedBox(width: 20),
                      Padding(
                        padding: const EdgeInsets.only(top: 20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            InkWell(
                              onTap: () {
                                print("City: " +
                                    place[index]
                                        .city); // City name will be printed on console when text will be tapped.
                              },
                              child: Text(
                                place[index].city,
                                textAlign: TextAlign.start,
                                style: TextStyle(
                                  fontSize: 30,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            InkWell(
                                onTap: () {
                                  print("Current Weather is " +
                                      place[index]
                                          .currentWeather); // Current weather will be printed on console when text will be tapped.
                                },
                                child: Text(
                                  place[index].currentWeather,
                                  textAlign: TextAlign.start,
                                  style: TextStyle(fontSize: 20),
                                ))
                          ],
                        ),
                      ),
                      //SizedBox(width: 60),
                      Spacer(flex: 1),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,

                        //padding: const EdgeInsets.only(left: 0),
                        children: [
                          InkWell(
                            onTap: () {
                              print("Temperature is " +
                                  place[index]
                                      .temperature); // Temperature will be printed on console when text will be tapped.
                            },
                            child: Text(
                              place[index].temperature,
                              //textAlign: TextAlign.left,

                              style: TextStyle(
                                  fontSize: 40, color: Colors.grey[800]),
                            ),
                          ),
                          SizedBox(width: 15),
                          InkWell(
                            onTap: () {
                              print(
                                  "Arrow icon tapped"); //Tapped message will be printed on console when text will be tapped.
                            },
                            child: Icon(
                              Icons.arrow_forward_ios,
                              size: 15,
                              color: Colors.grey[700],
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            );
          }),
    );
  }
}
