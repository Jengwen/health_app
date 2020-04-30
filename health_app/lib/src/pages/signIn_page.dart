import 'package:flutter/material.dart';
import 'package:health_app/src/widgets/SaveButton.dart';
import '../pages/signUp_page.dart';
import '../pages/home_page.dart';

class SignInPage extends StatefulWidget{
  @override 
  _SignInPageState createState()=> _SignInPageState();
}

class _SignInPageState extends State<SignInPage>{

  bool _toggleVisibilty =false;
  //build function for email text field
  Widget _buildEmailField(){
    return TextFormField(
      decoration: InputDecoration(
        hintText: "Email or username",
        hintStyle: TextStyle(
          color: Colors.grey,
          fontSize: 18,
        ),
      )
    );
  }
// build function for password
Widget _buildPasswordField(){
    return TextFormField(
      decoration: InputDecoration(
        hintText: "password",
        hintStyle: TextStyle(
          color: Colors.grey,
          fontSize: 18,
        ),
        suffixIcon: IconButton(
          onPressed: (){
            setState(() {
              _toggleVisibilty = !_toggleVisibilty;
            });
          },
          icon: _toggleVisibilty ? Icon(Icons.visibility_off) :Icon(Icons.visibility),
          ),
      ),
      obscureText: _toggleVisibilty,
    );
  }

  @override 

  Widget build(BuildContext context){
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget> [
            Text(
              "Sign In", 
              style: TextStyle
              (fontSize: 40, fontWeight:FontWeight.bold
              ),
              ),
              SizedBox(height: 100),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  Text("Forgotten Password?", style: TextStyle(color:Colors.grey, fontSize:18),)
                ],
              ),
              SizedBox(height: 10),
              Card(
                elevation: 5.0,
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    children: <Widget>[
                      _buildEmailField(),
                      SizedBox(height: 15),
                      _buildPasswordField()
                    ],
                    ),
                ),
              ),
              SizedBox(height: 20),
              GestureDetector(
                onTap: (){
                     Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (BuildContext context)=>HomePage()));
                   },
                child: SaveButton(
                  btnText: "Sign In"),
                ),
              Divider(),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text("Don't Have an Account?"),
                  GestureDetector(
                    onTap: (){
                      Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (BuildContext context)=>SignUpPage()));
                    },
                      child: Text("Sign Up",
                     style: TextStyle(
                       color:Colors.lightBlueAccent, fontWeight: FontWeight.bold),
                       ),
                  ),
                ],
                ),
          ],
        ),
        ),
    );
  }
}