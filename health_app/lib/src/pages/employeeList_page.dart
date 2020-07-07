import 'package:flutter/material.dart';


// pages needed 
import '../pages/addEmployee_page.dart';

class EmployeeListPage extends StatefulWidget{
  @override 
  _EmployeeListPageState createState()=> _EmployeeListPageState();
}

class _EmployeeListPageState extends State<EmployeeListPage>{
  @override 
Widget build(BuildContext context){
    return Scaffold(
      body: ListView(
        scrollDirection: Axis.vertical,
        children: <Widget>[
          // button or link to add employee directs user to add employee form
          GestureDetector(
                   onTap: (){
                     Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (BuildContext context)=>AddEmployeePage()));
                   },
                    child: Text("Add New Employee", style: TextStyle(fontSize: 24, color:Colors.lightBlueAccent, fontWeight: FontWeight.bold))),
          Divider(),
          //list of employess by unit with temperatures 

        ],
      ),
    );
}
}