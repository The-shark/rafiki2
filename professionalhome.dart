import 'package:flutter/material.dart';
import 'package:getflutter/getflutter.dart';
import 'package:maternalbot/authentication/logincounselor.dart';
import 'package:maternalbot/authentication/logindoctor.dart';
import 'package:maternalbot/authentication/registerCounselor.dart';
import 'package:maternalbot/authentication/registerDoctor.dart';




class WelcomeProfessional extends StatefulWidget {
  @override
  _WelcomeProfessionalState createState() => _WelcomeProfessionalState();
}

class _WelcomeProfessionalState extends State<WelcomeProfessional> {
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
              "Welcome back,",
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
              height: 20,
            ),
            
            
            Container(
              height: 50,
              child: GFButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => LoginDoctor()));
                },
                child: new Text(
                  "SIGN IN AS DOCTOR",
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
              height: 50,
              child: GFButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => RegisterDoctor()));
                },
                child: new Text(
                  "REGISTER AS DOCTOR",
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
              height: 50,
              child: GFButton(
                onPressed: () {
                   Navigator.push(context,
                      MaterialPageRoute(builder: (context) => LoginCounselor()));
                },
                child: new Text(
                  "SIGN IN AS COUNSELOR",
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
              height: 50,
              child: GFButton(
                onPressed: () {
                   Navigator.push(context,
                      MaterialPageRoute(builder: (context) => RegisterCounselor()));
                },
                child: new Text(
                  "REGISTER AS COUNSELOR",
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
          
          ],
        ),
      ),
      );
  }
}
