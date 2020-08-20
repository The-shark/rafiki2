import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:shared_preferences/shared_preferences.dart';
import './home.dart';
import './specialists.dart';
import './supportgroup.dart';
import './myprofile.dart';

//void main() => runApp(MaterialApp(home: MyApp()));

class MyApp extends StatefulWidget{
  MyApp({Key key, this.uid}) : super(key: key);
   final String uid; 
@override

  MyAppState createState()=> MyAppState();
}

class MyAppState extends State<MyApp>{
  SharedPreferences preferences;
  String userId;
   FirebaseUser currentUser;
    @override
   void initState() { 
     super.initState();
     initial();
   }
   void initial()async{
preferences = await SharedPreferences.getInstance();
setState(() {
  userId= preferences.getString('id');
});
   }
   void getCurrentUser() async {
    currentUser = await FirebaseAuth.instance.currentUser();
  }
GlobalKey _bottomNavigationKey = GlobalKey();
  int _selectedPage= 0;
  final _pageOptions=[
   HomePage(),
   SpecialistsPage(),
   SupportPage(),
   Profile(),
   

  ];
  @override
  Widget build(BuildContext context){
    return Scaffold(
        //appBar: AppBar(title: Text('Maternal Bot'),),
       
        body:Container( 
          color: Colors.white,
          child: Center(
          child: _pageOptions[_selectedPage],
        ),
        ),
      bottomNavigationBar: SizedBox(
         height: 65,
          child: CurvedNavigationBar(
          key: _bottomNavigationKey,
          //currentIndex : _selectedPage,
          index: 0,
          height: 50.0,
          onTap : (int index) {
            setState(() {
              _selectedPage = index;
            });
          },
        
        items:<Widget> [
         Icon(Icons.home,size: 30),
         Icon(Icons.person,size: 30),
         Icon(Icons.people,size: 30),
         Icon(Icons.account_circle,size: 30),
        ],
        color: Colors.white,
        buttonBackgroundColor: Colors.white,
        backgroundColor: Colors.purple,
        animationCurve: Curves.easeInOut,
        animationDuration: Duration(milliseconds: 600),
        
      ),
      ),
        
        );
      
  
  }
}