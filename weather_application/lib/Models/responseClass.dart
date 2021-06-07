class ResponseWeather {
  String weather;
  String description;
  String icon;

  ResponseWeather({this.weather, this.description, this.icon});

  ResponseWeather.fromJson(Map<String, dynamic> json) {
    weather = json['main'];
    description = json['description'];
    icon = json['icon'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();

    data['main'] = this.weather;
    data['description'] = this.description;
    data['icon'] = this.icon;
    return data;
  }
}

class TemperatureResponse {
  double temperature;

  TemperatureResponse({this.temperature});

  TemperatureResponse.fromJson(Map<String, dynamic> json) {
    temperature = json['temp'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['temp'] = this.temperature;
    return data;
  }
}

class Response {
  String cityInfo;
  ResponseWeather weatherInfo;
  TemperatureResponse temperatureInfo;

  Response({this.cityInfo, this.weatherInfo, this.temperatureInfo});

  factory Response.fromJson(Map<String, dynamic> json) {
    final cityInfo = json['name']; //City Name
    final weatherInfoJson = json['weather'][0]; // weather
    final temperatureInfoJson = json['main'];

    final weatherInfo = ResponseWeather.fromJson(weatherInfoJson);
    final temperatureInfo = TemperatureResponse.fromJson(temperatureInfoJson);

    return Response(
        cityInfo: cityInfo,
        weatherInfo: weatherInfo,
        temperatureInfo: temperatureInfo);
  }
}
