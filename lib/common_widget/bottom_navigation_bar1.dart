import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:project/screens/approval_page.dart';
import 'package:project/screens/generate_id_page.dart';
import 'package:project/screens/home_page.dart';
import 'package:project/screens/hr_module.dart';

import '../screens/login_page.dart';

class BottomNaviagtionBar1 extends StatefulWidget {
  const BottomNaviagtionBar1({Key? key}) : super(key: key);

  @override
  State<BottomNaviagtionBar1> createState() => _BottomNaviagtionBarState();
}

class _BottomNaviagtionBarState extends State<BottomNaviagtionBar1> {
  int _selectedIndex = 0;
  static const TextStyle optionStyle = TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  static const _pages = <Widget>[
    JoiningPage(),
    GenerateIdPage(),
    ApprovePage(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:Center(
        child: _pages.elementAt(_selectedIndex),
      ),

      bottomNavigationBar:BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
              label:'On Boarding',
              icon: Icon(Icons.nearby_error_outlined,color:Colors.black,)),
          BottomNavigationBarItem(
              label:'Generate ID',
              icon: Icon(Icons.numbers,color:Colors.black,)),
          BottomNavigationBarItem(
              label:'Approval',
              icon: Icon(Icons.approval,color:Colors.black,)),
          BottomNavigationBarItem(
              label:'Appointment',
              icon: Icon(Icons.password,color:Colors.black,)),

        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.black,
        onTap: _onItemTapped,
      ),
    );
  }
}