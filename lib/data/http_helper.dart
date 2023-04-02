import 'package:http/http.dart' as http;
import 'dart:convert';
import '../data/weather.dart';

// in this class we will need to connect to the OpenWeather API to retrieve the
// the current weather condition for a specific city in the world

class HttpHelper {
// https://api.openweathermap.org/data/2.5/weather?q=London&appid=4e309b03442f326f76b3f88948aa53ff
  final String authority = 'api.openweathermap.org';
  final String path  = 'data/2.5/weather';
  final String apiKey = '4e309b03442f326f76b3f88948aa53ff';

  Future<Weather> getWeather(String location) async {
    Map<String, dynamic> parameters = {'q': location, 'appId': apiKey};
    Uri uri = Uri.https(authority, path, parameters);
    http.Response result = await http.get(uri);
    Map<String, dynamic> data = json.decode(result.body);
    Weather weather =  Weather.fromJson(data);
    return weather;
  }
}