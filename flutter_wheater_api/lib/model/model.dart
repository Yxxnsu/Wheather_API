import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

class Model {

  Widget getWeatherIcon(int condition){

    print(condition);

    if(condition < 300){
      return SvgPicture.asset(
        'svg/climacon-cloud_lightning.svg',
        color: Colors.black87,
      );
    }
    else if(condition < 600 ){
      return SvgPicture.asset(
        'svg/climacon-cloud_snow_alt.svg',
        color: Colors.black87,
      );
    }
    else if(condition == 800 ){
      return SvgPicture.asset(
        'svg/climacon-sun_alt.svg',
        color: Colors.black87,
      );
    }
    else if(condition <= 804 ){
      return SvgPicture.asset(
        'svg/climacon-cloud_sun.svg',
        color: Colors.black87,
      );
    }
    return Container();
  }

  Widget getAirIcon(int index){

    if(index == 1){
      return Column(
        children: [
          Image.asset(
            'assets/good.png',
            width: 37,
            height: 35,
          ),
          SizedBox(height: 10,),
          Text(
            '매우좋음',
            style: GoogleFonts.lato(
              color: Colors.white,
              fontSize: 14,
            )
          ),
        ],
      );
    }
    else if(index == 2){
      return Column(
        children: [
          Image.asset(
            'assets/fair.png',
            width: 37,
            height: 35,
          ),
          SizedBox(height: 10,),
          Text(
            '좋음',
            style: GoogleFonts.lato(
              color: Colors.white,
              fontSize: 14,
            )
          ),
        ],
      );
    }
    else if(index == 3){
      return Column(
        children: [
          Image.asset(
            'assets/moderate.png',
            width: 37,
            height: 35,
          ),
          SizedBox(height: 10,),
          Text(
            '보통',
            style: GoogleFonts.lato(
              color: Colors.white,
              fontSize: 14,
            )
          ),
        ],
      );
    }
    else if(index == 4){
      return Column(
        children: [
          Image.asset(
            'assets/poor.png',
            width: 37,
            height: 35,
          ),
          SizedBox(height: 10,),
          Text(
            '조금나쁨',
            style: GoogleFonts.lato(
              color: Colors.white,
              fontSize: 14,
            )
          ),
        ],
      );
    }
    else if(index == 5){
      return Column(
        children: [
          Image.asset(
            'assets/bad.png',
            width: 37,
            height: 35, 
          ),          
          SizedBox(height: 10,),
          Text(
            '매우나쁨',
            style: GoogleFonts.lato(
              color: Colors.white,
              fontSize: 14,
            )
          ),
        ],
      );
    }
    return Container();
  }
}