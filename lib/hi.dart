import 'package:flutter/material.dart';
import 'strings.dart';
int language=0;
TextStyle black = TextStyle(color: Colors.black);
Widget hello(double size,double textScaleFactor){
  return Container(
    width: size,
    child: Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Text(strings['hi'][language],style:black,textScaleFactor: textScaleFactor,textAlign: TextAlign.center,),
          Row(mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(strings['im'][language],style:black,textScaleFactor: textScaleFactor,textAlign: TextAlign.center,),
              Text(strings['name'][language],style:black,textScaleFactor: textScaleFactor+0.6,textAlign: TextAlign.center,),
            ],
          ),

          Image.asset('images/line.png'),
        ],
      ),
    ),
  );}
