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
bool contact = false;
bool fever = false;
bool breath = false;
bool taste = false;
bool vord = false;

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
Widget _buildContactBox(){
  return CheckboxListTile(
    title: Text('Have you had contact with anyone who tested positive for COVID-19?'),
    value: contact, 
    onChanged: (bool value){
      setState((){
        contact = value;
      });
    });
}
Widget _buildFeverBox(){
  return CheckboxListTile(
    title: Text('Have you had a fever in the last 48 hours?'),
    value: fever, 
    onChanged: (bool value){
      setState((){
        fever = value;
      });
    });
}
Widget _buildBreathBox(){
  return CheckboxListTile(
    title: Text('Are you experiencing shortness of breath, cough, or sore throat?'),
    value: breath, 
    onChanged: (bool value){
      setState((){
        breath = value;
      });
    });
}
Widget _buildTasteBox(){
  return CheckboxListTile(
    title: Text('Have you had a new loss of taste or smell?'),
    value: taste, 
    onChanged: (bool value){
      setState((){
        taste = value;
      });
    });
}
Widget _buildVorDBox(){
  return CheckboxListTile(
    title: Text('Have you had vomiting or diarrhea in the last 24 hours?'),
    value: vord, 
    onChanged: (bool value){
      setState((){
        vord = value;
      });
    });
}

  @override 


  Widget build(BuildContext context){
    return Scaffold(
    appBar: AppBar(title: Text("Add Record"),
    centerTitle: true,),
      body: Container(
        
        margin: EdgeInsets.all(14),
        child: Form(
          key: _formKey,
          child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget> [
            _buildNameField(),
            _buildUnitField(),
            _buildDateField(),
            _buildTempField(),
            _buildContactBox(),
            _buildFeverBox(),
            _buildBreathBox(),
            _buildTasteBox(),
            _buildVorDBox(),
            SizedBox(height: 10,),
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