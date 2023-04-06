import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:project/screens/attendence_page.dart';
import 'package:project/screens/login_page.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../common_widget/menu_bar.dart';
import '../utils/util.dart';
import 'directory_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late SharedPreferences prefs;
  late var times;
  late var times1;
  late var times3;
  String d="";
  Future<Null> getSharedPrefs() async {
   prefs = await SharedPreferences.getInstance();

  }
  @override
  initState() {
    getSharedPrefs();
    super.initState();
  }
  TextEditingController _controller = TextEditingController();
  final Stopwatch _stopwatch = Stopwatch();
  late Timer _timer;
  String _result = "00:00:00";
  int count=0;
  String time="Clock In";
  DateTime now = new DateTime.now();
  DateTime now1=new DateTime.now();
  void _start() {
    // Timer.periodic() will call the callback function every 100 milliseconds
    _timer = Timer.periodic(const Duration(milliseconds: 30), (Timer t) {
      // Update the UI
      setState(() {
        // result in hh:mm:ss format
        _result =
            '${_stopwatch.elapsed.inHours.toString().padLeft(2, '0')}:${(_stopwatch.elapsed.inMinutes).toString().padLeft(2, '0')}:${(_stopwatch.elapsed.inSeconds % 60).toString().padLeft(2, '0')}';

        //times=TimeOfDay(hour:_stopwatch.elapsed.inHours, minute:_stopwatch.elapsed.inMinutes);
      });
    });
    // Start the stopwatch
    _stopwatch.start();
  }

  // This function will be called when the user presses the Stop button
  void _stop() {
    _timer.cancel();
    _stopwatch.stop();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(
          automaticallyImplyLeading: false,
          iconTheme: IconThemeData(color: Colors.black),
          title: Row(
            children: [
              GestureDetector(
                onTap: () {
                  Dialog errorDialog = Dialog(
                    insetPadding:
                    EdgeInsets.only(bottom: 530, right: 140.w, left: 10.w),
                    shape: RoundedRectangleBorder(
                        borderRadius:
                        BorderRadius.circular(0.0)), //this right here
                    child: Container(
                      height: 180.0,
                      width: 60.0,
                      color: Colors.white,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Padding(
                            padding: EdgeInsets.only(left: 20.w, top: 20.h),
                            child: Row(
                              children: [
                                Icon(Icons.person, color: Colors.black),
                                SizedBox(
                                  width: 10.w,
                                ),
                                TextButton(
                                  onPressed: () {},
                                  child: Text(
                                    'Profile',
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontFamily: 'Gilroy',
                                      color: Colors.black,
                                      fontSize: 15.sp,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Divider(
                            color: Colors.black,
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 20.w, top: 20.h),
                            child: Row(
                              children: [
                                Icon(Icons.power_settings_new,
                                    color: Colors.black),
                                SizedBox(
                                  width: 10.w,
                                ),
                                TextButton(
                                  onPressed: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                          const LoginPage()),
                                    );
                                  },
                                  child: Text(
                                    'Logout',
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontFamily: 'Gilroy',
                                      color: Colors.black,
                                      fontSize: 15.sp,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                  showDialog(
                      context: context,
                      builder: (BuildContext context) => errorDialog);
                },
                child: CircleAvatar(
                  backgroundColor: Colors.white,
                  radius: 20,
                  child: Image.asset(
                    'assets/user.jpg',
                    width: 20.w,
                  ),
                ),
              ),
              SizedBox(width:5.w,),
              Image.asset(
                'assets/loading.png',
                height: 34.h,
              ),
              SizedBox(
                width: 2.w,
              ),
              Text(
                'Envision',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Gilroy',
                  color: Colors.white,
                  fontSize: 15.sp,
                ),
              ),
              SizedBox(
                width:5.w,
              ),
                  Container(
                    width:90.w,
                    height:40.h,
                    decoration: BoxDecoration(
                      color:Colors.black,
                      borderRadius: BorderRadius.circular(30.r),
                    ),
                  child:Row(
                    children:[
                  IconButton(
                    icon: const Icon(
                      Icons.access_time_filled_outlined,
                      color: Colors.white,
                    ),
                    onPressed:(){
                      setState(() {
                        count++;
                      });
                      if(count%2!=0) {
                        _start();
                        DateTime now = new DateTime.now();
                        setState(() {
                          time="Clock Out";
                          times=DateFormat.jm().format(now);
                        });
                        ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                                content: Text('Clock in')
                            ),
                            );
                        Util.startTime.add(times);
                        prefs.setStringList("string23", Util.startTime);
                      }
                      else if(count%2==0){
                        _stop();
                        setState(() {
                          time="Clock In";
                        });
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                              content: Text('Clock Out')
                          ),
                        );
                        DateTime now = new DateTime.now();
                        setState(() {
                          d=times.difference(times1);
                          times1=DateFormat.jm().format(now);
                        });
                       // Util.Eff.add(d);
                        Util.EndTime.add(times1);
                        Util.Eff.add(d);
                        prefs.setStringList("string6",Util.Eff);
                        prefs.setStringList("string145", Util.EndTime);
                      }
                    },
                  ),
                  Padding(padding:EdgeInsets.only(top:10.h),
                  child:Column(
                    children:[
                      Text(
                        time,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Gilroy',
                          color: Colors.white,
                          fontSize:12.sp,
                        ),
                      ),
                  SizedBox(height:2.h,),
                  Text(
                    _result,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Gilroy',
                      color: Colors.white,
                      fontSize:12.sp,
                    ),
                  ),
                  ],
                  ),
                  ),
      ],
                  ),
                  ),
                  SizedBox(height:10.h,width:2.w,),
              Icon(Icons.notifications_none, color: Colors.white),
              IconButton(
                  icon: const Icon(
                    Icons.settings,
                    color: Colors.white,
                  ),
                  onPressed: () {
                    // Dialog errorDialog = Dialog(
                    //   insetPadding: EdgeInsets.only(bottom: 390),
                    //   shape: RoundedRectangleBorder(
                    //       borderRadius:
                    //           BorderRadius.circular(0.0)), //this right here
                    //   child: Container(
                    //     height: 260.0,
                    //     width: 380.0,
                    //     color: Colors.blue,
                    //     child: Column(
                    //       mainAxisAlignment: MainAxisAlignment.start,
                    //       crossAxisAlignment: CrossAxisAlignment.start,
                    //       children: <Widget>[
                    //         Padding(
                    //           padding: EdgeInsets.only(left: 20.w, top: 20.h),
                    //           child: Text(
                    //             'Hi Envision!',
                    //             style: TextStyle(
                    //               fontWeight: FontWeight.bold,
                    //               fontFamily: 'Gilroy',
                    //               color: Colors.white,
                    //               fontSize: 25.sp,
                    //             ),
                    //           ),
                    //         ),
                    //         Padding(
                    //           padding: EdgeInsets.only(
                    //               left: 20.w, top: 20.h, right: 30.w),
                    //           child: TextField(
                    //             keyboardType: TextInputType.visiblePassword,
                    //             textAlign: TextAlign.start,
                    //             cursorColor: Colors.black,
                    //             style: const TextStyle(
                    //               color: Colors.black,
                    //             ),
                    //             decoration: InputDecoration(
                    //               hintText: 'Search Employees',
                    //               filled: true,
                    //               hintStyle: TextStyle(
                    //                 color: Colors.black,
                    //                 fontFamily: 'Gilroy',
                    //               ),
                    //             ),
                    //           ),
                    //         ),
                    //         Padding(
                    //           padding: EdgeInsets.only(
                    //             left: 200.w,
                    //             top: 60.h,
                    //           ),
                    //           child: Row(
                    //             children: [
                    //               Icon(Icons.notifications_none,
                    //                   color: Colors.white),
                    //               SizedBox(
                    //                 width: 10.w,
                    //               ),
                    //               SizedBox(
                    //                 width: 10.w,
                    //               ),
                    //               Icon(Icons.settings, color: Colors.white),
                    //               CircleAvatar(
                    //                 backgroundColor: Colors.white,
                    //                 radius: 20,
                    //                 child: Image.asset(
                    //                   'assets/user.jpg',
                    //                   width: 20.w,
                    //                 ),
                    //               ),
                    //             ],
                    //           ),
                    //         ),
                    //       ],
                    //     ),
                    //   ),
                    // );
                    // showDialog(
                    //     context: context,
                    //     builder: (BuildContext context) => errorDialog);
                  }),

            ],
          ),
          centerTitle: true,
          backgroundColor: Colors.blue[800]),
      body: ListView(
        children: [
          Padding(
            padding: EdgeInsets.only(left: 20.w, right: 20.w),
            child: Row(
              children: [
                InkWell(
                  onTap: () async {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const DirectoryPage()),
                    );
                  },
                  child: Container(
                    height: 130.h,
                    width: 90.w,
                    padding:
                        EdgeInsets.symmetric(horizontal: 25.w, vertical: 20.h),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(
                          height: 10.h,
                        ),
                        Image.asset(
                          'assets/book.png',
                          width: 50.w,
                          color: Colors.orange,
                        ),
                        Text(
                          'Directory',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontFamily: 'Gilroy',
                            color: Colors.black,
                            fontSize: 9.sp,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                InkWell(
                  onTap: () async {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const AttendencePage()),
                    );
                  },
                  child: Container(
                    height: 130.h,
                    width: 90.w,
                    padding:
                        EdgeInsets.symmetric(horizontal: 25.w, vertical: 20.h),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(
                          height: 10.h,
                        ),
                        Image.asset(
                          'assets/calendar.png',
                          width: 80.w,
                          color: Colors.blue,
                        ),
                        Text(
                          'Attendence',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontFamily: 'Gilroy',
                            color: Colors.black,
                            fontSize: 8.sp,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Container(
                  height: 140.h,
                  width: 90.w,
                  padding:
                      EdgeInsets.symmetric(horizontal: 25.w, vertical: 20.h),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: 10.h,
                      ),
                      Image.asset(
                        'assets/payslip.png',
                        width: 50.w,
                        color: Colors.greenAccent,
                      ),
                      Text(
                        'Payslip',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Gilroy',
                          color: Colors.black,
                          fontSize: 9.sp,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 20.w, right: 20.w),
            child: Row(
              children: [
                Container(
                  height: 130.h,
                  width: 90.w,
                  padding:
                      EdgeInsets.symmetric(horizontal: 25.w, vertical: 20.h),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: 10.h,
                      ),
                      Image.asset(
                        'assets/report.png',
                        width: 50.w,
                        color: Colors.orangeAccent,
                      ),
                      Text(
                        'Reports',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Gilroy',
                          color: Colors.black,
                          fontSize: 10.sp,
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  height: 130.h,
                  width: 90.w,
                  padding:
                      EdgeInsets.symmetric(horizontal: 25.w, vertical: 20.h),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: 10.h,
                      ),
                      Image.asset(
                        'assets/payroll.png',
                        width: 80.w,
                        color: Colors.blue,
                      ),
                      Text(
                        'Payroll',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Gilroy',
                          color: Colors.black,
                          fontSize: 10.sp,
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  height: 130.h,
                  width: 90.w,
                  padding:
                      EdgeInsets.symmetric(horizontal: 25.w, vertical: 20.h),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: 10.h,
                      ),
                      Image.asset(
                        'assets/expenses.png',
                        width: 50.w,
                        color: Colors.greenAccent,
                      ),
                      Text(
                        'Expense',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Gilroy',
                          color: Colors.black,
                          fontSize: 10.sp,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 20.w, right: 20.w),
            child: Row(
              children: [
                Container(
                  height: 130.h,
                  width: 90.w,
                  padding:
                      EdgeInsets.symmetric(horizontal: 25.w, vertical: 20.h),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: 10.h,
                      ),
                      Image.asset('assets/exit.png',
                          width: 50.w, color: Colors.orange),
                      Text(
                        'Leave',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Gilroy',
                          color: Colors.black,
                          fontSize: 10.sp,
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  height: 130.h,
                  width: 100.w,
                  padding:
                      EdgeInsets.symmetric(horizontal: 25.w, vertical: 20.h),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: 10.h,
                      ),
                      Image.asset(
                        'assets/notification.png',
                        width: 80.w,
                        color: Colors.blue[800],
                      ),
                      Text(
                        'Notifications',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Gilroy',
                          color: Colors.black,
                          fontSize: 9.sp,
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  height: 140.h,
                  width: 90.w,
                  padding:
                      EdgeInsets.symmetric(horizontal: 25.w, vertical: 20.h),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: 10.h,
                      ),
                      Image.asset(
                        'assets/company.png',
                        width: 50.w,
                        color: Colors.green,
                      ),
                      Text(
                        'Company Profile',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Gilroy',
                          color: Colors.black,
                          fontSize: 9.sp,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
