import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class NavDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor:Colors.white,
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            child:Image.asset('assets/logo.png'),
          ),
          ListTile(
            leading: Icon(Icons.dashboard),
            title: Text('Dashboard', style: TextStyle(
              fontWeight:FontWeight.bold,
              fontFamily: 'Gilroy',
              color: Colors.black,
              fontSize: 25.sp,
            ),),
            onTap: () => {},
          ),
        ],
      ),
    );
  }
}