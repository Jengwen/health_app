import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'dart:convert';
import 'dart:async';


class AddEmployeePage extends StatefulWidget{
  @override 
  _AddEmployeePageState createState()=> _AddEmployeePageState();
}

class _AddEmployeePageState extends State<AddEmployeePage>{

String name;
String unit;

//create global key
final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

// method to build form field

Widget _buildNameField(){
  return TextFormField(
    decoration: InputDecoration(labelText: 'Employee Name'),
    validator:(String value){
      if(value.isEmpty){
        return 'Name is required';
      }
    },
    onSaved: (String value){
      setState(() {
        name = value;
      });
    },
  );
}
Widget _buildUnitField(){
  return TextFormField(
    decoration: InputDecoration(labelText: 'Unit Number'),
    keyboardType: TextInputType.number,
    validator: (String value){
          int unit = int.tryParse(value);
    },
    onSaved: (String value){
      setState(() {
        unit = value;
      });
    },
  );
}

//api method to post new employee to database


  @override 
  
Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(title: Text("Add Employee"),
      centerTitle: true,),
      body: Container(
        margin: EdgeInsets.all(24),
        child: Form(
          key: _formKey,
          child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget> [
            _buildNameField(),
            _buildUnitField(),
            SizedBox(height: 20,),
            RaisedButton(
              child: Text("Save", style:TextStyle(fontSize: 18, fontWeight:FontWeight.bold, color: Colors.white)),
              onPressed: (){
              if(!_formKey.currentState.validate()){
              return;
              }
              //thisa is where call the post method to save employee to database
              _formKey.currentState.save();
              },)
          ]
        ))
      ),
    );
}
}