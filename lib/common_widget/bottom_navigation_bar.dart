import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:project/screens/home_page.dart';
import 'package:project/screens/hr_module.dart';

import '../screens/login_page.dart';

class BottomNaviagtionBar extends StatefulWidget {
  const BottomNaviagtionBar({Key? key}) : super(key: key);

  @override
  State<BottomNaviagtionBar> createState() => _BottomNaviagtionBarState();
}

class _BottomNaviagtionBarState extends State<BottomNaviagtionBar> {
  int _selectedIndex = 0;
  static const TextStyle optionStyle = TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  static const _pages = <Widget>[
    HomePage(),
    JoiningPage(),
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
              label:'Dashboard',
              icon: Icon(Icons.monitor)),
          BottomNavigationBarItem(
              label:'Master',
              icon: Icon(Icons.person,color:Colors.black,)),
          BottomNavigationBarItem(
              label:'Subscription',
              icon: Icon(Icons.people,color:Colors.black,)),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.black,
        onTap: _onItemTapped,
      ),
    );
  }
}