import 'package:flutter/material.dart';



//create homescreen class
class HomePage extends StatefulWidget{
@override
  _HomePageState createState()=> _HomePageState();

}


class _HomePageState extends State<HomePage>{
  @override 
 
Widget build (BuildContext context){
  return Scaffold(
    body: Padding(
      padding: const EdgeInsets.symmetric(vertical:18.0),
      child: ListView(
        children: <Widget>[
          Center(
            child: Text("Health Record", 
            style: TextStyle(
              fontSize:24,
              fontWeight: FontWeight.bold),
              ),
          ),
//List of action items in button like format
          Column(
           
            children: <Widget>[
            SizedBox(height: 30),  
            Card(
             margin: EdgeInsets.symmetric(horizontal: 30), 
             color: Colors.lightBlue, 
             child: 
             
             Row(
               children: <Widget>[
                 Padding(
                   padding:const EdgeInsets.symmetric(vertical:30, horizontal:30)),
                 Text("Start a New Record", 
                 style:TextStyle(
                   fontSize: 24, fontWeight: FontWeight.bold, color: Colors.white),),  
               ],
             ),
        
            ),
            SizedBox(height: 30),  
            Card(
             margin: EdgeInsets.symmetric(horizontal: 30), 
             color: Colors.lightBlue, 
             child: 
             
             Row(
               children: <Widget>[
                 Padding(
                   padding:const EdgeInsets.symmetric(vertical:30, horizontal:30)),
                 Text("Report By Employee", 
                 style:TextStyle(
                   fontSize: 24, fontWeight: FontWeight.bold, color: Colors.white),),  
               ],
             ),
        
            ),
            SizedBox(height: 30),  
            Card(
             margin: EdgeInsets.symmetric(horizontal: 30), 
             color: Colors.lightBlue, 
             child: 
             
             Row(
               children: <Widget>[
                 Padding(
                   padding:const EdgeInsets.symmetric(vertical:30, horizontal:30)),
                 Text("Report By Date", 
                 style:TextStyle(
                   fontSize: 24, fontWeight: FontWeight.bold, color: Colors.white),),  
               ],
             ),
        
            ),
            ]
          ),

        ],
      ),
    ),
  );
}
}