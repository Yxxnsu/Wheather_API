import 'package:http/http.dart' as http;
import 'dart:convert';

class Network{

  final String url1;
  final String url2;
  Network(this.url1, this.url2);

  Future<dynamic> getJsonData() async {

    http.Response response = await http.get(Uri.parse(url1));
    if(response.statusCode == 200){
      String jsonData = response.body;
      var parsingData = jsonDecode(jsonData);
      return parsingData;
    }else{
      print(response.statusCode);
    }  
  }

  Future<dynamic> getAirData() async {

    http.Response response = await http.get(Uri.parse(url2));
    if(response.statusCode == 200){
      String jsonData = response.body;
      var parsingData = jsonDecode(jsonData);
      return parsingData;
    }else{
      print(response.statusCode);
    }  
  }
}