import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_switch/flutter_switch.dart';

import 'logs_page.dart';

class AttendencePage extends StatefulWidget {
  const AttendencePage({Key? key}) : super(key: key);

  @override
  State<AttendencePage> createState() => _AttendencePageState();
}

class _AttendencePageState extends State<AttendencePage> {
  bool status = false;
  bool isSwitched = false;
  var textValue = 'Switch is OFF';

  void toggleSwitch(bool value) {

    if(isSwitched == false)
    {
      setState(() {
        isSwitched = true;
        textValue = 'Switch Button is ON';
      });
      print('Switch Button is ON');
    }
    else
    {
      setState(() {
        isSwitched = false;
        textValue = 'Switch Button is OFF';
      });
      print('Switch Button is OFF');
    }
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length:4,
        child:Scaffold(
      appBar:AppBar(
        backgroundColor: Colors.blue[800],
        bottom:TabBar(
          tabs: [
            Tab(text: "Logs",),
            if(status==true)
            Tab(text: "Approval"),
          ],
        ),
        centerTitle:true,
        title:Row(
        children:[
        Text('Attendance', style: TextStyle(
          fontFamily: 'Gilroy',
          color: Colors.white,
          fontSize: 16.sp,
        ),),
          SizedBox(width:50.w,),
          Padding(padding:EdgeInsets.only(top:20.h,bottom:20.h),
          child:Container(
          child:FlutterSwitch(
            activeText:'Manager',
            inactiveText:'User',
            width: 70.0.w,
            height: 40.0.h,
            activeColor:Colors.cyan,
            activeTextColor:Colors.black,
            valueFontSize: status==false ? 14.0.sp:12.sp,
            toggleSize: 15.0.r,
            value: status,
            borderRadius: 15.0.r,
            padding: 8.0,
            showOnOff: true,
            onToggle: (val) {
              setState(() {
                status = val;
              });
            },
          ),
          ),
          ),
        ],
      ),
    ),
          body:TabBarView(
            children:[
             LogsPage(),
          ],
          ),
        ),
    );
  }
}
