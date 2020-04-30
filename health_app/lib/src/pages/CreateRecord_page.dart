import 'package:flutter/material.dart';


class CreateRecordPage extends StatefulWidget{
  @override 
  _CreateRecordState createState()=> _CreateRecordState();
}

class _CreateRecordState extends State<CreateRecordPage>{

String name;
String unit;
String date;
String temp;

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
Widget _buildDateField(){
  return TextFormField(
    decoration: InputDecoration(labelText: "Today's Date"),
    keyboardType: TextInputType.datetime,
    validator: (String value){
    },
    onSaved: (String value){
      setState(() {
        date = value;
      });
    },
  );
}
Widget _buildTempField(){
  return TextFormField(
    decoration: InputDecoration(labelText: 'Temperature'),
    keyboardType: TextInputType.number,
    validator: (String value){
          int temp = int.tryParse(value);
    },
    onSaved: (String value){
      setState(() {
        temp = value;
      });
    },
  );
}

  @override 
Widget build(BuildContext context){
    return Scaffold(
    appBar: AppBar(title: Text("Add Record"),
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
            _buildDateField(),
            _buildTempField(),
            SizedBox(height: 20,),
            RaisedButton(
              child: Text("Save", style:TextStyle(fontSize: 18, fontWeight:FontWeight.bold, color: Colors.white)),
              onPressed: (){
              if(!_formKey.currentState.validate()){
              return;
              }
              _formKey.currentState.save();
              },)
          ]
        ))
      ),  
    );
}
}