import 'package:clima/screens/location_screen.dart';
import 'package:clima/services/location.dart';
import 'package:clima/services/weather.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  Future<void> getLocationAndData() async {
    var weatherData = await WeatherModel().getWeatherLocationData();

    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) {
        return LocationScreen(
          weatherData: weatherData,
        );
      }),
    );

    //dibuat weatherData soalnya jsonDecode itu returnya dynamic jadi blm tau jenis nya apa sampe dapet datanya
    // int id = weatherData['weather'][0]['id'];
    // double temp = weatherData['main']['temp'];
    // String cityName = weatherData['name'];
    // print(id);
    // print(temp);
    // print(cityName);
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getLocationAndData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SpinKitRotatingCircle(
          color: Colors.white,
          size: 100,
        ),
      ),
    );
  }
}
