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
      body: ListView(
        children: [
          ListTile(
            leading: Container(
              child: Image.asset(
                "assets/snow.png",
                height: 200,
                width: 100,
              ),
            ),
            title: Text(
              "Berlin",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
            ),
            subtitle: Text("Snowy", style: TextStyle(fontSize: 20)),
            trailing: Text("0\u00b0 C", style: TextStyle(fontSize: 40)),
          ),
          Divider(thickness: 2),
          SizedBox(
            height: 20,
          ),
          ListTile(
            leading: SizedBox(
              child: Image.asset(
                "assets/thunder.png",
                height: 200,
                width: 100,
              ),
            ),
            title: Text(
              "Bangalore",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
            ),
            subtitle: Text("Thunderstorm", style: TextStyle(fontSize: 20)),
            trailing: Text("23\u00b0 C", style: TextStyle(fontSize: 40)),
          ),
          Divider(thickness: 2),
          SizedBox(
            height: 20,
          ),
          ListTile(
            leading: SizedBox(
              child: Image.asset(
                "assets/rain.png",
                height: 200,
                width: 100,
              ),
            ),
            title: Text(
              "London",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
            ),
            subtitle: Text("Rainy", style: TextStyle(fontSize: 20)),
            trailing: Text("5\u00b0 C", style: TextStyle(fontSize: 40)),
          ),
          Divider(thickness: 2),
          SizedBox(
            height: 20,
          ),
          ListTile(
            leading: SizedBox(
              child: Image.asset(
                "assets/cloudy.png",
                height: 200,
                width: 100,
              ),
            ),
            title: Text(
              "New York",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
            ),
            subtitle: Text("Cloudy", style: TextStyle(fontSize: 20)),
            trailing: Text("18\u00b0 C", style: TextStyle(fontSize: 40)),
          ),
          Divider(thickness: 2),
          SizedBox(
            height: 20,
          ),
          ListTile(
            leading: SizedBox(
              child: Image.asset(
                "assets/sunny.png",
                height: 200,
                width: 100,
              ),
            ),
            title: Text(
              "Sydney",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
            ),
            subtitle: Text("Sunny", style: TextStyle(fontSize: 20)),
            trailing: Text("32\u00b0 C", style: TextStyle(fontSize: 40)),
          ),
          Divider(thickness: 2),
          SizedBox(
            height: 20,
          ),
          ListTile(
            leading: SizedBox(
              child: Image.asset(
                "assets/overcast.png",
                height: 200,
                width: 100,
              ),
            ),
            title: Text(
              "Delhi",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
            ),
            subtitle: Text("Overcast", style: TextStyle(fontSize: 20)),
            trailing: Text("32\u00b0 C", style: TextStyle(fontSize: 40)),
          ),
          Divider(thickness: 2),
          SizedBox(
            height: 20,
          ),
          ListTile(
            leading: SizedBox(
              child: Image.asset(
                "assets/windy.png",
                height: 200,
                width: 100,
              ),
            ),
            title: Text(
              "Florida",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
            ),
            subtitle: Text("Windy", style: TextStyle(fontSize: 20)),
            trailing: Text("22\u00b0 C", style: TextStyle(fontSize: 40)),
          ),
          Divider(thickness: 2),
        ],
      ),
    );
  }
}
