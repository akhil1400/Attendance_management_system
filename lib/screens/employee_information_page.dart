import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:project/http_call/get.dart';
import 'package:project/screens/home_page.dart';
import 'package:project/screens/hr_module.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../common_widget/bottom_navigation_bar.dart';
import '../common_widget/bottom_navigation_bar1.dart';
import '../models/model.dart';
import '../utils/util.dart';

class EmployeePage extends StatefulWidget {
  const EmployeePage({Key? key}) : super(key: key);

  @override
  State<EmployeePage> createState() => _LoginPageState();
}

class _LoginPageState extends State<EmployeePage> {
  bool passwordVisible = false;
  Future<LoginModel>? _login;

  late SharedPreferences prefs;
  late final times;
  Future<Null> getSharedPrefs() async {
    prefs = await SharedPreferences.getInstance();

  }
  @override
  void initState() {
    getSharedPrefs();
    super.initState();
    passwordVisible = true;
  }

  TextEditingController _controller = TextEditingController();
  TextEditingController _controller1 = TextEditingController();
  TextEditingController _controller2 = TextEditingController();
  TextEditingController _controller3 = TextEditingController();
  TextEditingController _controller4 = TextEditingController();
  TextEditingController _controller5 = TextEditingController();
  TextEditingController _controller6 = TextEditingController();
  TextEditingController _controller7 = TextEditingController();

