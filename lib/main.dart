import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'strings.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:clay_containers/clay_containers.dart';
import 'package:flip_card/flip_card.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:max_size_text/max_size_text.dart';
import 'package:video_player/video_player.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Manuel Guilbert',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        fontFamily: 'school',
      ),
      home: MyHomePage(title: 'Manuel Guilbert'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);


  final String title;


  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> with TickerProviderStateMixin{
  TextStyle white = TextStyle(color:Colors.grey[900],shadows: <Shadow>[
  Shadow(
  offset: Offset(0.0, 0.0,),
      blurRadius: 0.0,
  color:Colors.grey[800],
  ),
  ],);
  String screenType;
  Size screenSize;
  int language=0;
  PageController _controller = PageController(initialPage: 0,viewportFraction: 1.0);
  int page=0;
  double cameraContainerWidth=0;
  double cameraContainerHeight=0;
  double cameraContainerOpacity=0;
  double laptopContainerWidth=0;
  double laptopContainerHeight=0;
  double laptopContainerOpacity=0;
  VideoPlayerController _videoController;
  double thymtrackLogoOpacity=1.0;
  AnimationController _myController;


  @override
  void dispose() {
    _controller.dispose();
    _videoController.dispose();
    super.dispose();
  }
  @override
  void initState() {
    super.initState();
    _myController=AnimationController(
      value:50,
      lowerBound: 50,
      upperBound: 300,
      duration: Duration (seconds:1),
      vsync:this,
    );
    _videoController = VideoPlayerController.asset(
        'images/thymtrack.mp4')
      ..initialize().then((_) {
        // Ensure the first frame is shown after the video is initialized, even before the play button has been pressed.
        setState(() {});
      });
    _videoController.addListener(checkVideo);
  }

  @override
  Widget build(BuildContext context) {

    Color buttonsColor=Colors.blue[500];
    screenType = (MediaQuery.of(context).size.width<1250)?"small":"large";
    screenSize = MediaQuery.of(context).size;


    Widget hello(double size,double textScaleFactor){
      return Container(
        width: size,
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Text(strings['hi'][language],style:white,textScaleFactor: textScaleFactor,textAlign: TextAlign.center,),
              (language==0)?Row(mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(strings['im'][language],style:white,textScaleFactor: textScaleFactor,textAlign: TextAlign.center,),
                  Text(strings['name'][language],style:white,textScaleFactor: textScaleFactor+0.6,textAlign: TextAlign.center,),
                ],
              ):
              Column(mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(strings['im'][language],style:white,textScaleFactor: textScaleFactor,textAlign: TextAlign.center,),
                  Text(strings['name'][language],style:white,textScaleFactor: textScaleFactor+0.6,textAlign: TextAlign.center,),
                ],
              ),

              Image.asset('images/line.png'),
            ],
          ),
        ),
      );}
    Widget thisIsMyFace(double textScaleFactor, double arrowWidth){
      return Row(mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Column(
            children: <Widget>[
              Text(strings['face'][language],textScaleFactor: textScaleFactor,style: TextStyle(color: Colors.black),),
              Text(strings['captcha'][language],textScaleFactor: textScaleFactor-0.3,style: TextStyle(color: Colors.black),textAlign: TextAlign.center,),
            ],
          ),
          Padding(
              padding: const EdgeInsets.only(bottom:40.0),
              child: Image.asset('images/arrowNextB.png',width: arrowWidth,)
          ),

        ],
      );
    }
    Widget laptop(double size, double arrowHeight ,double textScaleFactor){
      return Stack(alignment: Alignment.center,
        children: <Widget>[

          Column(
              children: <Widget>[
                Stack(alignment: Alignment.center,
                  children: <Widget>[

                    InkWell(onTap:(){setState(() {
                      laptopContainerWidth=200;
                      laptopContainerHeight=250;
                      laptopContainerOpacity=1.0;
                    });},child: Image.asset('images/macbook.png',width: size,)),

                  ],
                ),
                Image.asset('images/arrowUp.png',height: arrowHeight,),
                Text(strings['thisIsMyLaptop'][language],textScaleFactor: textScaleFactor,)

              ]),
          InkWell(onTap: (){
            setState(() {
              laptopContainerWidth=0;
              laptopContainerHeight=0;
              laptopContainerOpacity=0;
            });
          },
            child: AnimatedOpacity(opacity: laptopContainerOpacity,
              duration: Duration(milliseconds: 400),
              curve: Curves.linear,
              child: AnimatedContainer(
                decoration: BoxDecoration(
                    boxShadow:[BoxShadow(color:Colors.grey,spreadRadius: 4)],
                    color:Colors.grey[100],
                    borderRadius: BorderRadius.all(Radius.circular(60))),
                curve: Curves.linear,
                duration: Duration(milliseconds: 400),
                child:SingleChildScrollView(
                  child: Column(
                    children: <Widget>[
                      Padding(padding:EdgeInsets.all(15.0),
                        child:Center(child: Text(strings['techs'][language],textScaleFactor: 1.3,textAlign: TextAlign.center,)),),
                      Wrap(alignment: WrapAlignment.center,children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Tooltip(message: 'Flutter is awesome !', 
                              child: Image.asset('images/hflutter.png',height: 50,)),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Tooltip(message: 'Firebase is now my first choice when I need a backend.',
                              child: Image.asset('images/hfirebase.png',height: 50)),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Tooltip(message:strings['openSource'][language],
                              child: Image.asset('images/hgithub.png',height: 50)),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Tooltip(message:'My swiss knife. 10 years together and never let me down.\n🤜✨🤛',child: Image.asset('images/hphotoshop.png',height: 50)),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Tooltip(message:'There is no place like Dribbble to find inspiration.',child: Image.asset('images/hdribbble.png',height: 50)),
                        ),

                      ],)
                    ],
                  ),
                ),

                width:laptopContainerWidth,
                height: laptopContainerHeight,
              ),
            ),
          ),
        ],
      );
    }
    Widget camera(double cameraWidth,double arrowWidth,bool mobile, double textScaleFactor){
      return Stack(alignment: Alignment.center,
        children: <Widget>[

          Column(crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(left:(screenType=='small')?30.0:200),
                child: Text(strings['thisIsMyCamera'][language],textScaleFactor: textScaleFactor,),
              ),
              Padding(
                padding: EdgeInsets.only(left:(screenType=='small')?0.0:250),
                child: Row(mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Image.asset('images/arrowNextDown.png',height: arrowWidth,),
                    Padding(
                      padding: const EdgeInsets.only(top:40.0),
                      child: InkWell(onTap:(){setState(() {
                        cameraContainerWidth=350;
                        cameraContainerHeight=130;
                        cameraContainerOpacity=1.0;
                      });},child: Image.asset('images/camera.png',width: cameraWidth,)),
                    ),
                  ],
                ),
              ),

            ],
          ),
          Padding(
            padding: const EdgeInsets.only(left:100.0),
            child: InkWell(onTap: (){
              setState(() {
                cameraContainerWidth=0;
                cameraContainerHeight=0;
                cameraContainerOpacity=0;
              });
            },
              child: AnimatedOpacity(opacity: cameraContainerOpacity,
                duration: Duration(milliseconds: 400),
                curve: Curves.linear,
                child: AnimatedContainer(
                  decoration: BoxDecoration(
                      boxShadow:[BoxShadow(color:Colors.grey,spreadRadius: 3)],
                      color:Colors.grey[100],
                      borderRadius: BorderRadius.all(Radius.circular(60))),
                  curve: Curves.bounceIn,
                  duration: Duration(milliseconds: 400),
                  child:SingleChildScrollView(
                    child: Column(
                      children: <Widget>[
                        Padding(padding:EdgeInsets.all(15.0),
                          child:Text(strings['photos'][language],textScaleFactor: 1.3,textAlign: TextAlign.center,),)
                      ],
                    ),
                  ),

                  width:cameraContainerWidth,
                  height: cameraContainerHeight,
                ),
              ),
            ),
          ),
        ],
      );
    }
    Widget faceCard(double size){
      return Container(width: size,
        margin: EdgeInsets.only(left: 32.0, right: 32.0, top: 20.0, bottom: 0.0),
        color: Color(0x00000000),
        child: FlipCard(

          direction: FlipDirection.HORIZONTAL,
          speed: 1000,
          onFlipDone: (status) {
            print(status);
          },
          front: Image.asset('images/me.png',height: size,),
          back: Container(width: size,
            child: Stack(alignment: Alignment.center,
              children: <Widget>[
                Image.asset('images/meBack.png',height: size,),
                Padding(
                  padding:  EdgeInsets.only(left:40.0,right:40.0),
                  child: Text(strings['ouch'][language],
                  style: new TextStyle(
                      color: Colors.white,
                      fontSize: 22,
                      fontFamily: 'sun')),
                ),
               // Text(strings['ouch'][language],style: TextStyle(color:Colors.white),),
              ],
            ),
          ),
        ),
      );
    }

    Widget developer(double size,double textScaleFactor){
      return Container(
        width: size,
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Text(strings['description'][language],style:white,textScaleFactor: textScaleFactor,textAlign: TextAlign.justify,),
              Image.asset('images/line.png'),
            ],
          ),
        ),
      );}

    Widget teacher(double size, double textScaleFactor){
      return Container(
        width: size,
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Text(strings['teacher'][language],style:white,textScaleFactor: textScaleFactor,textAlign: TextAlign.justify,),
              Image.asset('images/line.png'),
            ],
          ),
        ),
      );}

    Widget more(double size,double textScaleFactor){
      return Container(
        width: size,
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Text(strings['more'][language],style:white,textScaleFactor: textScaleFactor,textAlign: TextAlign.center,),
              Image.asset('images/line.png'),
            ],
          ),
        ),
      );}




    Widget gitHub(double size,double textScaleFactor){
      return Container(
        width: 400,
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Stack(alignment: Alignment.center,
                    children: <Widget>[
                    Image.asset('images/open.png'),
                    Padding(
                      padding: const EdgeInsets.only(left:100.0,right:100.0,top:10.0),
                      child: Text(strings["openSource"][language],style:white,textScaleFactor: textScaleFactor,textAlign: TextAlign.center,),
                    ),
                  ],),

                ],
              ),

            ],
          ),
        ),
      );}

    Widget techs(double size,double textScaleFactor){
      return Container(
        width: 400,
        color: Colors.grey[900],
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Text(strings["techs"][language],style:white,textScaleFactor: textScaleFactor,textAlign: TextAlign.center,),
              SizedBox(height: 10,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  FlutterLogo(size: 30,),
                  Image.asset("images/android.png",height: 30,),
                  Image.asset("images/firebase.png",height: 30,),
                  Image.asset("images/adobecc.png",height: 30,),
                ],
              )
            ],
          ),
        ),
      );}

    Widget trips(double size,double textScaleFactor){
      Container(
        width: 400,
        color: Colors.grey[900],
        child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text('test')
              ],
            )
        ),
      );}

    Widget contact(double size,double textScaleFactor){
      return Container(
        width: 400,

        child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(strings["talk"][language],style:white,textScaleFactor: textScaleFactor,textAlign: TextAlign.center,),
                Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    /*RaisedButton(hoverColor: Colors.blue[700],
                      shape: RoundedRectangleBorder(
                        borderRadius: new BorderRadius.circular(18.0),
                        side: BorderSide(color: Colors.black),
                      ),color: buttonsColor,child: Icon(Icons.email,color: Colors.white,size: 25,),onPressed: (){_launchURL('mailto:smith@example.org?subject=News&body=New%20plugin');},),*/
                    RaisedButton(hoverColor: Colors.blue[700],
                        shape: RoundedRectangleBorder(
                          borderRadius: new BorderRadius.circular(18.0),
                          side: BorderSide(color: Colors.black),
                        ),color: buttonsColor,child: Image.asset('images/linkedin.png',height: 25,),onPressed: (){_launchURL('https://www.linkedin.com/in/manuel-guilbert-a088a8125/');})
                  ],

                )

              ],
            )
        ),
      );}





      return Scaffold(
        body: Container(
          height: screenSize.height,
          width: screenSize.width,
          color: Colors.grey[100],
          child: Stack(
            children: <Widget>[

              Positioned(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[




                    ///Body


                    Flexible(flex:14,
                      child: PageView(controller: _controller,

                        children: <Widget>[

                          ///Page1
                          ///DESKTOP
                          (screenType=="large")?
                          Stack(alignment: Alignment.topRight,
                            children: <Widget>[
                              Positioned(child: Image.asset('images/randomShape.png')),
                              Positioned(top:20,left:500,child: laptop(150,100,1.5)),
                              Positioned(bottom: 150,left:450,child: camera(80, 50,false, 2.0)),


                              Positioned(bottom:10,right:20,child: Row(
                                children: <Widget>[
                                  more(300,2.0),
                                  InkWell(onTap:(){
                                    _controller.animateToPage(1,duration: Duration(seconds: 1),curve:Curves.decelerate);} ,
                                    child: Stack(alignment: Alignment.center,
                                      children: <Widget>[
                                        Image.asset('images/nextBig.png',width: 180,),
                                        Text(strings["thisWay"][language],textScaleFactor: 2.0,)
                                      ],
                                    ),
                                  )
                                ],
                              )),
                              Positioned(right:(screenSize.width>1600)?300:20,top:20, child: Row(children: <Widget>[
                                Padding(
                                  padding: const EdgeInsets.only(top:100.0),
                                  child: thisIsMyFace(1.5, 100),
                                ),faceCard(370)],)),
                              Positioned(left: (language==0)?screenSize.width/20:screenSize.width/100,
                                child: Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                  children: <Widget>[
                                    hello((language==0)?400:450,(language==0)?2.0:2.0),
                                    developer((language==0)?400:500,(language==0)?2.0:2.0),
                                    teacher((language==0)?400:500,(language==0)?2.0:2.0),


                                  ],
                                ),
                              ),
                             // Positioned(bottom:160,left:180,child: developer(300)),
                             // Positioned(bottom:0,left:180,child: teacher(300)),


                            ],
                          ):///Page1
                          ///MOBILE
                          SingleChildScrollView(
                            child: Stack(alignment: Alignment.topRight,
                              children: <Widget>[
                                Positioned(top:0,right:0,child: Image.asset('images/randomShape.png',width: 500,)),
                                Column(
                                  children: <Widget>[
                                    SizedBox(height: 20,),
                                    hello(500, 2.0),
                                    Column(mainAxisAlignment:MainAxisAlignment.center,children : <Widget>[

                                      faceCard(200),
                                      thisIsMyFace(2.0, 0),
                                    ]),

                                    developer(500, 2.0),
                                    laptop(200, 100, 1.5),
                                    teacher(500, 2.0),
                                    camera(80, 70, true, 1.5),
                                    Row(
                                      mainAxisAlignment:MainAxisAlignment.center,
                                      children: <Widget>[
                                      more(200, 1.5),
                                        InkWell(onTap:(){_controller.animateToPage(1,duration: Duration(seconds: 1),curve:Curves.decelerate);} ,
                                          child: Stack(alignment: Alignment.center,
                                          children: <Widget>[
                                            Image.asset('images/nextBig.png',width: 100,),
                                            Padding(
                                              padding: const EdgeInsets.only(bottom:5.0),
                                              child: Text(strings["thisWay"][language],textScaleFactor: 1.5,),
                                            )
                                          ],
                                      ),
                                        )
                                    ],)
                                  ],
                                ),
                              ],
                            ),
                          ),
                          ///Page2
                          ///DESKTOP
                          (screenType=="large")?
                          Stack(alignment: Alignment.center,
                            children: <Widget>[
                              Positioned(left:0,top:0, child: Image.asset('images/randomShape2.png')),
                              Positioned(left:50,bottom:0, child: Image.asset('images/foregroundTT.png',width: 300,fit:BoxFit.fill)),

                              Positioned(left:50,top:20,
                                    child:Container(
                                      width: 380,
                                      child: Padding(
                                        padding: const EdgeInsets.only(right:30.0),
                                        child: Text(strings['tt1'][language],textScaleFactor: 2.0,style:TextStyle(color:Colors.white),textAlign: TextAlign.center),
                                      )),),

                              Positioned(left:60,top:180,
                                child: Container(height: 200,
                                  child:Column(mainAxisAlignment: MainAxisAlignment.center,
                                    children: <Widget>[
                                      Row(
                                        children: <Widget>[
                                          Text(strings['tt0'][language],textScaleFactor:2.0,style: TextStyle(color: Colors.black),),
                                          Text("ThymTrack",textScaleFactor:2.3,style: TextStyle(color: Colors.white,fontFamily: 'dot'),),
                                        ],
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(left:220.0),
                                        child: Image.asset('images/arrowNextDown.png',width: 170,),
                                      ),

                                    ],
                                  )
                                ),
                              ),


                                   Positioned(left:480,
                                     child: Row(
                                       children: <Widget>[
                                         Container(
                                           height:556,
                                           width:265,
                                           child: Column(mainAxisAlignment: MainAxisAlignment.start,
                                               children:<Widget>[
                                                 Stack(alignment: Alignment.center,
                                                     children: <Widget>[
                                                       Image.asset('images/device.png',fit: BoxFit.contain),
                                                       _videoController.value.initialized
                                                           ? Padding(
                                                         padding: const EdgeInsets.all(0.0),
                                                         child: AspectRatio(
                                                           aspectRatio: 1/1.85,
                                                           child: VideoPlayer(_videoController),
                                                         ),
                                                       )
                                                           : Container(),


                                                       AnimatedOpacity(opacity: thymtrackLogoOpacity,
                                                         duration: Duration(milliseconds: 500),
                                                         child: Container(child:InkWell(
                                                             onTap:  () {
                                                               setState(() {
                                                                 thymtrackLogoOpacity=0.0;
                                                                 _videoController.value.isPlaying
                                                                     ? _videoController.pause()
                                                                     : _videoController.play();
                                                               });
                                                             },
                                                             child: Stack(alignment: Alignment.center,
                                                               children: <Widget>[
                                                                 Image.asset('images/device.png',fit: BoxFit.contain),
                                                                 Image.asset('images/logoTT.png',height: 100,),

                                                               ],
                                                             )),
                                                         ),
                                                       ),
                                                     ])
                                               ]),
                                         ),
                                         Padding(
                                           padding: const EdgeInsets.only(left:8.0),
                                           child: Container(width: 130,
                                             child: Column(children: <Widget>[
                                               Text(strings['tt2'][language],textScaleFactor:1.35,textAlign: TextAlign.justify,),
                                               Text(strings['tt3'][language],textScaleFactor:1.35,textAlign: TextAlign.justify),
                                             ],),

                                           ),
                                         ),
                                       ],
                                     ),
                                   ),


                              Positioned(right:190,top:120,
                                child: Container(
                                    child:Column(mainAxisAlignment: MainAxisAlignment.center,
                                      children: <Widget>[
                                        Text(strings['another'][language],textScaleFactor:1.5,style: TextStyle(color: Colors.black),),
                                        Padding(
                                          padding: const EdgeInsets.only(left:220.0),
                                          child: Image.asset('images/arrowNextDown.png',width: 120,),
                                        ),
                                        SizedBox(height: 140),
                                        Padding(
                                          padding: const EdgeInsets.only(left:220.0),
                                          child: Image.asset('images/arrowNextB.png',width: 120,),
                                        ),
                                        Text(strings['anotherOne'][language],textScaleFactor:1.5,style: TextStyle(color: Colors.black),),
                                      ],
                                    )
                                ),
                              ),

                              Positioned(right:70,top:150,
                                child:Container(
                                  child: Column(mainAxisAlignment: MainAxisAlignment.center,
                                    children: <Widget>[
                                      InkWell(
                                        onTap:(){_launchURL('https://play.google.com/store/apps/details?id=com.appatlas.dice_it');},
                                        child:Image.asset("images/rod.png",height:100),
                                      ),
                                      SizedBox(height: 70,),
                                      InkWell(
                                        onTap:(){_launchURL('https://play.google.com/store/apps/details?id=com.mgdev.led_lamp');},
                                        child:Image.asset("images/bulb.png",height:83),
                                      )
                                    ],

                                  ),
                                )
                              ),

                              Positioned(bottom:10,right:20,child: Row(
                                children: <Widget>[
                                  contact(300,2.0),

                                ],
                              )),





                            ],
                          ):///Page2
                          ///MOBILE
                          SingleChildScrollView(
                            child: Stack(alignment: Alignment.topLeft,
                              children: <Widget>[
                                Positioned(child: Image.asset('images/randomShape2.png')),
                                Column(
                                  children: <Widget>[
                                  Container(

                                  width: 350,
                                  child: Column(mainAxisAlignment: MainAxisAlignment.start,
                                      children:<Widget>[
                                        Text(strings['tt1'][language],textScaleFactor: 2.0,textAlign: TextAlign.center,)
                                      ]),
                                ),

                                    Container(
                                      height:556,
                                      width:265,
                                      child: Column(mainAxisAlignment: MainAxisAlignment.start,
                                          children:<Widget>[
                                            Stack(alignment: Alignment.center,
                                                children: <Widget>[
                                                  Image.asset('images/device.png',fit: BoxFit.contain),
                                                  _videoController.value.initialized
                                                      ? Padding(
                                                    padding: const EdgeInsets.all(0.0),
                                                    child: AspectRatio(
                                                      aspectRatio: 1/1.85,
                                                      child: VideoPlayer(_videoController),
                                                    ),
                                                  )
                                                      : Container(),


                                                  AnimatedOpacity(opacity: thymtrackLogoOpacity,
                                                    duration: Duration(milliseconds: 500),
                                                    child: Container(child:InkWell(
                                                        onTap:  () {
                                                          setState(() {
                                                            thymtrackLogoOpacity=0.0;
                                                            _videoController.value.isPlaying
                                                                ? _videoController.pause()
                                                                : _videoController.play();
                                                          });
                                                        },
                                                        child: Stack(alignment: Alignment.center,
                                                          children: <Widget>[
                                                            Image.asset('images/device.png',fit: BoxFit.contain),
                                                            Image.asset('images/logoTT.png',height: 70,),

                                                          ],
                                                        )),
                                                    ),
                                                  ),
                                                ])
                                          ]),
                                    ),

                                    Container(
                                      width: 350,
                                      child: Column(mainAxisAlignment: MainAxisAlignment.start,
                                          children:<Widget>[
                                            Text(strings['tt2'][language],textScaleFactor: 2.0,)
                                          ]),
                                    ),
                                    SizedBox(height: 50),
                                    Row(mainAxisAlignment: MainAxisAlignment.center,
                                      children: <Widget>[
                                        Container(
                                            child:Column(mainAxisAlignment: MainAxisAlignment.center,
                                              children: <Widget>[
                                                Text(strings['another'][language],textScaleFactor:1.5,style: TextStyle(color: Colors.black),),
                                                Padding(
                                                  padding: const EdgeInsets.only(left:20.0),
                                                  child: Image.asset('images/arrowNextDown.png',width: 120,),
                                                ),
                                                SizedBox(height: 140),
                                                Padding(
                                                  padding: const EdgeInsets.only(left:20.0),
                                                  child: Image.asset('images/arrowNextB.png',width: 120,),
                                                ),
                                                Text(strings['anotherOne'][language],textScaleFactor:1.5,style: TextStyle(color: Colors.black),),
                                              ],
                                            )
                                        ),
                                        Container(
                                            child:Container(
                                              child: Column(mainAxisAlignment: MainAxisAlignment.center,
                                                children: <Widget>[
                                                  InkWell(
                                                    onTap:(){_launchURL('https://play.google.com/store/apps/details?id=com.appatlas.dice_it');},
                                                    child:Image.asset("images/rod.png",height:100),
                                                  ),
                                                  SizedBox(height: 70,),
                                                  InkWell(
                                                    onTap:(){_launchURL('https://play.google.com/store/apps/details?id=com.mgdev.led_lamp');},
                                                    child:Image.asset("images/bulb.png",height:83),
                                                  )
                                                ],

                                              ),
                                            )
                                        ),
                                      ],
                                    ),

                                    contact(300,1.8)

                                  ],
                                ),
                              ],
                            )
                          )
                          //Todo small screentype display







                        ],
                      ),
                    ),

                    ///DESKTOP Footer
                    Flexible(flex:2,
                      child: (screenType!="small")?Stack(
                        children: <Widget>[
                          Positioned(right: 20,bottom: 20,
                            child:_languageItemPopup() ,),
                          /*Positioned(right: 200,bottom: 0,
                            child:Image.asset("images/pen.png",height: 70,) ,),*/
                          Positioned(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Column(
                                  children: <Widget>[
                                    Text('Lille, France',style:white,textScaleFactor: 1.4,),
                                    Row(
                                      children: <Widget>[
                                        FlatButton(
                                          shape: RoundedRectangleBorder(
                                            borderRadius: new BorderRadius.circular(100.0),
                                          ),
                                          color:Colors.transparent,
                                          hoverColor: Colors.blue[300],
                                          onPressed:() {_launchURL('https://github.com/mnlglbrt');
                                          },
                                          child: Padding(
                                            padding: const EdgeInsets.all(10.0),
                                            child: Image.asset('images/githubB.png',height: 40,),
                                          ),
                                        ),
                                        FlatButton(
                                          shape: RoundedRectangleBorder(
                                            borderRadius: new BorderRadius.circular(100.0),
                                          ),
                                          color:Colors.transparent,
                                          hoverColor: Colors.blue[300],
                                          onPressed:() {_launchURL('https://500px.com/mg_photos');
                                          },
                                          child: Padding(
                                            padding: const EdgeInsets.all(10.0),
                                            child: Image.asset('images/500px.png',height: 40,),
                                          ),
                                        ),
                                        FlatButton(
                                          shape: RoundedRectangleBorder(
                                            borderRadius: new BorderRadius.circular(100.0),
                                          ),
                                          color:Colors.transparent,
                                          hoverColor: Colors.blue[300],
                                          onPressed:() {_launchURL('https://dribbble.com/manu101292');
                                          },
                                          child: Padding(
                                            padding: const EdgeInsets.all(10.0),
                                            child: Image.asset('images/dribbble.png',height: 40,),
                                          ),
                                        ),
                                        FlatButton(
                                          shape: RoundedRectangleBorder(
                                            borderRadius: new BorderRadius.circular(100.0),
                                          ),
                                          color:Colors.transparent,
                                          hoverColor: Colors.blue[300],
                                          onPressed:() {_launchURL('https://play.google.com/store/apps/developer?id=App+Atlas');
                                          },
                                          child: Padding(
                                            padding: const EdgeInsets.all(10.0),
                                            child: Image.asset('images/playstore.png',height: 40,),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ):

///MOBILE FOOTER
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          InkWell(child: Image.asset('images/githubB.png',width: 50,),onTap: (){_launchURL('https://github.com/mnlglbrt');},),//goGitHub
                          InkWell(child: Image.asset('images/500px.png',width: 50),onTap: (){_launchURL('https://500px.com/mg_photos');},),//goGitHub
                          InkWell(child: Image.asset('images/dribbble.png',width: 50),onTap: (){_launchURL('https://dribbble.com/manu101292');},),//goGitHub
                          InkWell(child: Image.asset('images/playstore.png',width: 50),onTap: (){_launchURL('https://play.google.com/store/apps/developer?id=App+Atlas');},),//goGitHub
                          _languageItemPopup()
                        ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      );
    }


  Widget _languageItemPopup() => PopupMenuButton(
    color: Colors.white,
    tooltip: "Language",
    itemBuilder: (context) {
      var list = List<PopupMenuEntry<Object>>();
      list.add(
        CheckedPopupMenuItem(
          child: Text(
            "English",
            style: TextStyle(color: Colors.blue)
          ),
          value: 0,

        ),
      );
      list.add(
        CheckedPopupMenuItem(
          child: Text(
            "Français",
            style: TextStyle(color: Colors.blue)
          ),
          value: 1,

        ),
      );
      return list;
    },
    onSelected: (value) {
      setState(() {
        language=value;
      });
      print(value);
    },
    icon: Icon(
      Icons.language,
      size: 30,
      color: (screenType=='small')?Colors.blue:Colors.blue,
    ),
  );

  Future<void> _makePhoneCall(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  void alertOuch(String content) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        // return object of type Dialog
        return AlertDialog(
          elevation: 0,
          backgroundColor: Colors.transparent,
          //title: new Text("Alert Dialog title"),
          content: Container(
            decoration: BoxDecoration(
                color:Colors.grey[100],
                boxShadow:[BoxShadow(color:Colors.grey,spreadRadius: 3)],
                borderRadius: BorderRadius.all(Radius.circular(60))),
              child: Padding(
                padding: const EdgeInsets.all(30.0),
                child: new Text(content,textScaleFactor: 1,),
              )),

        );
      },
    );
  }
  void checkVideo(){
    // Implement your calls inside these conditions' bodies :
    if(_videoController.value.position == Duration(seconds: 0, minutes: 0, hours: 0)) {
      print('video Started');
    }

    if(_videoController.value.position == _videoController.value.duration) {
      print('video Ended');
      setState(() {
        thymtrackLogoOpacity=1.0;
      });
    }

  }
  _launchURL(String destination) async {
    String url = destination;
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

}


