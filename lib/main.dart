import 'package:flutter/material.dart';
import 'package:clay_containers/clay_containers.dart';

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
  TextStyle white = TextStyle(color:Colors.white);
  String screenType;
  Size screenSize;
  int language=0;
  PageController _controller = PageController(initialPage: 0,);

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
    screenType = (MediaQuery.of(context).size.width<768)?"small":(MediaQuery.of(context).size.width<992)?"medium":"large";
    screenSize = MediaQuery.of(context).size;
    Map strings={
      "find":<String>['Find my work on Google Playstore',"Trouvez moi sur Google Playstore"],
      "hi":<String>["Hi, I'm Manuel Guilbert","Bonjour, je suis Manuel Guilbert"],
      "description":<String>["a  creative and dynamic developer. \nI love working on mobile applications,\nproviding nice UI/UX and features.","un développeur créatif et dynamique. \nJe suis passionné par le développement d'applications,\net la création d'UI/UX et de fonctionnalités ergonomiques."],
      "openSource":<String>["Open source projects are awesome\nand I sometimes contribute to them.","J'adore les projets Open Source\net j'y contribue parfois."],
      "techs":<String>["My loved technologies and tools are :","Mes outils et technos préférés sont :"],
      "travel":<String>["I had the chance to travel in some places\n and praticed languages a lot :\n","J'ai eu la chance de beaucoup voyager\n et de pratiquer les langues étrangères :\n"],
      "frenchEnglish":<String>["French : native           English : fluent","Francais : natif           Anglais : courant"],
      "spanish":<String>["Spanish: B2","Espagnol: B2"],
      "talk":<String>["Lets talk :","Contactez moi :"]
    };



    Widget hello=ClayContainer(
      width: 400,
      color: Colors.grey[900],
      surfaceColor: Colors.grey[900],
      parentColor: Colors.grey[900],
      borderRadius: 20,
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Text(strings['hi'][language],style:white),
                SizedBox(height:70,width:70,child: CircleAvatar(backgroundColor: Colors.indigo,backgroundImage: AssetImage('images/me.jpg'),))
              ],
            ),
            Text(strings['description'][language],style:white)
          ],
        ),
      ),
    );


    Widget gitHub=ClayContainer(
      width: 400,
      color: Colors.grey[900],
      surfaceColor: Colors.grey[900],
      parentColor: Colors.grey[900],
      borderRadius: 20,
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Text(strings["openSource"][language],style:white),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: RaisedButton(hoverColor: Colors.blue[700],
                    shape: RoundedRectangleBorder(
                    borderRadius: new BorderRadius.circular(18.0),
                    side: BorderSide(color: Colors.black),
                  ),
                    color: buttonsColor,child: Row(
                    children: <Widget>[
                      Image.asset('images/github.png',height: 20,),
                      Text(' GitHub',style: white),
                    ],
                  ),onPressed: (){_controller.animateToPage(2, duration: Duration(seconds: 2), curve: Curves.easeIn);},),
                )
              ],
            ),

          ],
        ),
      ),
    );

    Widget techs=ClayContainer(
      width: 400,
      color: Colors.grey[900],
      surfaceColor: Colors.grey[900],
      parentColor: Colors.grey[900],
      borderRadius: 20,
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Text(strings["techs"][language],style:white),
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
    );

    Widget trips=ClayContainer(
      width: 400,
      color: Colors.grey[900],
      surfaceColor: Colors.grey[900],
      parentColor: Colors.grey[900],
      borderRadius: 20,
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Text(strings["travel"][language],style:white),
            Text(strings["frenchEnglish"][language],style:white),
            Text(strings["spanish"][language],style:white),

              ],
            )
      ),
    );

    Widget contact=ClayContainer(
      width: 400,
      color: Colors.grey[900],
      surfaceColor: Colors.grey[900],
      parentColor: Colors.grey[900],
      borderRadius: 20,
      child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(strings["talk"][language],style:white),
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
    );





    return Scaffold(
      body: Container(
        height: screenSize.height,
        width: screenSize.width,
        color: Colors.grey[900],
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            ///Header
            Flexible(flex: 2,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(top:0.0,left:40),
                    child: Text('manuelguilbert',style:white),
                  ),




                  Padding(
                    padding: const EdgeInsets.all(40.0),
                    child: Row(
                      children: <Widget>[
                        Text(strings["find"][language],style:white),
                        SizedBox(height: 40,
                          child: Image.asset('images/playstore.png',),)
                      ],
                    ),
                  ),
                ],
              ),
            ),
            ///Body
            Flexible(flex:12,
              child: PageView(controller: _controller,
                children: <Widget>[
                  SingleChildScrollView(
                    child: Container(
                      child: Padding(
                        padding: const EdgeInsets.all(30.0),
                        child: Center(child:Column(
                          children:(screenType=='small'||screenType=='medium')? <Widget>[
                            hello,
                            SizedBox(height: 20,),
                            gitHub,
                            SizedBox(height: 20,),
                            techs,
                            SizedBox(height: 20,),
                            trips,
                            SizedBox(height: 20,),
                            contact,
                          ]
                              :
                          <Widget>[
                            Row(mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Column(children: <Widget>[
                                  hello,
                                  SizedBox(height: 30,),
                                  trips
                                ],),
                                SizedBox(width: 30,),
                                Column(children: <Widget>[
                                  gitHub,
                                  SizedBox(height: 30,),
                                  techs,
                                  SizedBox(height: 30,),
                                  contact,
                                ],

                                )
                              ],)

                          ],
                        )),
                      ),
                    ),
                  ),//Page1
                  SingleChildScrollView(
                    child: Container(
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Center(child:Column(
                          children:(screenType=='small'||screenType=='medium')? <Widget>[
                            hello,
                            SizedBox(height: 20,),
                            gitHub,
                            SizedBox(height: 20,),
                            techs,
                            SizedBox(height: 20,),
                            trips,
                            SizedBox(height: 20,),
                            contact,
                          ]
                              :
                          <Widget>[
                            Row(mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Column(children: <Widget>[
                                  hello,
                                  SizedBox(height: 30,),
                                  trips
                                ],),
                                SizedBox(width: 30,),
                                Column(children: <Widget>[
                                  gitHub,
                                  SizedBox(height: 30,),
                                  techs,
                                  SizedBox(height: 30,),
                                  contact,
                                ],

                                )
                              ],)

                          ],
                        )),
                      ),
                    ),
                  ),//Page2
                ],
              ),
            ),

            ///Footer
            Flexible(flex:2,
              child: Stack(
                children: <Widget>[
                  Positioned(right: 20,bottom: 20,
                    child:_languageItemPopup() ,),
                  Positioned(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Column(
                          children: <Widget>[
                            Text('Lille, France',style:white),
                            Row(
                              children: <Widget>[
                                FlatButton(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: new BorderRadius.circular(100.0),
                                  ),
                                  color:Colors.transparent,
                                  hoverColor: Colors.grey[850],
                                  onPressed:() {//goGithHub
                                  },
                                  child: Padding(
                                    padding: const EdgeInsets.all(10.0),
                                    child: Image.asset('images/github.png',height: 40,),
                                  ),
                                ),
                                FlatButton(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: new BorderRadius.circular(100.0),
                                  ),
                                  color:Colors.transparent,
                                  hoverColor: Colors.grey[850],
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
                                  hoverColor: Colors.grey[850],
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
                                  hoverColor: Colors.grey[850],
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
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _languageItemPopup() => PopupMenuButton(
    color: Colors.grey[900],
    tooltip: "Language",
    itemBuilder: (context) {
      var list = List<PopupMenuEntry<Object>>();
      list.add(
        CheckedPopupMenuItem(
          child: Text(
            "English",
            style: white
          ),
          value: 0,

        ),
      );
      list.add(
        CheckedPopupMenuItem(
          child: Text(
            "Français",
            style: white
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
      color: Colors.white,
    ),
  );

}


