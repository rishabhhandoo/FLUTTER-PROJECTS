import 'package:flutter/material.dart';
import 'package:clima/services/location.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

const apiKey = 'b191404ac4d7902ad04af08efbb733f4';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {

  double latitude=0;
  double longitude=0;
  void getLocation() async {
    Location location = Location();
    await location.getCurrentLocation();
    latitude = location.latitude;
    longitude = location.longitude;
    getData();
  }
  void getData() async{
  http.Response response = await http.get(Uri.parse('https://api.openweathermap.org/data/2.5/weather?lat=$latitude&lon=$longitude&appid=$apiKey'));
  //print(response); prints instance of response
  //   print(response.body);
  //   print(response.statusCode);
    if(response.statusCode==200)
      {
        String data = response.body;
        // var longitude=jsonDecode(data)['coord']['lon'];
        // var weatherdescription = jsonDecode(data)['weather'][0]['description'];
        // print(weatherdescription);
        var decodedData = jsonDecode(data);
        String condition = decodedData['weather'][0]['id'];
        double temprature = decodedData['main']['temp'];
        String cityName = decodedData['name'];//or use var

      }else{
        print(response.statusCode);
    }
  }


  @override
  void initState() {
    super.initState();
    getLocation();
  }

   @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}
