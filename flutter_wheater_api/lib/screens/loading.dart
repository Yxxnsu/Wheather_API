import 'package:flutter/material.dart';
import 'package:flutter_wheater_api/data/my_location.dart';
import 'package:flutter_wheater_api/data/network.dart';
import 'package:flutter_wheater_api/screens/weather.dart';
const apiKey = '982202e0d65f3676f68c43b5ab691c63';

class Loading extends StatefulWidget {
  Loading({Key? key}) : super(key: key);

  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {

  late double latitude3;
  late double longitude3;

  @override
  void initState() {
    getLocation();    
    super.initState();
  }

  void getLocation() async {   
    MyLocation myLocation = MyLocation();    
    await myLocation.getMyCurrentLocation();
    latitude3 = myLocation.latitude2;
    longitude3 = myLocation.longitude2;    

    Network network = Network(
      'https://api.openweathermap.org/data/2.5/weather?lat=$latitude3&lon=$longitude3&appid=$apiKey',
      'http://api.openweathermap.org/data/2.5/air_pollution?lat=$latitude3&lon=$longitude3&appid=$apiKey',
    );

    var weatherData = await network.getJsonData();
    var airData = await network.getAirData();

    Navigator.push(context, MaterialPageRoute(builder: (context){
      return WeatherScreen(parseWeatherData : weatherData, parseAirData: airData,);
    }));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(     
      body: Center(
        child: CircularProgressIndicator(),
      )
    );
  }
}