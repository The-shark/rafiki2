import 'package:flutter/material.dart';
import 'package:getflutter/getflutter.dart';
import 'package:maternalbot/professionalhome.dart';
import 'package:maternalbot/teenagerhome.dart';




class WelcomePage extends StatefulWidget {
  @override
  _WelcomePageState createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  Widget _backButton() {
    return InkWell(
      onTap: () {
        Navigator.pop(context);
      },
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 10),
        child: Row(
          children: <Widget>[
            Container(
              padding: EdgeInsets.only(left: 0, top: 10, bottom: 10),
              child: Icon(Icons.keyboard_arrow_left, color: Colors.black),
            ),
            Text('Back',
                style: TextStyle(fontSize: 12, fontWeight: FontWeight.w500))
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
           
       
      body: Container(
        
        color: Colors.white24,
        child: Column(
          children: <Widget>[
            SizedBox(
                            height: 50,
                          ),
             Positioned(top: 40, left: 0, child: _backButton()),
             SizedBox(
                            height: 100,
                          ),
            Text(
              "Hey There!",
              style: TextStyle(
                fontSize: 30.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: Divider(
                thickness: 3,
              ),
            ),
            SizedBox(
              width: 20,
              height: 50,
            ),
            Container(
              height: 80,
              child: GFButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>WelcomeProfessional()));
                },
                child: new Text(
                  "I AM A PROFESSIONAL",
                  style: new TextStyle(
                    fontSize: 20.0,
                  ),
                ),
                shape: GFButtonShape.pills,
                elevation: 10,
                blockButton: true,
                size: GFSize.MEDIUM,
                color: Colors.purple[300],
              ),
            ),
             SizedBox(
                            height: 50,
                          ),
            Container(
              height: 80,
              child: GFButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => WelcomeTeenager()));
                },
                child: new Text(
                  "I AM A TEENAGER",
                  style: new TextStyle(
                    fontSize: 20.0,
                  ),
                ),
                shape: GFButtonShape.pills,
                elevation: 10,
                blockButton: true,
                size: GFSize.MEDIUM,
                color: Colors.purple[300],
              ),
            ),
             SizedBox(
                          
                            height: 50,
                          ),
            
           
          ],
        ),
      ),
      );
  }
}
