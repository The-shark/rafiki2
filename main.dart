import 'package:avatar_glow/avatar_glow.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:maternalbot/delayed_animation.dart';
import 'package:maternalbot/usermanual/usermanual.dart';
import 'package:maternalbot/welcome.dart';

void main(){ 
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setEnabledSystemUIOverlays([]);
   runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> with SingleTickerProviderStateMixin {
  final int delayedAmount=500;
  double _scale;
  AnimationController _controller;

  @override
  void initState(){
    _controller = AnimationController(
      vsync: this,
      duration: Duration(
        milliseconds: 200,
      ),
      lowerBound: 0.0,
      upperBound: 0.1
    )..addListener((){
      setState((){});
    });
    super.initState();
  }
  @override 
  Widget build(BuildContext context) {
    final color = Colors.white;
    _scale =1 - _controller.value;
    return MaterialApp(
     
      home:Builder(
        builder: (context) =>Scaffold(
       backgroundColor: Colors.purple[200],
      body: Center(
        child: Column(
          children:<Widget>[
            AvatarGlow(
                endRadius: 90,
                duration: Duration(seconds: 2),
                glowColor: Colors.white24,
                repeat: true,
                repeatPauseDuration: Duration(seconds: 2),
                startDelay: Duration(seconds: 1),
              child: Material(
                elevation: 8.0,
                shape: CircleBorder(),
                child: CircleAvatar(
                  backgroundColor: Colors.grey[100],
                  child: FlutterLogo(
                    size: 50.0,
                  ),
                  radius: 50.0,
                ),
              ), 
          ),
          DelayedAnimation(
            child:Text("Hey There",
            style:TextStyle(
              fontWeight: FontWeight.bold,
            fontSize: 35.0,
            color: color),
            ),
            delay: delayedAmount+1000,
          ),
          DelayedAnimation(
            child:Text("I'm Rafiki",
            style:TextStyle(
              fontWeight: FontWeight.bold,
            fontSize: 35.0,
            color: color),
            ),
            delay: delayedAmount+1000,
          ),
          SizedBox(
            height: 30.0,
          ),
          DelayedAnimation(
            child:Text("Your companion",
            style:TextStyle(
              fontWeight: FontWeight.bold,
            fontSize:20.0,
            color: color),
            ),
            delay: delayedAmount+1000,
          ),
          DelayedAnimation(
            child:Text("along this journey",
            style:TextStyle(
              fontWeight: FontWeight.bold,
            fontSize: 20.0,
            color: color),
            ),
            delay: delayedAmount+1000,
          ),
          SizedBox(
            height: 100.0,
          ),
          DelayedAnimation(
            child:GestureDetector(
              onTapDown: _onTapDown,
              onTapUp: _onTapUp,
               onTap: (){
            Navigator.push(context,
                      MaterialPageRoute(
                          builder: (context) => UserManual()));
          },
              child: Transform.scale(scale: _scale,
              child: _animatedButtonUI),
            ),
            delay: delayedAmount+4000,
          ),
          SizedBox(height:50.0,),
          DelayedAnimation(
            child:InkWell(
              onTap: (){
            Navigator.push(context,
                      MaterialPageRoute(
                          builder: (context) => WelcomePage()));
          },
            child:Text("I Already have an Account".toUpperCase(),
            style:TextStyle(
              fontWeight: FontWeight.bold,
            fontSize:20.0,
            color: color),
            
            ),
            
          ),
           delay: delayedAmount+5000,
          ),
          ]
        ),
      ),
      
      ),
      ),
    );
  }
  Widget get _animatedButtonUI=> Container(
    height: 60,
    width: 270,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(100.0),
      color: Colors.white,
    ),
    child: Center(
      child: GestureDetector(
    child: Text(
            'Hi Rafiki',
            style: TextStyle(
              fontSize: 20.0,
              fontWeight: FontWeight.bold,
              color: Color(0xFF8185E2),
            ),
           
          ),
          onTap: (){
            Navigator.push(context,
                      MaterialPageRoute(
                          builder: (context) => UserManual()));
          },
        ),
    ),
      );

  void _onTapDown(TapDownDetails details) {
    _controller.forward();
  }

  void _onTapUp(TapUpDetails details) {
    _controller.reverse();
  }
}
