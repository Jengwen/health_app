import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:health_app/src/pages/home_page.dart';
import 'package:health_app/src/pages/CreateRecord_page.dart';

class RecordsListPage extends StatefulWidget{
  @override 
  _RecordsListPageState createState()=> _RecordsListPageState();
}

class _RecordsListPageState extends State<RecordsListPage>{

//create url string for api call
final urlString = "https://10.0.2.2:44306/api/Records";

// instansiate a list for employee data
List recordsData;
//create list of pages to navigate between
int currentTabIndex = 0;
List<Widget> pages;
HomePage homePage;
RecordsListPage recordsListPage;
CreateRecordPage createRecordPage;

//variable for current page
Widget currentPage;
// create fture async method to call fro,m api

Future<String> getAllRecords() async{
  var response = await http
  .get(Uri.encodeFull(urlString), headers: {"Accept": "application/json"});

  setState(() {
    var resBody = json.decode(response.body);
      recordsData = resBody[{""}];
    
  });
  return "Success";
}
//@override
void initState(){
  super.initState();
  homePage = HomePage();
    createRecordPage = CreateRecordPage();

    pages =[
     homePage, recordsListPage, createRecordPage
    ];

    currentPage = recordsListPage;
  
this.getAllRecords();
}

//build function to scaffold the container with the list view of records
@override
Widget build(BuildContext context){
return Scaffold(
appBar: AppBar(
  title: Text("Records"),
  backgroundColor: Colors.lightBlue
),
body: ListView.builder(
  itemCount: recordsData == null ? 0 : recordsData.length,
  itemBuilder: (BuildContext context, int index) {
    return Container(
      child: Center(
        child:Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget> [
            Card(
              child: Container(
                child: Text(recordsData[index]["employeeID"])
              )
            )
          ],
        ),
      ),
    );
  },
),
bottomNavigationBar:  BottomNavigationBar(
        onTap: (int index){
          setState(() {
            currentTabIndex = index;
            currentPage = pages[index];
          });
        },
        currentIndex: currentTabIndex,
        //specify type of  navigation bar
        type: BottomNavigationBarType.fixed,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            title: Text("Home")
            ),
             BottomNavigationBarItem(
              icon: Icon(Icons.person),
              title: Text("Records")
              ),
          BottomNavigationBarItem(
              icon: Icon(Icons.add),
              title: Text("Add Record")
              ), 
          
        ],
        ),
);


}


}