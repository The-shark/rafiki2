import 'package:flutter/material.dart';
import 'package:shifting_tabbar/shifting_tabbar.dart';
import './stories/stories.dart';
import './teenagechat/chatteenager.dart';


class SupportPage extends StatefulWidget{
  @override
  SupportPageState createState()=>SupportPageState();
}

class SupportPageState extends State<SupportPage >{
 build(context) {
  
    return Scaffold(
      appBar: new AppBar(
       title:new Text("Support Group"),
       centerTitle: true,
       elevation: 0.0,
       backgroundColor:Colors.purple,),
      // Define a controller for TabBar and TabBarViews
      body: DefaultTabController(
        length: 2,
        
        child: Scaffold(
          // Use ShiftingTabBar instead of appBar
          appBar: ShiftingTabBar(
            // Specify a color to background or it will pick it from primaryColor of your app ThemeData
            color: Colors.purple,
            // You can change brightness manually to change text color style to dark and light or 
            // it will decide based on your background color
            // brightness: Brightness.dark,
            tabs: [
              // Also you should use ShiftingTab widget instead of Tab widget to get shifting animation
              ShiftingTab(
                icon: Icon(Icons.people),
                text: "Stories",
              ),
              ShiftingTab(
                icon: Icon(Icons.chat),
                text: "Chat"
              ),
              
            ],
          ),
          // Other parts of the app are exacly same as default TabBar widget
          body:
           TabBarView(
            children: <Widget>[
            Stories(),
            ChatScreen(),
            ],
          ),
        ),
      ),
    );
  }
}