import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:maternalbot/journal/journalPage.dart';
import 'package:maternalbot/mood/sentiment.dart';
import 'package:maternalbot/mood/views/moodview.dart';
import 'package:maternalbot/rafikiIntegration.dart';
import 'package:maternalbot/selfcare/selfcare.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomePage extends StatefulWidget {
  final ValueSetter<SentimentRecording> onSelected;
  HomePage({Key key, this.onSelected}) : super(key: key);

  @override
  HomePageState createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  SharedPreferences preferences;
  String teenName;

  @override
  void initState() { 
    super.initState();
    initial();
  }
void initial()async{
  preferences = await SharedPreferences.getInstance();
  setState(() {
    teenName=preferences.getString('name');
  });
}
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      

      body: Container(
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(right: 240, top: 70, bottom: 5),
                child: Text(
                  'Hey $teenName,',
                  style: new TextStyle(
                    fontSize: 30.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              
              Padding(
                padding:
                    const EdgeInsets.only(top: 20, left: 10.0, right: 10.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    new Padding(
                      padding: const EdgeInsets.only(bottom: 5, left: 20.0),
                      child: Text(
                        'How are you today?',
                        style: new TextStyle(
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Container(
                      width: 430,
                      height: 100,
                      child: GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => MoodView()));
                        },
                        child: Card(
                          elevation: 8,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15.0),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.only(
                                bottom: 30, top: 20, left: 10.0),
                            child: Text(
                              'Check in and record your mood today ',
                              style: new TextStyle(
                                fontSize: 20.0,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.only(top: 20, left: 10.0, right: 10.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    new Padding(
                      padding: const EdgeInsets.only(bottom: 5, left: 20.0),
                      child: Text(
                        'Self Care',
                        style: new TextStyle(
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Container(
                      width: 430,
                      height: 100,
                      child: GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => SelfCare()));
                        },
                    child:Card(
                      elevation: 8,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15.0),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(
                            bottom: 30, top: 20, left: 10.0),
                        child: Text(
                          'Watch videos, read articles,and listen to music',
                          style: new TextStyle(
                            fontSize: 20.0,
                          ),
                        ),
                      ),
                    ),),),
                  ],
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.only(top: 20, left: 10.0, right: 10.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    new Padding(
                      padding: const EdgeInsets.only(bottom: 5, left: 20.0),
                      child: Text(
                        'Journal',
                        style: new TextStyle(
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Container(
                      width: 430,
                      height: 100,
                      child: GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => JournalPage()));
                        },
                        child: Card(
                          elevation: 8,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15.0),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.only(
                                bottom: 30, top: 20, left: 10.0),
                            child: Text(
                              'What are your thoughts today?',
                              style: new TextStyle(
                                fontSize: 20.0,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.only(top: 20, left: 10.0, right: 10.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    new Padding(
                      padding: const EdgeInsets.only(bottom: 5, left: 20.0),
                      child: Text(
                        'Discover',
                        style: new TextStyle(
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Container(
                        width: 430,
                        height: 100,
                        child: GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Rafiki()));
                        },
                        child: Card(
                          elevation: 8,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15.0),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.only(
                                bottom: 30, top: 20, left: 10.0),
                            child: Text(
                              'What would you like to ask about PAC?',
                              style: new TextStyle(
                                fontSize: 20.0,
                              ),
                            ),
                          ),
  ),
  ),
  ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
