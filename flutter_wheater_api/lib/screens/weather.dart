import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_wheater_api/model/model.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:timer_builder/timer_builder.dart';
import 'package:intl/intl.dart';

class WeatherScreen extends StatefulWidget {

  final dynamic parseWeatherData;
  final dynamic parseAirData;

  const WeatherScreen({
    Key? key,
    required this.parseWeatherData,
    required this.parseAirData,
  }) : super(key: key);

  @override
  _WeatherScreenState createState() => _WeatherScreenState();
}

class _WeatherScreenState extends State<WeatherScreen> { 

  Model model = Model();
  late String cityName;
  late double temp;
  late Widget icons;
  late String description;
  late Widget airIcon;
  var date = DateTime.now();

  @override
  void initState() {
    super.initState();     
    updateData(widget.parseWeatherData, widget.parseAirData);
  }
 
  void updateData(dynamic weatherData, dynamic airData){

    temp = weatherData['main']['temp'] - 273.15;
    cityName = weatherData['name'];
    description = weatherData['weather'][0]['description'];

    int condition = weatherData['weather'][0]['id'];    
    icons = model.getWeatherIcon(condition);

    int index = airData['list'][0]['main']['aqi'];
    airIcon = model.getAirIcon(index);
    
    print(airData);
    print(weatherData);

  }

  String getSystemTime(){
    var now = DateTime.now();  
    return DateFormat("h:mm a").format(now);
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(      
      extendBodyBehindAppBar: true,
      appBar: AppBar(        
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text(''),
        leading: IconButton(
          icon: Icon(
            Icons.near_me,
            size: 30,
          ),
          onPressed: (){},
        ), 
        actions: [
          IconButton(
            icon: Icon(
              Icons.location_searching,
              size: 30,
            ),
            onPressed: (){},
          ),
        ],
      ),      
      body: Container(
        child: Stack(
          children: [
            Image.asset(
              'assets/background.jpg',
              fit: BoxFit.cover,
              width: double.infinity,
              height: double.infinity,
            ),            
            Container(     
              padding: EdgeInsets.all(20),         
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              height: 50,
                            ),
                            Text(
                              cityName,
                              style: GoogleFonts.lato(
                                fontSize: 35,
                                color: Colors.white,
                                fontWeight: FontWeight.bold
                              ),
                            ),
                            Row(
                              children: [
                                TimerBuilder.periodic((Duration(minutes: 1)), 
                                  builder: (context){
                                    return Text(
                                      '${getSystemTime()}',
                                      style: GoogleFonts.lato(
                                        color: Colors.white,
                                        fontSize: 16,
                                      ),
                                    );
                                  },
                                ),
                                Text(
                                  DateFormat(' - EEEE').format(date),
                                  style: GoogleFonts.lato(
                                    color: Colors.white,
                                    fontSize: 16,
                                  ),
                                ),
                                Text(
                                  DateFormat(' d MMM, yyy').format(date),
                                  style: GoogleFonts.lato(
                                    color: Colors.white,
                                    fontSize: 16,
                                  ), 
                                ),
                              ],
                            ),
                          ],
                        ),                        
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              '${temp.toStringAsFixed(0)}\u2103',
                              style: GoogleFonts.lato(
                                fontWeight: FontWeight.w300,
                                color: Colors.white,
                                fontSize: 85,
                              )
                            ),                          
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [  
                                icons,                              
                                SizedBox(width: 10,),
                                Container(
                                  margin: EdgeInsets.only(top:20),
                                  child: Text(
                                    description,
                                    style: GoogleFonts.lato(
                                      fontSize: 16,
                                      color: Colors.white,
                                    )
                                  ),
                                ),
                              ],
                            )
                          ],                  
                        ),
                      ],
                    ),
                  ),     
                  Column(
                    children: [
                      Divider(
                        thickness: 2,
                        height: 15,
                        color: Colors.white30,
                      ),
                      Row(                       
                        mainAxisAlignment: MainAxisAlignment.spaceBetween, 
                        children: [
                          Column(                            
                            children: [
                              Text(
                                'AQI(대기질지수)',
                                style: GoogleFonts.lato(
                                  fontSize: 14,
                                  color: Colors.white,
                                ),
                              ),
                              SizedBox(height: 10,),
                              airIcon,
                            ],
                          ),
                          Column(                            
                            children: [
                              Text(
                                '초미세먼지',
                                style: GoogleFonts.lato(
                                  fontSize: 14,
                                  color: Colors.white,
                                ),
                              ),
                              SizedBox(height: 10,),
                              Image.asset(
                                'assets/bad.png',
                                width: 37,
                                height: 35,                                  
                              ),
                              SizedBox(height: 10,),
                              Text(
                                '매우나쁨',
                                style: GoogleFonts.lato(
                                  fontSize: 14,
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          ),
                          Column(                            
                            children: [
                              Text(
                                '미세먼지',
                                style: GoogleFonts.lato(
                                  fontSize: 14,
                                  color: Colors.white,
                                ),
                              ),
                              SizedBox(height: 10,),
                              Text(
                                '174.45',
                                style: GoogleFonts.lato(
                                  fontSize: 24,
                                  color: Colors.white,
                                ),
                              ),
                              SizedBox(height: 10,),
                              Text(
                                '㎍/m3',
                                style: GoogleFonts.lato(
                                  fontSize: 14,
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          )
                        ],                        
                      )
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      )
    );
  }
}
