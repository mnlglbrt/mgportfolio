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


/*
Positioned(left:0,top:0, child: Image.asset('images/storyLine.png',width: screenSize.width,)),

Positioned(left:100,top:50, child: Text('I got a 3 years degree in IT, app development section.\nI learnt JAVA there.\nOr mainly Object Oriented Programmation.',textScaleFactor: 1.5,)),
Positioned(left:200,top:200, child: Text('But then I thought :\n"Why stop studying and do what I love ?\nBetter continue going to the university !"',textScaleFactor: 1.5,)),
Positioned(left:50,bottom:0, child: Text("I've always been the IT guy around me.\nTeaching grandma how to check mails,\n fixing every person I once knew's computer.\nI liked to teach things doing this. \nIT was done, let's learn teaching !",textScaleFactor: 1.5,)),
Positioned(left:600,bottom:50, child: Text("But then, next step is to become a teacher.\n Should have think twice.\n Because that means you are good to go on lifeteime career.\nNot what I wanted.",textScaleFactor: 1.5,)),
Positioned(left:800,top:20, child: Text("So, here I am !\nLeaving my teacher hat, ruler or chalk.\n4 years, that's enough !\n\nLet's get to what lead to this :\nIT and my dream job, app developer.",textScaleFactor: 1.5,)),
Positioned(right:0,bottom:200, child: Text("The good thing is !\nI know better than before \nhow human brain learns stuffs.\nAlso, I need to update my knowledge.\nTime to learn again !\nBut what can I learn to be fit the market ?",textScaleFactor: 1.5,)),

*/
