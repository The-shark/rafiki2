import 'package:flutter/material.dart';
import 'package:maternalbot/counselors/counselorspage.dart';
import 'package:maternalbot/doctors/doctorspage.dart';

class SpecialistsPage extends StatefulWidget {
  SpecialistsPage({Key key}) : super(key: key);

  @override
  _SpecialistsPageState createState() => _SpecialistsPageState();
}

class _SpecialistsPageState extends State<SpecialistsPage> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      // appBar: new AppBar(
      //   title:new Text("Get help from professionals"),
      // ),

      body: Container(
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(right: 240, top: 90, bottom: 5),
                child: Text(
                  'Need Help?',
                  style: new TextStyle(
                    fontSize: 30.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 16, top: 30, bottom: 5),
                child: Text(
                  'Just know it\'s okay to feel the way you are feeling right now',
                  style: new TextStyle(
                    fontSize: 22.0,
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
                        'Volunteer Doctors',
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
                                  builder: (context) => DoctorsPage()));
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
                          'Get in touch with our volunteer doctors for help',
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
                        'Volunteer Counsellors',
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
                                  builder: (context) => CounselorsPage()));
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
                              'Get in touch with our volunteer counsellors for help',
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
