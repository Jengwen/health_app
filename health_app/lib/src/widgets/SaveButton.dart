import 'package:flutter/material.dart';

class SaveButton extends StatelessWidget{


final String btnText;

SaveButton({this.btnText});

@override

Widget build(BuildContext context){
return  Container(
                height: 50,
                decoration: BoxDecoration(
                  color: Colors.lightBlueAccent,
                  borderRadius: BorderRadius.circular(25)
                  ),
                  child: Center(
                    child: Text(
                      btnText,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                        color: Colors.white),
                    ),
                  ),
              );
}
}