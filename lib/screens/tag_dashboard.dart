import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../common_widget/bottom_navigation_bar1.dart';
import 'employee_information_page.dart';
import 'login_page.dart';

class TagPage extends StatefulWidget {
  const TagPage({Key? key}) : super(key: key);

  @override
  State<TagPage> createState() => _TagPageState();
}

class _TagPageState extends State<TagPage> {

  var name=['Ramesh','Rahul','Rohit','Raju'];
  var des=['software developer','software developer','Doctor','Doctor'];
  var email=['ramesh@gmail.com','rahul@gmail.com','rohit@gmail.com','raju@gamil.com'];
  var color=[Colors.orange,Colors.grey,Colors.black,Colors.green];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(
          automaticallyImplyLeading: false,
          iconTheme: IconThemeData(color: Colors.black),
          title:Row(
            children:[
              GestureDetector(
                onTap: () {
                  Dialog errorDialog = Dialog(
                    insetPadding: EdgeInsets.only(bottom: 500,right:140.w,left:10.w),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(0.0)), //this right here
                    child:Container(
                      height: 170.0,
                      width: 10.0,
                      color:Colors.white,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment:CrossAxisAlignment.start,
                        children: <Widget>[
                          Padding(
                            padding:  EdgeInsets.only(left:20.w,top:20.h),
                            child:Row(
                              children:[
                                Icon(Icons.person,color:Colors.black),
                                SizedBox(width:10.w,),
                                TextButton(
                                  onPressed: () {

                                  },
                                  child:Text('Profile',style: TextStyle(
                                    fontWeight:FontWeight.bold,
                                    fontFamily: 'Gilroy',
                                    color: Colors.black,
                                    fontSize: 15.sp,
                                  ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Divider(color:Colors.black,),
                          Padding(
                            padding:  EdgeInsets.only(left:20.w,top:20.h),
                            child:Row(
                              children:[
                                Icon(Icons.power_settings_new,color:Colors.black),
                                SizedBox(width:10.w,),
                                TextButton(
                                  onPressed: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(builder: (context) => const LoginPage()),
                                    );
                                  },
                                  child:Text('Logout',style: TextStyle(
                                    fontWeight:FontWeight.bold,
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
                  showDialog(context: context, builder: (BuildContext context) => errorDialog);},
                child:CircleAvatar(
                  backgroundColor: Colors.white,
                  radius:20,
                  child: Image.asset('assets/user.jpg',width:20.w,),
                ),
              ),
              SizedBox(width:45.w,),
              Image.asset('assets/loading.png',height:30.h,),
              SizedBox(width:5.w,),
              Text(
                'Envision',
                style: TextStyle(
                  fontWeight:FontWeight.bold,
                  fontFamily: 'Gilroy',
                  color: Colors.white,
                  fontSize: 20.sp,
                ),
              ),
              SizedBox(width:45.w,),
              Icon(Icons.notifications_none,color:Colors.white),
              IconButton(
                  icon: const Icon(Icons.settings,color:Colors.white,),
                  onPressed: () {
                    Dialog errorDialog = Dialog(
                      insetPadding: EdgeInsets.only(bottom: 390),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(0.0)), //this right here
                      child: Container(
                        height: 260.0,
                        width: 380.0,
                        color:Colors.blue,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment:CrossAxisAlignment.start,
                          children: <Widget>[
                            Padding(
                              padding:  EdgeInsets.only(left:20.w,top:20.h),
                              child: Text('Hi Envision!',style: TextStyle(
                                fontWeight:FontWeight.bold,
                                fontFamily: 'Gilroy',
                                color: Colors.white,
                                fontSize: 25.sp,
                              ),),),
                            Padding(
                              padding:  EdgeInsets.only(left:20.w,top:20.h,right:30.w),
                              child:TextField(
                                keyboardType:TextInputType.visiblePassword,
                                textAlign: TextAlign.start,
                                cursorColor: Colors.black,
                                style: const TextStyle(
                                  color: Colors.black,
                                ),
                                decoration: InputDecoration(
                                  hintText: 'Search Employees',
                                  filled: true,
                                  hintStyle: TextStyle(
                                    color: Colors.black,
                                    fontFamily: 'Gilroy',
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding:  EdgeInsets.only(left:200.w,top:60.h,),
                              child:Row(
                                children:[
                                  Icon(Icons.notifications_none,color:Colors.white),
                                  SizedBox(width:10.w,),
                                  CircleAvatar(
                                    backgroundColor: Colors.white,
                                    radius:20,
                                    child: Image.asset('assets/user.jpg',width:20.w,),
                                  ),
                                  SizedBox(width:10.w,),
                                  Icon(Icons.settings,color:Colors.white),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                    showDialog(context: context, builder: (BuildContext context) => errorDialog);}
              ),
              // Icon(Icons.notifications_none,color:Colors.white),
              // SizedBox(width:10.w,),
              // CircleAvatar(
              //   backgroundColor: Colors.white,
              //   radius:20,
              //   child: Image.asset('assets/user.jpg',width:20.w,),
              // ),
              // SizedBox(width:10.w,),
              // Icon(Icons.settings,color:Colors.white),
            ],
          ),
          centerTitle:true,
          backgroundColor:Colors.blue),
      body:Padding(padding:EdgeInsets.only(top:20.h),
        child:ListView.separated(
          itemCount:name.length,
          itemBuilder: (BuildContext context, int index) {
            return ListTile(
              leading:CircleAvatar(
                backgroundColor:color[index],
                radius:40,
                child: Image.asset('assets/user.jpg',width:20.w,),
              ),
              title: Padding(padding:EdgeInsets.only(left:2.w,),
                child:Row(
                  mainAxisAlignment:MainAxisAlignment.spaceBetween,
                  children:[
                    Column(
                      mainAxisAlignment:MainAxisAlignment.spaceBetween,
                      crossAxisAlignment:CrossAxisAlignment.start,
                      children:[
                        Text(
                          name[index],
                          style: TextStyle(
                            fontWeight:FontWeight.bold,
                            fontFamily: 'Gilroy',
                            color: Colors.black,
                            fontSize: 20.sp,
                          ),
                        ),
                        Text(
                          des[index],
                          style: TextStyle(
                            fontFamily: 'Gilroy',
                            color: Colors.black,
                            fontSize: 15.sp,
                          ),
                        ),
                        Text(
                          email[index],
                          style: TextStyle(
                            fontFamily: 'Gilroy',
                            color: Colors.black,
                            fontSize: 15.sp,
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children:[
                        IconButton(
                          color: Colors.red,
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const EmployeePage()),
                            );
//                       Dialog errorDialog = Dialog(
//                         shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(0.0)), //this right here
//                         child:Container(
//                           height: 550.0,
//                           width: 400.0,
//                           color:Colors.white,
//                           child: Column(
//                             mainAxisAlignment: MainAxisAlignment.start,
//                             crossAxisAlignment:CrossAxisAlignment.start,
//                             children: <Widget>[
//                               Padding(
//                                 padding:  EdgeInsets.only(left:20.w,top:20.h),
//                                 child:Row(
//                                   children:[
//                                     SizedBox(width:2.w,),
//                                     Text('Employee Information',style: TextStyle(
//                                       fontWeight:FontWeight.bold,
//                                       fontFamily: 'Gilroy',
//                                       color: Colors.black,
//                                       fontSize: 15.sp,
//                                     ),
//                                     ),
//                                   ],
//                                 ),
//                               ),
//                               Padding(
//                                 padding:  EdgeInsets.only(left:10.w,top:20.h,right:5.w),
//                                 child:Row(
//                                   mainAxisAlignment:MainAxisAlignment.spaceBetween,
//                                   children:[
//                                     Column(
//                                       crossAxisAlignment:CrossAxisAlignment.start,
//                                       children:[
//                                         Text('First Name',style: TextStyle(
//                                           fontWeight:FontWeight.bold,
//                                           fontFamily: 'Gilroy',
//                                           color: Colors.black,
//                                           fontSize: 15.sp,
//                                         ),
//                                         ),
//                                 Container(
//                                   width:110.w,
//                                 child: TextField(
//                                   keyboardType:TextInputType.visiblePassword,
//                                   textAlign: TextAlign.start,
//                                   cursorColor: Colors.black,
//                                   style: const TextStyle(
//                                     color: Colors.black,
//                                   ),
//                                   decoration: InputDecoration(
//                                     hintText: 'Enter Name',
//                                     filled: true,
//                                     fillColor: Colors.white,
//                                     hintStyle: TextStyle(
//                                       color: Colors.black,
//                                       fontFamily: 'Gilroy',
//                                       fontSize:15.sp,
//                                     ),
//                                   ),
//                                 ),
//
// ),
//                                       ],
//                                     ),
//                                     Column(
//                                       crossAxisAlignment:CrossAxisAlignment.start,
//                                       children:[
//                                         Text('Middle Name',style: TextStyle(
//                                           fontWeight:FontWeight.bold,
//                                           fontFamily: 'Gilroy',
//                                           color: Colors.black,
//                                           fontSize: 15.sp,
//                                         ),
//                                         ),
//                                         Container(
//                                           width:110.w,
//                                           child: TextField(
//                                             keyboardType:TextInputType.visiblePassword,
//                                             textAlign: TextAlign.start,
//                                             cursorColor: Colors.black,
//                                             style: const TextStyle(
//                                               color: Colors.black,
//                                             ),
//                                             decoration: InputDecoration(
//                                               hintText: 'Enter Name',
//                                               filled: true,
//                                               fillColor: Colors.white,
//                                               hintStyle: TextStyle(
//                                                 color: Colors.black,
//                                                 fontFamily: 'Gilroy',
//                                                 fontSize:15.sp,
//                                               ),
//                                             ),
//                                           ),
//
//                                         ),
//                                       ],
//                                     ),
//                                   ],
//                                 ),
//                               ),
//                               Padding(
//                                 padding:  EdgeInsets.only(left:10.w,top:20.h,right:5.w),
//                                 child:Row(
//                                   mainAxisAlignment:MainAxisAlignment.spaceBetween,
//                                   children:[
//                                     Column(
//                                       crossAxisAlignment:CrossAxisAlignment.start,
//                                       children:[
//                                         Text('Last Name',style: TextStyle(
//                                           fontWeight:FontWeight.bold,
//                                           fontFamily: 'Gilroy',
//                                           color: Colors.black,
//                                           fontSize: 15.sp,
//                                         ),
//                                         ),
//                                         Container(
//                                           width:110.w,
//                                           child: TextField(
//                                             keyboardType:TextInputType.visiblePassword,
//                                             textAlign: TextAlign.start,
//                                             cursorColor: Colors.black,
//                                             style: const TextStyle(
//                                               color: Colors.black,
//                                             ),
//                                             decoration: InputDecoration(
//                                               hintText: 'Enter Name',
//                                               filled: true,
//                                               fillColor: Colors.white,
//                                               hintStyle: TextStyle(
//                                                 color: Colors.black,
//                                                 fontFamily: 'Gilroy',
//                                                 fontSize:15.sp,
//                                               ),
//                                             ),
//                                           ),
//
//                                         ),
//                                       ],
//                                     ),
//                                     Column(
//                                       crossAxisAlignment:CrossAxisAlignment.start,
//                                       children:[
//                                         Text('Phone Number',style: TextStyle(
//                                           fontWeight:FontWeight.bold,
//                                           fontFamily: 'Gilroy',
//                                           color: Colors.black,
//                                           fontSize: 15.sp,
//                                         ),
//                                         ),
//                                         Container(
//                                           width:110.w,
//                                           child: TextField(
//                                             keyboardType:TextInputType.visiblePassword,
//                                             textAlign: TextAlign.start,
//                                             cursorColor: Colors.black,
//                                             style: const TextStyle(
//                                               color: Colors.black,
//                                             ),
//                                             decoration: InputDecoration(
//                                               hintText: 'Enter Number',
//                                               filled: true,
//                                               fillColor: Colors.white,
//                                               hintStyle: TextStyle(
//                                                 color: Colors.black,
//                                                 fontFamily: 'Gilroy',
//                                                 fontSize:15.sp,
//                                               ),
//                                             ),
//                                           ),
//
//                                         ),
//                                       ],
//                                     ),
//                                   ],
//                                 ),
//                               ),
//                               Padding(
//                                 padding:  EdgeInsets.only(left:10.w,top:20.h,right:5.w),
//                                 child:Row(
//                                   mainAxisAlignment:MainAxisAlignment.spaceBetween,
//                                   children:[
//                                     Column(
//                                       crossAxisAlignment:CrossAxisAlignment.start,
//                                       children:[
//                                         Text('Email ID',style: TextStyle(
//                                           fontWeight:FontWeight.bold,
//                                           fontFamily: 'Gilroy',
//                                           color: Colors.black,
//                                           fontSize: 15.sp,
//                                         ),
//                                         ),
//                                         Container(
//                                           width:110.w,
//                                           child: TextField(
//                                             keyboardType:TextInputType.visiblePassword,
//                                             textAlign: TextAlign.start,
//                                             cursorColor: Colors.black,
//                                             style: const TextStyle(
//                                               color: Colors.black,
//                                             ),
//                                             decoration: InputDecoration(
//                                               hintText: 'Enter Email',
//                                               filled: true,
//                                               fillColor: Colors.white,
//                                               hintStyle: TextStyle(
//                                                 color: Colors.black,
//                                                 fontFamily: 'Gilroy',
//                                                 fontSize:15.sp,
//                                               ),
//                                             ),
//                                           ),
//
//                                         ),
//                                       ],
//                                     ),
//                                     Column(
//                                       crossAxisAlignment:CrossAxisAlignment.start,
//                                       children:[
//                                         Text('CTC',style: TextStyle(
//                                           fontWeight:FontWeight.bold,
//                                           fontFamily: 'Gilroy',
//                                           color: Colors.black,
//                                           fontSize: 15.sp,
//                                         ),
//                                         ),
//                                         Container(
//                                           width:110.w,
//                                           child: TextField(
//                                             keyboardType:TextInputType.visiblePassword,
//                                             textAlign: TextAlign.start,
//                                             cursorColor: Colors.black,
//                                             style: const TextStyle(
//                                               color: Colors.black,
//                                             ),
//                                             decoration: InputDecoration(
//                                               hintText: 'Enter CTC',
//                                               filled: true,
//                                               fillColor: Colors.white,
//                                               hintStyle: TextStyle(
//                                                 color: Colors.black,
//                                                 fontFamily: 'Gilroy',
//                                                 fontSize:15.sp,
//                                               ),
//                                             ),
//                                           ),
//
//                                         ),
//                                       ],
//                                     ),
//                                   ],
//                                 ),
//                               ),
//                               Padding(
//                                 padding:  EdgeInsets.only(left:10.w,top:20.h,right:5.w),
//                                 child:Row(
//                                   mainAxisAlignment:MainAxisAlignment.spaceBetween,
//                                   children:[
//                                     Column(
//                                       crossAxisAlignment:CrossAxisAlignment.start,
//                                       children:[
//                                         Text('Bond Break Amount',style: TextStyle(
//                                           fontWeight:FontWeight.bold,
//                                           fontFamily: 'Gilroy',
//                                           color: Colors.black,
//                                           fontSize: 15.sp,
//                                         ),
//                                         ),
//                                         Container(
//                                           width:110.w,
//                                           child: TextField(
//                                             keyboardType:TextInputType.visiblePassword,
//                                             textAlign: TextAlign.start,
//                                             cursorColor: Colors.black,
//                                             style: const TextStyle(
//                                               color: Colors.black,
//                                             ),
//                                             decoration: InputDecoration(
//                                               hintText: 'Enter Amount',
//                                               filled: true,
//                                               fillColor: Colors.white,
//                                               hintStyle: TextStyle(
//                                                 color: Colors.black,
//                                                 fontFamily: 'Gilroy',
//                                                 fontSize:15.sp,
//                                               ),
//                                             ),
//                                           ),
//
//                                         ),
//                                       ],
//                                     ),
//                                     Column(
//                                       crossAxisAlignment:CrossAxisAlignment.start,
//                                       children:[
//                                         Text('Bond',style: TextStyle(
//                                           fontWeight:FontWeight.bold,
//                                           fontFamily: 'Gilroy',
//                                           color: Colors.black,
//                                           fontSize: 15.sp,
//                                         ),
//                                         ),
//                                         Container(
//                                           width:110.w,
//                                           child: TextField(
//                                             keyboardType:TextInputType.visiblePassword,
//                                             textAlign: TextAlign.start,
//                                             cursorColor: Colors.black,
//                                             style: const TextStyle(
//                                               color: Colors.black,
//                                             ),
//                                             decoration: InputDecoration(
//                                               hintText: 'Enter Bond',
//                                               filled: true,
//                                               fillColor: Colors.white,
//                                               hintStyle: TextStyle(
//                                                 color: Colors.black,
//                                                 fontFamily: 'Gilroy',
//                                                 fontSize:15.sp,
//                                               ),
//                                             ),
//                                           ),
//
//                                         ),
//                                       ],
//                                     ),
//                                   ],
//                                 ),
//                               ),
//                               // Padding(
//                               //   padding:  EdgeInsets.only(left:10.w,top:20.h),
//                               //   child:Row(
//                               //     mainAxisAlignment:MainAxisAlignment.spaceAround,
//                               //     children:[
//                               //       Column(
//                               //         crossAxisAlignment:CrossAxisAlignment.start,
//                               //         children:[
//                               //           Text('CTC',style: TextStyle(
//                               //             fontWeight:FontWeight.bold,
//                               //             fontFamily: 'Gilroy',
//                               //             color: Colors.black,
//                               //             fontSize: 15.sp,
//                               //           ),
//                               //           ),
//                               //           Text('8L',style: TextStyle(
//                               //             fontFamily: 'Gilroy',
//                               //             color: Colors.black,
//                               //             fontSize: 12.sp,
//                               //           ),
//                               //           ),
//                               //         ],
//                               //       ),
//                               //       Column(
//                               //         crossAxisAlignment:CrossAxisAlignment.start,
//                               //         children:[
//                               //           Text('Reporting Manager',style: TextStyle(
//                               //             fontWeight:FontWeight.bold,
//                               //             fontFamily: 'Gilroy',
//                               //             color: Colors.black,
//                               //             fontSize: 15.sp,
//                               //           ),
//                               //           ),
//                               //           Text('Mahesh',style: TextStyle(
//                               //             fontFamily: 'Gilroy',
//                               //             color: Colors.black,
//                               //             fontSize: 12.sp,
//                               //           ),
//                               //           ),
//                               //         ],
//                               //       ),
//                               //     ],
//                               //   ),
//                               // ),
//                               Padding(padding:EdgeInsets.only(left:110.w,top:20.h,right:10.w),
//                                 child:Row(
//                                   mainAxisAlignment:MainAxisAlignment.spaceBetween,
//                                 children:[
//                                   InkWell(
//                                     onTap: () async {
//                                       Navigator.push(
//                                         context,
//                                         MaterialPageRoute(builder: (context) => const BottomNaviagtionBar1()),
//                                       );
//                                     },
//                                     borderRadius: BorderRadius.circular(30.r),
//                                     child: Container(
//                                       width:65.w,
//                                       height:40.h,
//                                       padding: EdgeInsets.symmetric(
//                                         horizontal: 15.w,
//                                         vertical: 15.h,
//                                       ),
//                                       decoration: BoxDecoration(
//                                         color:Colors.green,
//                                         borderRadius: BorderRadius.circular(10.r),
//                                       ),
//                                       child: Center(
//                                         child: Text(
//                                           'Generate',
//                                           style: TextStyle(
//                                             fontFamily: 'Gilroy',
//                                             color: Colors.white,
//                                             fontSize: 9.sp,
//                                           ),
//                                         ),
//                                       ),
//                                     ),
//                                   ),
//                                 InkWell(
//                                   onTap: () async {
//                                     Navigator.push(
//                                       context,
//                                       MaterialPageRoute(builder: (context) => const BottomNaviagtionBar1()),
//                                     );
//                                   },
//                                   borderRadius: BorderRadius.circular(30.r),
//                                   child: Container(
//                                     width:60.w,
//                                     height:40.h,
//                                     padding: EdgeInsets.symmetric(
//                                       horizontal: 15.w,
//                                       vertical: 15.h,
//                                     ),
//                                     decoration: BoxDecoration(
//                                       color:Colors.red,
//                                       borderRadius: BorderRadius.circular(10.r),
//                                     ),
//                                     child: Center(
//                                       child: Text(
//                                         'Close',
//                                         style: TextStyle(
//                                           fontFamily: 'Gilroy',
//                                           color: Colors.white,
//                                           fontSize: 10.sp,
//                                         ),
//                                       ),
//                                     ),
//                                   ),
//                                 ),
//                         ],
//                               ),
//                               ),
//                             ],
//                           ),
//                         ),
//                       );
                            //   showDialog(context: context, builder: (BuildContext context) => errorDialog);},
                          },
                          icon: Icon(Icons.pending_actions),
                        ),
                        IconButton(
                          color: Colors.green,
                          onPressed: () {
                            Dialog errorDialog = Dialog(
                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(0.0)), //this right here
                              child:Container(
                                height: 300.0,
                                width: 400.0,
                                color:Colors.white,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment:CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Padding(
                                      padding:  EdgeInsets.only(left:20.w,top:20.h),
                                      child:Row(
                                        children:[
                                          SizedBox(width:2.w,),
                                          Text('Employee Information',style: TextStyle(
                                            fontWeight:FontWeight.bold,
                                            fontFamily: 'Gilroy',
                                            color: Colors.black,
                                            fontSize: 15.sp,
                                          ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Padding(
                                      padding:  EdgeInsets.only(left:10.w,top:20.h),
                                      child:Row(
                                        mainAxisAlignment:MainAxisAlignment.spaceAround,
                                        children:[
                                          Column(
                                            crossAxisAlignment:CrossAxisAlignment.start,
                                            children:[
                                              Text('Name',style: TextStyle(
                                                fontWeight:FontWeight.bold,
                                                fontFamily: 'Gilroy',
                                                color: Colors.black,
                                                fontSize: 15.sp,
                                              ),
                                              ),
                                              Text('Suresh Kumar',style: TextStyle(
                                                fontFamily: 'Gilroy',
                                                color: Colors.black,
                                                fontSize: 12.sp,
                                              ),
                                              ),
                                            ],
                                          ),
                                          Column(
                                            crossAxisAlignment:CrossAxisAlignment.start,
                                            children:[
                                              Text('Date of Joining',style: TextStyle(
                                                fontWeight:FontWeight.bold,
                                                fontFamily: 'Gilroy',
                                                color: Colors.black,
                                                fontSize: 15.sp,
                                              ),
                                              ),
                                              Text('07-02-2023',style: TextStyle(
                                                fontFamily: 'Gilroy',
                                                color: Colors.black,
                                                fontSize: 12.sp,
                                              ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                    Padding(
                                      padding:  EdgeInsets.only(left:10.w,top:20.h),
                                      child:Row(
                                        mainAxisAlignment:MainAxisAlignment.spaceAround,
                                        children:[
                                          Column(
                                            crossAxisAlignment:CrossAxisAlignment.start,
                                            children:[
                                              Text('Email ID',style: TextStyle(
                                                fontWeight:FontWeight.bold,
                                                fontFamily: 'Gilroy',
                                                color: Colors.black,
                                                fontSize: 15.sp,
                                              ),
                                              ),
                                              Text('Harseh@gmail.com',style: TextStyle(
                                                fontFamily: 'Gilroy',
                                                color: Colors.black,
                                                fontSize: 12.sp,
                                              ),
                                              ),
                                            ],
                                          ),
                                          Column(
                                            crossAxisAlignment:CrossAxisAlignment.start,
                                            children:[
                                              Text('Phone Number',style: TextStyle(
                                                fontWeight:FontWeight.bold,
                                                fontFamily: 'Gilroy',
                                                color: Colors.black,
                                                fontSize: 15.sp,
                                              ),
                                              ),
                                              Text('934567813',style: TextStyle(
                                                fontFamily: 'Gilroy',
                                                color: Colors.black,
                                                fontSize: 12.sp,
                                              ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                    Padding(
                                      padding:  EdgeInsets.only(left:10.w,top:20.h),
                                      child:Row(
                                        mainAxisAlignment:MainAxisAlignment.spaceAround,
                                        children:[
                                          Column(
                                            crossAxisAlignment:CrossAxisAlignment.start,
                                            children:[
                                              Text('Experience',style: TextStyle(
                                                fontWeight:FontWeight.bold,
                                                fontFamily: 'Gilroy',
                                                color: Colors.black,
                                                fontSize: 15.sp,
                                              ),
                                              ),
                                              Text('Harseh@gmail.com',style: TextStyle(
                                                fontFamily: 'Gilroy',
                                                color: Colors.black,
                                                fontSize: 12.sp,
                                              ),
                                              ),
                                            ],
                                          ),
                                          Column(
                                            crossAxisAlignment:CrossAxisAlignment.start,
                                            children:[
                                              Text('Designation',style: TextStyle(
                                                fontWeight:FontWeight.bold,
                                                fontFamily: 'Gilroy',
                                                color: Colors.black,
                                                fontSize: 15.sp,
                                              ),
                                              ),
                                              Text('Software Developer',style: TextStyle(
                                                fontFamily: 'Gilroy',
                                                color: Colors.black,
                                                fontSize: 12.sp,
                                              ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                    // Padding(
                                    //   padding:  EdgeInsets.only(left:10.w,top:20.h),
                                    //   child:Row(
                                    //     mainAxisAlignment:MainAxisAlignment.spaceAround,
                                    //     children:[
                                    //       Column(
                                    //         crossAxisAlignment:CrossAxisAlignment.start,
                                    //         children:[
                                    //           Text('CTC',style: TextStyle(
                                    //             fontWeight:FontWeight.bold,
                                    //             fontFamily: 'Gilroy',
                                    //             color: Colors.black,
                                    //             fontSize: 15.sp,
                                    //           ),
                                    //           ),
                                    //           Text('8L',style: TextStyle(
                                    //             fontFamily: 'Gilroy',
                                    //             color: Colors.black,
                                    //             fontSize: 12.sp,
                                    //           ),
                                    //           ),
                                    //         ],
                                    //       ),
                                    //       Column(
                                    //         crossAxisAlignment:CrossAxisAlignment.start,
                                    //         children:[
                                    //           Text('Reporting Manager',style: TextStyle(
                                    //             fontWeight:FontWeight.bold,
                                    //             fontFamily: 'Gilroy',
                                    //             color: Colors.black,
                                    //             fontSize: 15.sp,
                                    //           ),
                                    //           ),
                                    //           Text('Mahesh',style: TextStyle(
                                    //             fontFamily: 'Gilroy',
                                    //             color: Colors.black,
                                    //             fontSize: 12.sp,
                                    //           ),
                                    //           ),
                                    //         ],
                                    //       ),
                                    //     ],
                                    //   ),
                                    // ),
                                    Padding(padding:EdgeInsets.only(left:180.w,top:40.h,right:10.w),
                                      child: InkWell(
                                        onTap: () async {
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(builder: (context) => const BottomNaviagtionBar1()),
                                          );
                                        },
                                        borderRadius: BorderRadius.circular(30.r),
                                        child: Container(
                                          width:60.w,
                                          height:40.h,
                                          padding: EdgeInsets.symmetric(
                                            horizontal: 15.w,
                                            vertical: 15.h,
                                          ),
                                          decoration: BoxDecoration(
                                            color:Colors.red,
                                            borderRadius: BorderRadius.circular(10.r),
                                          ),
                                          child: Center(
                                            child: Text(
                                              'Close',
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
                                  ],
                                ),
                              ),
                            );
                            showDialog(context: context, builder: (BuildContext context) => errorDialog);},
                          icon: Icon(Icons.remove_red_eye_outlined),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            );
          }, separatorBuilder: (BuildContext context, int index) {
          return Divider(
            color:Colors.black,
          );
        },
        ),
      ),
    );
  }
}
