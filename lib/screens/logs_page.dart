import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../utils/util.dart';

class LogsPage extends StatefulWidget {
  const LogsPage({Key? key}) : super(key: key);

  @override
  State<LogsPage> createState() => _LogsPageState();
}

class _LogsPageState extends State<LogsPage> {
  String dropdownvalue = "April 2023";
  var manager = ['April 2023', 'March 2023'];
  String dropdownvalues = "View All";
  var manager1 = ['View All'];
  TextEditingController _controller = TextEditingController();
  TextEditingController _controller1 = TextEditingController();
  Future<Null> getSharedPrefs() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      Util.startTime = prefs.getStringList("string23")!;
      Util.EndTime = prefs.getStringList("string145")!;
      Util.Eff=prefs.getStringList("string6")!;
    });
  }

  @override
  initState() {
    getSharedPrefs();
    timeinput.text = "";
    timeinput1.text = "";
    super.initState();
  }

  TextEditingController timeinput = TextEditingController();
  TextEditingController timeinput1 = TextEditingController();
  //text editing controller for text field

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 5.h,
          ),
          Padding(
            padding: EdgeInsets.only(left: 10.w, right: 10.w),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  width: 100.w,
                  height: 40.h,
                  padding: EdgeInsets.only(left: 10.w, right: 10.w),
                  decoration: BoxDecoration(
                    color: Colors.blue[800],
                    borderRadius: BorderRadius.all(Radius.circular(30.0)),
                  ),
                  child: DropdownButtonHideUnderline(
                    child: DropdownButton(
                      dropdownColor: Colors.grey,
                      // Initial Value
                      value: dropdownvalue,

                      // Down Arrow Icon
                      icon: const Icon(
                        Icons.keyboard_arrow_down,
                        color: Colors.white,
                      ),

                      // Array list of items
                      items: manager.map((String items) {
                        return DropdownMenuItem(
                          value: items,
                          child: Text(
                            items,
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontFamily: 'Gilroy',
                              color: Colors.white,
                              fontSize: 10.sp,
                            ),
                          ),
                        );
                      }).toList(),

                      onChanged: (Object? value) {
                        setState(() {
                          dropdownvalue != value;
                        });
                      },
                      // After selecting the desired option,it will
                      // change button value to selected value
                    ),
                  ),
                ),
                Container(
                  width: 100.w,
                  height: 40.h,
                  padding: EdgeInsets.only(left: 10.w, right: 10.w),
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.blue,
                    ),
                    borderRadius: BorderRadius.all(Radius.circular(30.0)),
                  ),
                  child: DropdownButtonHideUnderline(
                    child: DropdownButton(
                      // Initial Value
                      value: dropdownvalues,

                      // Down Arrow Icon
                      icon: const Icon(
                        Icons.keyboard_arrow_down,
                        color: Colors.black,
                      ),

                      // Array list of items
                      items: manager1.map((String items) {
                        return DropdownMenuItem(
                          value: items,
                          child: Text(
                            items,
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontFamily: 'Gilroy',
                              color: Colors.black,
                              fontSize: 10.sp,
                            ),
                          ),
                        );
                      }).toList(),

                      onChanged: (Object? value) {
                        setState(() {
                          dropdownvalues != value;
                        });
                      },
                      // After selecting the desired option,it will
                      // change button value to selected value
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 10.h,
          ),
          Container(
            height: 590.h,
            child: ListView.builder(
              scrollDirection: Axis.vertical,
              itemCount: Util.Eff.length ?? 0,
              itemBuilder: (BuildContext context, int index) {
                return InkWell(
                  onTap: () {},
                  child: Container(
                    height: 130.h,
                    child: Card(
                      color: Colors.white,
                      child: Padding(
                        padding: EdgeInsets.only(left: 10.w, right: 10.w),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  '04 Monday',
                                  style: TextStyle(
                                    color: Colors.blue[800],
                                    fontFamily: 'Gilroy',
                                    fontSize: 15.sp,
                                  ),
                                ),
                                Text(
                                  'Present',
                                  style: TextStyle(
                                    color: Colors.green,
                                    fontFamily: 'Gilroy',
                                    fontSize: 15.sp,
                                  ),
                                ),
                                InkWell(
                                  onTap: () async {
                                    Dialog errorDialog = Dialog(
                                      insetPadding: EdgeInsets.only(
                                          bottom: 150.h,
                                          right: 40.w,
                                          left: 40.w),
                                      shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(
                                              0.0)), //this right here
                                      child: Container(
                                        height: 260.0.h,
                                        color: Colors.white,
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: <Widget>[
                                            Padding(
                                              padding: EdgeInsets.only(
                                                  left: 20.w, top: 10.h),
                                              child: Text(
                                                'Time In',
                                                style: TextStyle(
                                                  fontFamily: 'Gilroy',
                                                  color: Colors.black,
                                                  fontSize: 20.sp,
                                                ),
                                              ),
                                            ),
                                            Padding(
                                              padding: EdgeInsets.only(
                                                  left: 20.w, right: 20.w),
                                              child: TextField(
                                                controller:
                                                    timeinput, //editing controller of this TextField
                                                decoration: InputDecoration(
                                                    icon: Icon(Icons
                                                        .access_time_filled_outlined), //icon of text field
                                                    labelText:
                                                        "Enter Time In" //label text of field
                                                    ),
                                                style: TextStyle(
                                                    color: Colors.black),
                                                readOnly:
                                                    true, //set it true, so that user will not able to edit text
                                                onTap: () async {
                                                  TimeOfDay? pickedTime =
                                                      await showTimePicker(
                                                    initialTime:
                                                        TimeOfDay.now(),
                                                    context: context,
                                                  );

                                                  if (pickedTime != null) {
                                                    print(pickedTime.format(
                                                        context)); //output 10:51 PM
                                                    DateTime parsedTime =
                                                        DateFormat.jm().parse(
                                                            pickedTime
                                                                .format(context)
                                                                .toString());
                                                    //converting to DateTime so that we can further format on different pattern.
                                                    print(
                                                        parsedTime); //output 1970-01-01 22:53:00.000
                                                    String formattedTime =
                                                        DateFormat('HH:mm:ss')
                                                            .format(parsedTime);
                                                    print(
                                                        formattedTime); //output 14:59:00
                                                    //DateFormat() is from intl package, you can format the time on any pattern you need.

                                                    setState(() {
                                                      timeinput.text =
                                                          formattedTime; //set the value of text field.
                                                    });
                                                  } else {
                                                    print(
                                                        "Time is not selected");
                                                  }
                                                },
                                              ),
                                            ),
                                            Padding(
                                              padding: EdgeInsets.only(
                                                  left: 20.w, top: 10.h),
                                              child: Text(
                                                'Time Out',
                                                style: TextStyle(
                                                  fontFamily: 'Gilroy',
                                                  color: Colors.black,
                                                  fontSize: 20.sp,
                                                ),
                                              ),
                                            ),
                                            Padding(
                                              padding: EdgeInsets.only(
                                                  left: 20.w, right: 20.w),
                                              child: TextField(
                                                style: TextStyle(
                                                    color: Colors.black),
                                                controller:
                                                    timeinput1, //editing controller of this TextField
                                                decoration: InputDecoration(
                                                    icon: Icon(Icons
                                                        .timelapse_outlined), //icon of text field
                                                    labelText:
                                                        "Enter Time Out" //label text of field
                                                    ),
                                                readOnly:
                                                    true, //set it true, so that user will not able to edit text
                                                onTap: () async {
                                                  TimeOfDay? pickedTime =
                                                      await showTimePicker(
                                                    initialTime:
                                                        TimeOfDay.now(),
                                                    context: context,
                                                  );

                                                  if (pickedTime != null) {
                                                    print(pickedTime.format(
                                                        context)); //output 10:51 PM
                                                    DateTime parsedTime =
                                                        DateFormat.jm().parse(
                                                            pickedTime
                                                                .format(context)
                                                                .toString());
                                                    //converting to DateTime so that we can further format on different pattern.
                                                    print(
                                                        parsedTime); //output 1970-01-01 22:53:00.000
                                                    String formattedTime =
                                                        DateFormat('HH:mm:ss')
                                                            .format(parsedTime);
                                                    print(
                                                        formattedTime); //output 14:59:00
                                                    //DateFormat() is from intl package, you can format the time on any pattern you need.

                                                    setState(() {
                                                      timeinput1.text =
                                                          formattedTime; //set the value of text field.
                                                    });
                                                  } else {
                                                    print(
                                                        "Time is not selected");
                                                  }
                                                },
                                              ),
                                            ),
                                            Center(
                                              child: Padding(
                                                padding:
                                                    EdgeInsets.only(top: 10.h),
                                                child: InkWell(
                                                  onTap: () async {
                                                    ScaffoldMessenger.of(
                                                            context)
                                                        .showSnackBar(
                                                      const SnackBar(
                                                          content: Text(
                                                              'Request Submitted')),
                                                    );
                                                    Navigator.pop(context);
                                                  },
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          30.r),
                                                  child: Container(
                                                    width: 100.w,
                                                    height: 40.h,
                                                    padding:
                                                        EdgeInsets.symmetric(
                                                      horizontal: 15.w,
                                                      vertical: 15.h,
                                                    ),
                                                    decoration: BoxDecoration(
                                                      color: Color(0xffBD59D4),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              30.r),
                                                    ),
                                                    child: Center(
                                                      child: Text(
                                                        'Submit',
                                                        style: TextStyle(
                                                          fontFamily: 'Gilroy',
                                                          color: Colors.white,
                                                          fontSize: 10.sp,
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    );
                                    showDialog(
                                        context: context,
                                        builder: (BuildContext context) =>
                                            errorDialog);
                                  },
                                  borderRadius: BorderRadius.circular(30.r),
                                  child: Container(
                                    width: 85.w,
                                    padding: EdgeInsets.symmetric(
                                      horizontal: 15.w,
                                      vertical: 15.h,
                                    ),
                                    decoration: BoxDecoration(
                                      color: Colors.blue,
                                      borderRadius: BorderRadius.circular(30.r),
                                    ),
                                    child: Center(
                                      child: Text(
                                        'Regularization',
                                        style: TextStyle(
                                          fontFamily: 'Gilroy',
                                          color: Colors.white,
                                          fontSize: 8.sp,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Text(
                                  'In Time\n\n${Util.startTime[index] ?? '-'}',
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontFamily: 'Gilroy',
                                    fontSize: 15.sp,
                                  ),
                                ),
                                VerticalDivider(
                                  thickness: 0.5,
                                  color: Colors.grey,
                                ),
                                Text(
                                  'Out Time\n\n${Util.EndTime[index] ?? '-'}',
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontFamily: 'Gilroy',
                                    fontSize: 15.sp,
                                  ),
                                ),
                                VerticalDivider(
                                  thickness: 0.5,
                                  color: Colors.grey,
                                ),
                                Text(
                                  'Effective Hours\n\n${Util.Eff[index] ?? 'empty'}',
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontFamily: 'Gilroy',
                                    fontSize: 15.sp,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
