import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';

class Loading extends StatefulWidget {
  Loading({Key? key}) : super(key: key);

  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {

  @override
  void initState() {
    getLocation();    
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