  var location = ['Hydrebad', 'Pune', 'Banglore', 'Chennai'];
  String dropdownvalue = "Hydrebad";
  var manager=['Somesh','Rajesh','Rohit'];
  String dropdownvalues="Somesh";
  var Dep=['IT','Recurting'];
  String dep="IT";
  var deg=['IT','Recurting'];
  String degs="IT";
  var Type=['Permanent','Contract'];
  String type="Permanent";

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
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Employee Details',
          style: TextStyle(
            fontFamily: 'Gilroy',
            color: Colors.white,
            fontSize: 20.sp,
          ),
        ),
        backgroundColor: Color(0xff0077b5),
        centerTitle: true,
      ),
      body: Center(
        child: ListView(
          children: [
            Expanded(
              child: Padding(
                padding: EdgeInsets.only(left: 10.w, right: 10.w, top: 20.h),
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        height: 970.h,
                        width: ScreenUtil().screenWidth,
                        padding: EdgeInsets.symmetric(
                            horizontal: 0.w, vertical: 10.h),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20.r),
                          color: Colors.white,
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Padding(
                              padding: EdgeInsets.only(top: 2.h),
                              child:Center(
                              child:Text(
                                'Employee Information',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontFamily: 'Gilroy',
                                  color: Colors.black,
                                  fontSize: 17.sp,
                                ),
                              ),
                            ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(
                                  left: 10.w,
                                  top: 20.h,
                                  right: 5.w,
                                  bottom: 5.h),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'First Name',
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontFamily: 'Gilroy',
                                          color: Colors.black,
                                          fontSize: 15.sp,
                                        ),
                                      ),
                                      SizedBox(
                                        height: 10.h,
                                      ),
                                      Container(
                                        width: 140.w,
                                        height: 50.h,
                                        child: TextField(
                                          controller: _controller,
                                          textAlign: TextAlign.start,
                                          cursorColor: Colors.black,
                                          style: const TextStyle(
                                            color: Colors.black,
                                          ),
                                          decoration: InputDecoration(
                                            enabledBorder: OutlineInputBorder(
                                              borderSide: BorderSide(
                                                width: 1,
                                                color: Colors.black,
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(5),
                                            ),
                                            focusedBorder: OutlineInputBorder(
                                              borderSide: BorderSide(
                                                  width: 1,
                                                  color: Colors.black),
                                              borderRadius:
                                                  BorderRadius.circular(5),
                                            ),
                                            hintText: 'Enter Name',
                                            filled: true,
                                            fillColor: Colors.white,
                                            hintStyle: TextStyle(
                                              color: Colors.black,
                                              fontFamily: 'Gilroy',
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Middle Name',
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontFamily: 'Gilroy',
                                          color: Colors.black,
                                          fontSize: 15.sp,
                                        ),
                                      ),
                                      SizedBox(
                                        height: 10.h,
                                      ),
                                      Container(
                                        width: 140.w,
                                        height: 50.h,
                                        child: TextField(
                                          controller: _controller1,
                                          textAlign: TextAlign.start,
                                          cursorColor: Colors.black,
                                          style: const TextStyle(
                                            color: Colors.black,
                                          ),
                                          decoration: InputDecoration(
                                            enabledBorder: OutlineInputBorder(
                                              borderSide: BorderSide(
                                                width: 1,
                                                color: Colors.black,
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(5),
                                            ),
                                            focusedBorder: OutlineInputBorder(
                                              borderSide: BorderSide(
                                                  width: 1,
                                                  color: Colors.black),
                                              borderRadius:
                                                  BorderRadius.circular(5),
                                            ),
                                            hintText: 'Enter Name',
                                            filled: true,
                                            fillColor: Colors.white,
                                            hintStyle: TextStyle(
                                              color: Colors.black,
                                              fontFamily: 'Gilroy',
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(
                                  left: 10.w, top: 20.h, right: 5.w),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Last Name',
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontFamily: 'Gilroy',
                                          color: Colors.black,
                                          fontSize: 15.sp,
                                        ),
                                      ),
                                      SizedBox(
                                        height: 10.h,
                                      ),
                                      Container(
                                        width: 140.w,
                                        height: 50.h,
                                        child: TextField(
                                          controller: _controller2,
                                          textAlign: TextAlign.start,
                                          cursorColor: Colors.black,
                                          style: const TextStyle(
                                            color: Colors.black,
                                          ),
                                          decoration: InputDecoration(
                                            enabledBorder: OutlineInputBorder(
                                              borderSide: BorderSide(
                                                width: 1,
                                                color: Colors.black,
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(5),
                                            ),
                                            focusedBorder: OutlineInputBorder(
                                              borderSide: BorderSide(
                                                  width: 1,
                                                  color: Colors.black),
                                              borderRadius:
                                                  BorderRadius.circular(5),
                                            ),
                                            hintText: 'Enter Name',
                                            filled: true,
                                            fillColor: Colors.white,
                                            hintStyle: TextStyle(
                                              color: Colors.black,
                                              fontFamily: 'Gilroy',
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Phone Number',
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontFamily: 'Gilroy',
                                          color: Colors.black,
                                          fontSize: 15.sp,
                                        ),
                                      ),
                                      SizedBox(
                                        height: 10.h,
                                      ),
                                      Container(
                                        width: 140.w,
                                        height: 50.h,
                                        child: TextField(
                                          controller: _controller3,
                                          textAlign: TextAlign.start,
                                          cursorColor: Colors.black,
                                          style: const TextStyle(
                                            color: Colors.black,
                                          ),
                                          decoration: InputDecoration(
                                            enabledBorder: OutlineInputBorder(
                                              borderSide: BorderSide(
                                                width: 1,
                                                color: Colors.black,
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(5),
                                            ),
                                            focusedBorder: OutlineInputBorder(
                                              borderSide: BorderSide(
                                                  width: 1,
                                                  color: Colors.black),
                                              borderRadius:
                                                  BorderRadius.circular(5),
                                            ),
                                            hintText: 'Enter No',
                                            filled: true,
                                            fillColor: Colors.white,
                                            hintStyle: TextStyle(
                                              color: Colors.black,
                                              fontFamily: 'Gilroy',
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(
                                  left: 10.w, top: 20.h, right: 5.w),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Email ID',
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontFamily: 'Gilroy',
                                          color: Colors.black,
                                          fontSize: 15.sp,
                                        ),
                                      ),
                                      SizedBox(
                                        height: 10.h,
                                      ),
                                      Container(
                                        width: 140.w,
                                        height: 50.h,
                                        child: TextField(
                                          controller: _controller4,
                                          textAlign: TextAlign.start,
                                          cursorColor: Colors.black,
                                          style:TextStyle(
                                            fontSize:10.sp,
                                            color: Colors.black,
                                          ),
                                          decoration: InputDecoration(
                                            enabledBorder: OutlineInputBorder(
                                              borderSide: BorderSide(
                                                width: 1,
                                                color: Colors.black,
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(5),
                                            ),
                                            focusedBorder: OutlineInputBorder(
                                              borderSide: BorderSide(
                                                  width: 1,
                                                  color: Colors.black),
                                              borderRadius:
                                                  BorderRadius.circular(5),
                                            ),
                                            hintText: 'Enter EmailId',
                                            filled: true,
                                            fillColor: Colors.white,
                                            hintStyle: TextStyle(
                                              color: Colors.black,
                                              fontFamily: 'Gilroy',
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'CTC',
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontFamily: 'Gilroy',
                                          color: Colors.black,
                                          fontSize: 15.sp,
                                        ),
                                      ),
                                      SizedBox(
                                        height: 10.h,
                                      ),
                                      Container(
                                        width: 140.w,
                                        height: 50.h,
                                        child: TextField(
                                          controller: _controller5,
                                          textAlign: TextAlign.start,
                                          cursorColor: Colors.black,
                                          style: const TextStyle(
                                            color: Colors.black,
                                          ),
                                          decoration: InputDecoration(
                                            enabledBorder: OutlineInputBorder(
                                              borderSide: BorderSide(
                                                width: 1,
                                                color: Colors.black,
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(5),
                                            ),
                                            focusedBorder: OutlineInputBorder(
                                              borderSide: BorderSide(
                                                  width: 1,
                                                  color: Colors.black),
                                              borderRadius:
                                                  BorderRadius.circular(5),
                                            ),
                                            hintText: 'Enter CTC',
                                            filled: true,
                                            fillColor: Colors.white,
                                            hintStyle: TextStyle(
                                              color: Colors.black,
                                              fontFamily: 'Gilroy',
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(
                                  left: 10.w, top: 20.h, right: 5.w),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Bond Break Amount',
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontFamily: 'Gilroy',
                                          color: Colors.black,
                                          fontSize: 15.sp,
                                        ),
                                      ),
                                      SizedBox(
                                        height: 10.h,
                                      ),
                                      Container(
                                        width: 140.w,
                                        height: 50.h,
                                        child: TextField(
                                          controller: _controller6,
                                          textAlign: TextAlign.start,
                                          cursorColor: Colors.black,
                                          style: const TextStyle(
                                            color: Colors.black,
                                          ),
                                          decoration: InputDecoration(
                                            enabledBorder: OutlineInputBorder(
                                              borderSide: BorderSide(
                                                width: 1,
                                                color: Colors.black,
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(5),
                                            ),
                                            focusedBorder: OutlineInputBorder(
                                              borderSide: BorderSide(
                                                  width: 1,
                                                  color: Colors.black),
                                              borderRadius:
                                                  BorderRadius.circular(5),
                                            ),
                                            hintText: 'Enter Amount',
                                            filled: true,
                                            fillColor: Colors.white,
                                            hintStyle: TextStyle(
                                              color: Colors.black,
                                              fontFamily: 'Gilroy',
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Bond',
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontFamily: 'Gilroy',
                                          color: Colors.black,
                                          fontSize: 15.sp,
                                        ),
                                      ),
                                      SizedBox(
                                        height: 10.h,
                                      ),
                                      Container(
                                        width: 140.w,
                                        height: 50.h,
                                        child: TextField(
                                          controller: _controller7,
                                          textAlign: TextAlign.start,
                                          cursorColor: Colors.black,
                                          style: const TextStyle(
                                            color: Colors.black,
                                          ),
                                          decoration: InputDecoration(
                                            enabledBorder: OutlineInputBorder(
                                              borderSide: BorderSide(
                                                width: 1,
                                                color: Colors.black,
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(5),
                                            ),
                                            focusedBorder: OutlineInputBorder(
                                              borderSide: BorderSide(
                                                  width: 1,
                                                  color: Colors.black),
                                              borderRadius:
                                                  BorderRadius.circular(5),
                                            ),
                                            hintText: 'Enter CTC',
                                            filled: true,
                                            fillColor: Colors.white,
                                            hintStyle: TextStyle(
                                              color: Colors.black,
                                              fontFamily: 'Gilroy',
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(
                                  left: 10.w,
                                  top: 20.h,
                                  right: 5.w,
                                  bottom: 5.h),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Location',
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontFamily: 'Gilroy',
                                          color: Colors.black,
                                          fontSize: 15.sp,
                                        ),
                                      ),
                                      SizedBox(
                                        height: 10.h,
                                      ),
                                      Container(
                                        width: 140.w,
                                        height: 50.h,
                                        child: InputDecorator(
                                          decoration: const InputDecoration(
                                              border: OutlineInputBorder()),
                                          child: DropdownButtonHideUnderline(
                                            child: DropdownButton(
                                              // Initial Value
                                              value: dropdownvalue,

                                              // Down Arrow Icon
                                              icon: const Icon(
                                                  Icons.keyboard_arrow_down),

                                              // Array list of items
                                              items:
                                                  location.map((String items) {
                                                return DropdownMenuItem(
                                                  value: items,
                                                  child: Text(items,style: TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    fontFamily: 'Gilroy',
                                                    color: Colors.black,
                                                    fontSize: 10.sp,
                                                  ),),
                                                );
                                              }).toList(),

                                              onChanged: (Object? value) {
                                                setState(() {
                                                  dropdownvalue!=value;
                                                });
                                              },
                                              // After selecting the desired option,it will
                                              // change button value to selected value
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Type',
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontFamily: 'Gilroy',
                                          color: Colors.black,
                                          fontSize: 15.sp,
                                        ),
                                      ),
                                      SizedBox(
                                        height: 10.h,
                                      ),
                                      Container(
                                        width: 140.w,
                                        height: 50.h,
                                        child:InputDecorator(
                                          decoration: const InputDecoration(
                                              border: OutlineInputBorder()),
                                          child: DropdownButtonHideUnderline(
                                            child: DropdownButton(
                                              // Initial Value
                                              value: dropdownvalues,

                                              // Down Arrow Icon
                                              icon: const Icon(
                                                  Icons.keyboard_arrow_down),

                                              // Array list of items
                                              items:
                                              manager.map((String items) {
                                                return DropdownMenuItem(
                                                  value: items,
                                                  child: Text(items,style: TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    fontFamily: 'Gilroy',
                                                    color: Colors.black,
                                                    fontSize: 10.sp,
                                                  ),),
                                                );
                                              }).toList(),

                                              onChanged: (Object? value) {
                                                setState(() {
                                                  dropdownvalues!=value;
                                                });
                                              },
                                              // After selecting the desired option,it will
                                              // change button value to selected value
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(
                                  left: 10.w,
                                  top: 20.h,
                                  right: 5.w,
                                  bottom: 5.h),
                              child: Row(
                                mainAxisAlignment:
                                MainAxisAlignment.spaceBetween,
                                children: [
                                  Column(
                                    crossAxisAlignment:
                                    CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Designation',
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontFamily: 'Gilroy',
                                          color: Colors.black,
                                          fontSize: 15.sp,
                                        ),
                                      ),
                                      SizedBox(
                                        height: 10.h,
                                      ),
                                      Container(
                                        width: 140.w,
                                        height: 50.h,
                                        child: InputDecorator(
                                          decoration: const InputDecoration(
                                              border: OutlineInputBorder()),
                                          child: DropdownButtonHideUnderline(
                                            child: DropdownButton(
                                              // Initial Value
                                              value:degs,

                                              // Down Arrow Icon
                                              icon: const Icon(
                                                  Icons.keyboard_arrow_down),

                                              // Array list of items
                                              items:
                                              deg.map((String items) {
                                                return DropdownMenuItem(
                                                  value: items,
                                                  child: Text(items,style: TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    fontFamily: 'Gilroy',
                                                    color: Colors.black,
                                                    fontSize: 10.sp,
                                                  ),),
                                                );
                                              }).toList(),

                                              onChanged: (Object? value) {
                                                setState(() {
                                                  degs!=value;
                                                });
                                              },
                                              // After selecting the desired option,it will
                                              // change button value to selected value
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                    CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Department',
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontFamily: 'Gilroy',
                                          color: Colors.black,
                                          fontSize: 15.sp,
                                        ),
                                      ),
                                      SizedBox(
                                        height: 10.h,
                                      ),
                                      Container(
                                        width: 140.w,
                                        height: 50.h,
                                        child:InputDecorator(
                                          decoration: const InputDecoration(
                                              border: OutlineInputBorder()),
                                          child: DropdownButtonHideUnderline(
                                            child: DropdownButton(
                                              // Initial Value
                                              value: dep,

                                              // Down Arrow Icon
                                              icon: const Icon(
                                                  Icons.keyboard_arrow_down),

                                              // Array list of items
                                              items:
                                              Dep.map((String items) {
                                                return DropdownMenuItem(
                                                  value: items,
                                                  child: Text(items,style: TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    fontFamily: 'Gilroy',
                                                    color: Colors.black,
                                                    fontSize: 10.sp,
                                                  ),),
                                                );
                                              }).toList(),

                                              onChanged: (Object? value) {
                                                setState(() {
                                                  dropdownvalues!=value;
                                                });
                                              },
                                              // After selecting the desired option,it will
                                              // change button value to selected value
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                  Padding(
                    padding: EdgeInsets.only(right: 150.w, top: 20.h),
                                  child:Text(
                                    'Submitted Documents:',
                                    style: TextStyle(
                                      fontWeight:FontWeight.bold,
                                      fontFamily: 'Gilroy',
                                      color: Colors.black,
                                      fontSize: 15.sp,
                                    ),
                                  ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 10.w, top: 20.h),
                                  child:Row(
                                    children:[
                                      Text(
                                        'SSC :',
                                        style: TextStyle(
                                          fontFamily: 'Gilroy',
                                          color: Colors.black,
                                          fontSize: 15.sp,
                                        ),
                                      ),
                                      SizedBox(width:90.w,),
                                      Text(
                                        'Yes',
                                        style: TextStyle(
                                          fontFamily: 'Gilroy',
                                          color: Colors.black,
                                          fontSize: 15.sp,
                                        ),
                                      ),
                                Switch(
                                  onChanged: toggleSwitch,
                                  value: isSwitched,
                                  activeColor: Colors.blue,
                                  activeTrackColor: Colors.yellow,
                                  inactiveThumbColor: Colors.white,
                                  inactiveTrackColor: Colors.grey,
                                ),
                                      Text(
                                        'No',
                                        style: TextStyle(
                                          fontFamily: 'Gilroy',
                                          color: Colors.black,
                                          fontSize: 15.sp,
                                        ),
                                      ),
                              ],
                            ),
                  ),
                            Padding(
                              padding: EdgeInsets.only(left: 10.w, top: 5.h),
                              child:Row(
                                children:[
                                  Text(
                                    'Intermediate:',
                                    style: TextStyle(
                                      fontFamily: 'Gilroy',
                                      color: Colors.black,
                                      fontSize: 15.sp,
                                    ),
                                  ),
                                  SizedBox(width:43.w,),
                                  Text(
                                    'Yes',
                                    style: TextStyle(
                                      fontFamily: 'Gilroy',
                                      color: Colors.black,
                                      fontSize: 15.sp,
                                    ),
                                  ),
                                  Switch(
                                    onChanged: toggleSwitch,
                                    value: isSwitched,
                                    activeColor: Colors.blue,
                                    activeTrackColor: Colors.yellow,
                                    inactiveThumbColor: Colors.white,
                                    inactiveTrackColor: Colors.grey,
                                  ),
                                  Text(
                                    'No',
                                    style: TextStyle(
                                      fontFamily: 'Gilroy',
                                      color: Colors.black,
                                      fontSize: 15.sp,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(left: 10.w, top: 5.h),
                              child:Row(
                                children:[
                                  Text(
                                    'Service Agreement:',
                                    style: TextStyle(
                                      fontFamily: 'Gilroy',
                                      color: Colors.black,
                                      fontSize: 15.sp,
                                    ),
                                  ),
                                  SizedBox(width:10.w,),
                                  Text(
                                    'Yes',
                                    style: TextStyle(
                                      fontFamily: 'Gilroy',
                                      color: Colors.black,
                                      fontSize: 15.sp,
                                    ),
                                  ),
                                  Switch(
                                    onChanged: toggleSwitch,
                                    value: isSwitched,
                                    activeColor: Colors.blue,
                                    activeTrackColor: Colors.yellow,
                                    inactiveThumbColor: Colors.white,
                                    inactiveTrackColor: Colors.grey,
                                  ),
                                  Text(
                                    'No',
                                    style: TextStyle(
                                      fontFamily: 'Gilroy',
                                      color: Colors.black,
                                      fontSize: 15.sp,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(
                                  left: 40.w,
                                  top: 20.h,
                                  right: 10.w,
                                  bottom: 10.h),
                              child: InkWell(
                                onTap: () async {
                                  Util.name.add(_controller.text);
                                  Util.email.add(_controller4.text);
                                  prefs.setStringList("stringt", Util.name);
                                  prefs.setStringList("stringta", Util.email);
                                  if(_controller.text.isEmpty && _controller1.text.isEmpty && _controller2.text.isEmpty && _controller3.text.isEmpty && _controller4.text.isEmpty && _controller5.text.isEmpty && _controller6.text.isEmpty && _controller7.text.isEmpty){
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      const SnackBar(
                                          content: Text('Please Enter all details')),
                                    );
                                  }
                                },
                                borderRadius: BorderRadius.circular(30.r),
                                child: Container(
                                  width: 65.w,
                                  height: 40.h,
                                  padding: EdgeInsets.symmetric(
                                    horizontal: 15.w,
                                    vertical: 15.h,
                                  ),
                                  decoration: BoxDecoration(
                                    color: Colors.green,
                                    borderRadius: BorderRadius.circular(10.r),
                                  ),
                                  child: Center(
                                    child: Text(
                                      'Submit',
                                      style: TextStyle(
                                        fontFamily: 'Gilroy',
                                        color: Colors.white,
                                        fontSize: 9.sp,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
