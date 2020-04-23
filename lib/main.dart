import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'strings.dart';
import 'package:url_launcher/url_launcher.dart';


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
        fontFamily: 'sun',
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

class _MyHomePageState extends State<MyHomePage> {
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
  PageController _controller = PageController(initialPage: 0,);
  int page=0;

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    Color buttonsColor=Colors.blue[500];
    screenType = (MediaQuery.of(context).size.width<1250)?"small":"large";
    screenSize = MediaQuery.of(context).size;



    Widget thisIsMyFace(double textScaleFactor, double arrowWidth){
      return Row(mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Column(
            children: <Widget>[
              Text(strings['face'][language],textScaleFactor: textScaleFactor,style: TextStyle(color: Colors.black),),
              Text(strings['captcha'][language],textScaleFactor: textScaleFactor-0.5,style: TextStyle(color: Colors.black),textAlign: TextAlign.center,),
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
      return Column(
          children: <Widget>[
            Image.asset('images/macbook.png',width: size,),
            Image.asset('images/arrowUp.png',height: arrowHeight,),
            Text(strings['thisIsMyLaptop'][language],textScaleFactor: textScaleFactor,)

          ]);
    }

    Widget camera(double cameraWidth,double arrowWidth,bool mobile, double textScaleFactor){
      return Column(
              children: <Widget>[
                Text(strings['thisIsMyCamera'][language],textScaleFactor: textScaleFactor,),
            Padding(
              padding: EdgeInsets.only(left:250),
              child: Row(mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Image.asset('images/arrowNextDown.png',height: arrowWidth,),
                  Padding(
                    padding: const EdgeInsets.only(top:40.0),
                    child: Image.asset('images/camera.png',width: cameraWidth,),
                  ),
                ],
              ),
            ),

              ],
      );
    }
Widget face(double size){
  return
  Stack(alignment: Alignment.center,
    children: <Widget>[
      Container(

        padding: EdgeInsets.all(10),
        height:size ,
        width:size,
        decoration: BoxDecoration(
         // borderRadius: BorderRadius.all(Radius.circular(60)),
          image: DecorationImage(image:AssetImage('images/me.jpg'),),
          //boxShadow:[BoxShadow(color:Colors.white,spreadRadius: 3)],
        ),),
      Padding(
        padding: const EdgeInsets.only(top:20.0),
        child: InkWell(onTap: (){alertOuch(strings['ouch'][language]);},
            child: Image.asset("images/pola.png",height:size+100)),
      ),
    ],
  );}

    Widget developer(double size,double textScaleFactor){
      return Container(
        width: size,
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Text(strings['description'][language],style:white,textScaleFactor: textScaleFactor,textAlign: TextAlign.center,),
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
              Text(strings['teacher'][language],style:white,textScaleFactor: textScaleFactor,textAlign: TextAlign.center,),
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

    Widget hello(double size,double textScaleFactor){
      return Container(
        width: size,
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Text(strings['hi'][language],style:white,textScaleFactor: textScaleFactor,textAlign: TextAlign.center,),
              Row(mainAxisAlignment: MainAxisAlignment.center,
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


      Widget gitHub(double size,double textScaleFactor){
      return Container(
        width: size,
        color: Colors.grey[900],
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Text(strings["openSource"][language],style:white,textScaleFactor: textScaleFactor,textAlign: TextAlign.center,),
                  SizedBox(width: 160,
                    child: RaisedButton(hoverColor: Colors.blue[700],
                      shape: RoundedRectangleBorder(
                        borderRadius: new BorderRadius.circular(18.0),
                        side: BorderSide(color: Colors.black),
                      ),
                      color: buttonsColor,child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Image.asset('images/github.png',height: 20,),
                          Text(' GitHub',style: white),
                        ],
                      ),onPressed: (){},),
                  )
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
                Text(strings["travel"][language],style:white,textScaleFactor: textScaleFactor,textAlign: TextAlign.center,),
                Text(strings["frenchEnglish"][language],style:white,textScaleFactor: textScaleFactor,textAlign: TextAlign.center,),
                Text(strings["spanish"][language],style:white,textScaleFactor: textScaleFactor,textAlign: TextAlign.center,),

              ],
            )
        ),
      );}

      Widget contact(double size,double textScaleFactor){
      return Container(
        width: 400,
        color: Colors.grey[900],
        child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(strings["talk"][language],style:white,textScaleFactor: textScaleFactor,textAlign: TextAlign.center,),
                Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    RaisedButton(hoverColor: Colors.blue[700],
                      shape: RoundedRectangleBorder(
                        borderRadius: new BorderRadius.circular(18.0),
                        side: BorderSide(color: Colors.black),
                      ),color: buttonsColor,child: Icon(Icons.email,color: Colors.white,size: 25,),onPressed: (){},),
                    RaisedButton(hoverColor: Colors.blue[700],
                        shape: RoundedRectangleBorder(
                          borderRadius: new BorderRadius.circular(18.0),
                          side: BorderSide(color: Colors.black),
                        ),color: buttonsColor,child: Image.asset('images/linkedin.png',height: 25,),onPressed: (){})
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
              Positioned(child:Container( height: screenSize.height,
                  width: screenSize.width,child: Image.asset("images/dots.png",repeat: ImageRepeat.repeat,))),
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
                          Stack(alignment: Alignment.center,
                            children: <Widget>[
                              Positioned(child: (screenSize.width>1600)?Image.asset('images/pens.png',width: 300,):Container()),
                              Positioned(right:0,top:0, child: Image.asset('images/randomShape.png')),
                              Positioned(top:20,left:500,child: laptop(150,150,2.0)),
                              Positioned(bottom: 150,left:450,child: camera(80, 100,false, 2.0)),


                              Positioned(bottom:10,right:20,child: Row(
                                children: <Widget>[
                                  more(300,3),
                                  Stack(alignment: Alignment.center,
                                    children: <Widget>[
                                      Image.asset('images/nextBig.png',width: 180,),
                                      Text(strings["thisWay"][language],textScaleFactor: 2.0,)
                                    ],
                                  )
                                ],
                              )),
                              Positioned(right:0,top:0, child: Row(children: <Widget>[
                                Padding(
                                  padding: const EdgeInsets.only(top:100.0),
                                  child: thisIsMyFace(1.7, 100),
                                ),face(300)],)),
                              Positioned(left: (language==0)?screenSize.width/20:screenSize.width/100,
                                child: Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                  children: <Widget>[
                                    hello((language==0)?400:450,(language==0)?3:2.5),
                                    developer((language==0)?400:500,(language==0)?3:2.5),
                                    teacher((language==0)?400:500,(language==0)?3:2.5),


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

                                      face(200),
                                      thisIsMyFace(2.0, 0),
                                    ]),

                                    developer(500, 2.0),
                                    teacher(500, 2.0),
                                    Row(
                                      mainAxisAlignment:MainAxisAlignment.center,
                                      children: <Widget>[
                                      more(200, 2.0),Stack(alignment: Alignment.center,
                                        children: <Widget>[
                                          Image.asset('images/nextBig.png',width: 160,),
                                          Padding(
                                            padding: const EdgeInsets.only(bottom:5.0),
                                            child: Text(strings["thisWay"][language],textScaleFactor: 2.0,),
                                          )
                                        ],
                                      )
                                    ],)
                                  ],
                                ),
                              ],
                            ),
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
                          Positioned(right: 200,bottom: 0,
                            child:Image.asset("images/pen.png",height: 70,) ,),
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
                                          onPressed:() {//goGithHub
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
                                          onPressed:() {//goLinkedIn
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
                                          onPressed:() {//goDribbble
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
                                          onPressed:() {//goPlaystore
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
      color: (screenType=='small')?Colors.black:Colors.deepOrange,
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
          //title: new Text("Alert Dialog title"),
          content: new Text(content,textScaleFactor: 4,),

        );
      },
    );
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


