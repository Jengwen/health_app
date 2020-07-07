import 'dart:io';

import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
// models needed
import 'package:health_app/src/models/employee_model.dart';
// pages needed 
import '../pages/addEmployee_page.dart';
import '../pages/home_page.dart';

class EmployeeListPage extends StatefulWidget{
  @override 
  _EmployeeListPageState createState()=> _EmployeeListPageState();
}

class _EmployeeListPageState extends State<EmployeeListPage>{

//global key for form drop down 
final formKey = new GlobalKey<FormState>();

//create url string for api call
final urlString = "https://localhost:44306/api/Employees";

// instansiate a list for employee data
List employees = List();
List recordData = List();
String _employeeNameSelected;
//create list of pages to navigate between
int currentTabIndex = 0;
List<Widget> pages;
HomePage homePage;
EmployeeListPage employeeListPage;
//variable for current page
Widget currentPage;


// get all employees from api for dropdown selection
 Future<String> getAllEmployees() async {
    var res = await http
        .get(Uri.encodeFull(urlString), headers: {"Accept": "application/json"});
    var resBody = json.decode(res.body);

    setState(() {
      employees = resBody;
    });

    print(resBody);

    return "Sucess";
  }
//another try at get all employees
Future<Employee>getEmployees() async{
  final response = await http.get(Uri.encodeFull(urlString));
  if(response.statusCode == 200){
    return Employee.fromJson(json.decode(response.body));
  }else{
   throw Exception( "No response from Server");
  }

}


//init state here
@override
  void initState() {

    super.initState();
    this.getEmployees();
   // getAllEmployees();
        homePage = HomePage();
 pages =[
      employeeListPage, homePage
    ];

    currentPage = employeeListPage;
 
  }

Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: Text("Records By Employee")
      ),
      body: Center(
          child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            // button or link to add employee directs user to add employee form
            GestureDetector(
                     onTap: (){
                       Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (BuildContext context)=>AddEmployeePage()));
                     },
                      child: Text("Add New Employee", style: TextStyle(fontSize: 24, color:Colors.lightBlueAccent, fontWeight: FontWeight.bold))),
            Divider(),

            //retrieve records of temperatures by employee ID, get all employee names with getall employees api method
            // drop down of employees by name with see records button that inits the get records by employee ID 
 Container(
                 padding: EdgeInsets.all(16),
                 child: new DropdownButton(
           items: employees.map((item) {
            return new DropdownMenuItem(
              child: new Text(item['name']),
               value: item['id'].toString(),
           );
          }).toList(),
         onChanged: (newVal) {
            setState(() {
              _employeeNameSelected = newVal;
            });
         },
           value: _employeeNameSelected,
// // on pressed will call getEmployee Records to return list

      ),
              ),
             
            // list of records for that employee shows 
              ListView.builder(
                // this is length of list of data returned from Api
                itemCount: recordData == null ? 0 : recordData.length,
                  itemBuilder: (BuildContext context, int index) {
                return Container(
                  child: Center(
                    child:Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: <Widget> [
                        Card(
                          child: Container(
                            child: Text(recordData[index]["employeeID"])
                          )
                        )
                      ],
                    ),
                  ),
                );
              },
                ),

          ],
        ),
      ),
    );
}
}