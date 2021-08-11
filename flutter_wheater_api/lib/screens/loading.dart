import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class Loading extends StatefulWidget {
  Loading({Key? key}) : super(key: key);

  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {

  @override
  void initState() {
    getLocation();    
    fetchMethod();
    super.initState();
  }

  void getLocation() async {  
    try{
      Position position = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
      print(position);      
    } catch(e){
      print('Internet에 문제가 생겼습니다');
    }
  }

  void fetchMethod() async {
    http.Response response = await http.get(Uri.parse('https://samples.openweathermap.org/data/2.5/weather?q=London&appid=b1b15e88fa797225412429c1c50c122a1'));
    if(response.statusCode == 200){
      String jsonData = response.body;
      var myJson = jsonDecode(jsonData)['wind']['speed'];
      var myId = jsonDecode(jsonData)['id'];
      print(myJson);
      print(myId);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(     
      body: Center(
        child: ElevatedButton(                    
          child: Text('Pressed'),
          style: ElevatedButton.styleFrom(
            primary: Colors.orangeAccent,
          ),
          onPressed: (){},
        ),
      )
    );
  }
}