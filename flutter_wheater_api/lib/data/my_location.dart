import 'package:geolocator/geolocator.dart';

class MyLocation{

  late double latitude2;
  late double longitude2;

  Future<void> getMyCurrentLocation() async {
    try{
      Position position = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
      latitude2 = position.latitude;
      longitude2 = position.longitude;
      print(position);      
    } catch(e){
      print('Internet에 문제가 생겼습니다');
    }

  }

}