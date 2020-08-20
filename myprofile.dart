import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:maternalbot/updateUserProfile/editProfile.dart';


class Profile extends StatefulWidget {
  Profile({Key key}) : super(key: key);

  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  
  bool _status = true;
   final FocusNode myFocusNode = FocusNode();

    @override
  void initState() {
    super.initState();
  }
 final db = Firestore.instance;
Future<DocumentSnapshot> getUserInfo()async{
var firebaseUser = await FirebaseAuth.instance.currentUser();
return await Firestore.instance.collection("teenagers").document(firebaseUser.uid).get();
}
  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      appBar: new AppBar(
        backgroundColor:Colors.purple,
        centerTitle:true,
        title: Text('My Profile')
      ),
       body:SingleChildScrollView(
         child:FutureBuilder(
          future: getUserInfo(),
           builder: (context,AsyncSnapshot<DocumentSnapshot> snapshot){
             if(snapshot.connectionState == ConnectionState.done){
               var userDocument = snapshot.data;
               return Column(
            children: <Widget>[

                 Padding(
           padding: EdgeInsets.symmetric(horizontal:25.0),),
               Center(
                 child: Container(
                   alignment: Alignment.center,
                   height:100,
                   width:150,
                   margin: EdgeInsets.only(bottom:40.0, top:20),
                   decoration:BoxDecoration(
                     borderRadius: BorderRadius.circular(10.0),
                    color: Colors.deepPurple.shade600,
                    boxShadow: [
                      BoxShadow(
                          color: Color.fromRGBO(13, 51, 32, 0.1),
                          offset: Offset(0.0,6.0),
                          blurRadius: 10.0,
                      ),
                    ],
                   ),
                   child: Text(
                     userDocument["name"],
                     style: TextStyle(color:Colors.white, fontSize: 22.0 )
                   ),
                 ),
               ),
               Padding(
                          padding: EdgeInsets.only(
                              left: 25.0, right: 25.0, top: 25.0,bottom:10),
                          child: new Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            mainAxisSize: MainAxisSize.max,
                            children: <Widget>[
                              new Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                mainAxisSize: MainAxisSize.min,
                                children: <Widget>[
                                  new Text(
                                    'Personal Information',
                                    style: TextStyle(
                                        fontSize: 18.0,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                              new Column(
                                mainAxisAlignment: MainAxisAlignment.end,
                                mainAxisSize: MainAxisSize.min,
                                children: <Widget>[
                                  _status ? _getEditIcon() : new Container(),
                                ],
                              )
                            ],
                          )),
               Row(
                 children: <Widget>[
                   Expanded(
                     child: Container(
                       padding: EdgeInsets.symmetric(
                         horizontal:10.0, vertical: 20.0
                       ), 
                  margin: EdgeInsets.only(bottom:40.0),
                  decoration: BoxDecoration(
                    borderRadius:BorderRadius.circular(10.0),
                    color: Colors.white,
                    boxShadow:[
                      BoxShadow(
                        color: Color.fromRGBO(13,51, 32, 0.1),
                        offset: Offset(0.0, 0.6),
                        blurRadius: 10.0,
                      ),
                    ],
                  ),
                  child:Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      
                      Container(
                        margin: EdgeInsets.only(bottom:20.0),
                        child: Text('Name',
                        style:TextStyle(
                          color:Colors.black,
                          fontSize:18.0,
                          fontStyle: FontStyle.italic,
                          fontWeight:FontWeight.w600
                        ),),
                      ),
                      Container(
                        margin: EdgeInsets.only(bottom:20.0),
                        child: new Text(
                                 userDocument["name"],
                                  style:TextStyle(
                          color:Colors.black,
                          fontSize:20.0,
                          fontWeight:FontWeight.w600
                        ),
                                

                                ),
                      ),
                      Container(
                        margin: EdgeInsets.only(bottom:10.0),
                        child: Text('How I reach you',
                        style:TextStyle(
                          color:Colors.black,
                          fontSize:18.0,
                          fontStyle: FontStyle.italic,
                          fontWeight:FontWeight.w600
                        ),),
                      ),
                       Container(
                        margin: EdgeInsets.only(bottom:20.0),
                       child: new Text(
                         userDocument["email"],
                                   style:TextStyle(
                          color:Colors.black,
                          fontSize:20.0,
                          fontWeight:FontWeight.w600
                        ),
                                ),
                       
                      ),
                      
                    ],
                    
                  ),
                  
                   ),),
                 ],
               ),
           
                  !_status ? _getActionButtons() : new Container(),
             ], 

         );
             }else{
               return new Text("Loading");
             }
           }
         
        
         ),
         ),
         );
           
       
    
  }
   Widget _getEditIcon() {
    return new GestureDetector(
      child: new CircleAvatar(
        backgroundColor: Colors.purple,
        radius: 14.0,
        child: new Icon(
          Icons.edit,
          color: Colors.white,
          size: 16.0,
        ),
      ),
      onTap: () {
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => UpdateTeen()));
          
      },
    );
  }
  Widget _getActionButtons() {
    return Padding(
      padding: EdgeInsets.only(left: 25.0, right: 25.0, top: 45.0),
      child: new Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Expanded(
            child: Padding(
              padding: EdgeInsets.only(right: 10.0),
              child: Container(
                  child: new RaisedButton(
                child: new Text("Update"),
                textColor: Colors.white,
                color: Colors.green,
                onPressed: () {
                  setState(() {
                    _status = true;
                    FocusScope.of(context).requestFocus(new FocusNode());
                  });
                },
                shape: new RoundedRectangleBorder(
                    borderRadius: new BorderRadius.circular(20.0)),
              )),
            ),
            flex: 2,
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.only(left: 10.0),
              child: Container(
                  child: new RaisedButton(
                child: new Text("Cancel"),
                textColor: Colors.white,
                color: Colors.red,
                onPressed: () {
                  setState(() {
                    _status = true;
                    FocusScope.of(context).requestFocus(new FocusNode());
                  });
                },
                shape: new RoundedRectangleBorder(
                    borderRadius: new BorderRadius.circular(20.0)),
              )),
            ),
            flex: 2,
          ),
        ],
      ),
    );
  }
  
}
