import 'package:flutter/material.dart';
import 'package:health_app/src/pages/employeeList_page.dart';
import 'package:health_app/src/pages/signUp_page.dart';
//import pages
import '../pages/home_page.dart';
import '../pages/signIn_page.dart';
import '../pages/employeeList_page.dart';
import '../pages/CreateRecord_page.dart';
import '../pages/addEmployee_page.dart';
import '../pages/signUp_page.dart';

class MainScreen extends StatefulWidget{
  @override 

  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State <MainScreen>{

int currentTabIndex = 0;
//create list of pages to navigate between
List<Widget> pages;
//variable for current page
Widget currentPage;
//create instance of home page
HomePage homePage;
SignInPage signInPage;
SignUpPage signUpPage;
EmployeeListPage employeeListPage;
CreateRecordPage createRecordPage;
AddEmployeePage addEmployeePage;


  @override 

  void initState(){
    super.initState();
    homePage = HomePage();
    signInPage = SignInPage();
    createRecordPage = CreateRecordPage();
    
    pages =[
      homePage, signInPage, createRecordPage
    ];

    currentPage = homePage;
  }

  Widget build(BuildContext context){
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
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
              title: Text("Sign In")
              ),
          BottomNavigationBarItem(
              icon: Icon(Icons.add),
              title: Text("Add Record")
              ), 
        ],
        ),
        body: currentPage,
    );

    
  }
}