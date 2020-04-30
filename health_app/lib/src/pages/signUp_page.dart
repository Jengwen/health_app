import 'package:flutter/material.dart';
import '../pages/signIn_page.dart';
import 'package:health_app/src/widgets/SaveButton.dart';

class SignUpPage extends StatefulWidget{
  @override 
  _SignUpPageState createState()=> _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage>{

  bool _toggleVisibilty =false;
  bool _toggleConfirmVisibilty =false;

  //build function for email text field
  Widget _buildEmailField(){
    return TextFormField(
      decoration: InputDecoration(
        hintText: "Email",
        hintStyle: TextStyle(
          color: Colors.grey,
          fontSize: 18,
        ),
      )
    );
  }
  Widget _buildNameField(){
    return TextFormField(
      decoration: InputDecoration(
        hintText: "Name",
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
  //confirm password method
  // build function for password
Widget _buildConfirmPasswordField(){
    return TextFormField(
      decoration: InputDecoration(
        hintText: "confirm password",
        hintStyle: TextStyle(
          color: Colors.grey,
          fontSize: 18,
        ),
        suffixIcon: IconButton(
          onPressed: (){
            setState(() {
              _toggleConfirmVisibilty = !_toggleConfirmVisibilty;
            });
          },
          icon: _toggleConfirmVisibilty ? Icon(Icons.visibility_off) :Icon(Icons.visibility),
          ),
      ),
      obscureText: _toggleVisibilty,
    );
  }

  @override 

  Widget build(BuildContext context){
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget> [
            Text(
              "Sign Up Here", 
              style: TextStyle
              (fontSize: 40, fontWeight:FontWeight.bold
              ),
              ),
              SizedBox(height: 100),
              Card(
                elevation: 5.0,
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    children: <Widget>[
                      _buildNameField(),
                      _buildEmailField(),
                      SizedBox(height: 15),
                      _buildPasswordField(),
                      SizedBox(height: 15),
                      _buildConfirmPasswordField(),
                    ],
                    ),
                ),
              ),
              SizedBox(height: 20),
             SaveButton(),
              Divider(),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text("Already Have an Account?"),

                 GestureDetector(
                   onTap: (){
                     Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (BuildContext context)=>SignInPage()));
                   },
                    child: Text("Sign In", style: TextStyle(color:Colors.lightBlueAccent, fontWeight: FontWeight.bold))),
                ],
                ),
          ],
        ),
        ),
    );
  }
}