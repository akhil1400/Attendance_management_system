import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:project/http_call/get.dart';
import 'package:project/screens/home_page.dart';
import 'package:project/screens/hr_module.dart';

import '../common_widget/bottom_navigation_bar.dart';
import '../common_widget/bottom_navigation_bar1.dart';
import '../models/model.dart';
import 'package:http/http.dart' as http;

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool passwordVisible=false;
  Future<LoginModel>? _login;
  String rollid="";


  @override
  void initState(){
    super.initState();
    passwordVisible=true;
    buildFutureBuilder();
  }

  TextEditingController _controller = TextEditingController();
  TextEditingController _controller1 = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(
        title:Text('Login',
          style: TextStyle(
            fontFamily: 'Gilroy',
            color: Colors.white,
            fontSize: 20.sp,
          ),
        ),
        backgroundColor: Color(0xff0077b5 ),
        centerTitle:true,
      ),
      body:Center(
        child:ListView(
          children: [
            Expanded(
              child: Padding(
                padding: EdgeInsets.only(left: 20.w, right: 20.w, top: 100.h),
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        width: ScreenUtil().screenWidth,
                        padding: EdgeInsets.symmetric(
                            horizontal: 25.w, vertical: 50.h),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20.r),
                          color: Colors.white,
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment:CrossAxisAlignment.center,
                          children: [
                            SizedBox(height:10.h,),
                            Image.asset('assets/logo.png'),
                            SizedBox(
                              height: 20.h,
                            ),
                            Text(
                              'Login',
                              style: TextStyle(
                                fontWeight:FontWeight.bold,
                                fontFamily: 'Gilroy',
                                color: Colors.black,
                                fontSize: 25.sp,
                              ),
                            ),
                            SizedBox(height:20.h,),
                            Container(
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
                                    borderRadius: BorderRadius.circular(5),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        width: 1, color: Colors.black),
                                    borderRadius: BorderRadius.circular(5),
                                  ),
                                  hintText: 'Email Id',
                                  filled: true,
                                  fillColor: Colors.white,
                                  hintStyle: TextStyle(
                                    color: Colors.black,
                                    fontFamily: 'Gilroy',
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 30.h,
                            ),
                            Container(
                              height: 50.h,
                              child: TextField(
                                obscureText: passwordVisible,
                                keyboardType:TextInputType.visiblePassword,
                                controller: _controller1,
                                textAlign: TextAlign.start,
                                cursorColor: Colors.black,
                                style: const TextStyle(
                                  color: Colors.black,
                                ),
                                decoration: InputDecoration(
                                  suffixIcon: IconButton(
                                    icon: Icon(passwordVisible
                                        ? Icons.visibility_off
                                        : Icons.visibility, color:Color(0xff0077b5 ),),
                                    onPressed: () {
                                      setState(
                                            () {
                                          passwordVisible = !passwordVisible;
                                        },
                                      );
                                    },
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      width: 1,
                                      color: Colors.black,
                                    ),
                                    borderRadius: BorderRadius.circular(7),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        width: 1, color: Colors.black),
                                    borderRadius: BorderRadius.circular(5),
                                  ),
                                  hintText: 'Password',
                                  filled: true,
                                  fillColor: Colors.white,
                                  hintStyle: TextStyle(
                                    color: Colors.black,
                                    fontFamily: 'Gilroy',
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(height:10.h),
                            TextButton(
                              onPressed: () {
                                // Navigator.push(
                                //   context,
                                //   MaterialPageRoute(builder: (context) => const ForgotPage()),
                                // );
                              },
                              child:Text(
                                'Forgot Password?',
                                style: TextStyle(
                                  fontWeight:FontWeight.bold,
                                  fontFamily: 'Gilroy',
                                  color: Color(0xff0077b5 ),
                                  fontSize: 15.sp,
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 30.h,
                            ),
                            InkWell(
                              onTap: () async {
                                if(_controller.text.isEmpty) {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(
                                        content: Text('Please Enter Email')),
                                  );
                                }
                                else if(_controller1.text.isEmpty){
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(
                                        content: Text('Please Enter Password')),
                                  );
                                }
                                else if(_controller1.text.isEmpty && _controller.text.isEmpty){
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(
                                        content: Text('Please Enter Email && Password')),
                                  );
                                }
                                else if(_controller1.text.isNotEmpty && _controller.text.isNotEmpty && _controller.text == "pardhu@gmail.com" &&  _controller1.text=="test@123")
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(builder: (context) => const BottomNaviagtionBar()),
                                  );
                                else if(_controller1.text.isNotEmpty && _controller.text.isNotEmpty && _controller.text == "rajesh@gmail.com" &&  _controller1.text=="test@123")
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(builder: (context) => const BottomNaviagtionBar1()),
                                  );
                                else if(_controller1.text.isNotEmpty && _controller.text.isNotEmpty && _controller.text == "mahathi@gmail.com" &&  _controller1.text=="test@123")
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(builder: (context) => const BottomNaviagtionBar1()),
                                  );
                                else if(_controller1.text.isNotEmpty && _controller.text.isNotEmpty && _controller.text == "rajesh@gmail.com" &&  _controller1.text=="test@123")
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(builder: (context) => const BottomNaviagtionBar1()),
                                  );
                                setState(() async {
                                  _login=createLogin(_controller.text,_controller1.text);
                                  print(_login);
                                });
                              },
                              borderRadius: BorderRadius.circular(30.r),
                              child: Container(
                                width:100.w,
                                padding: EdgeInsets.symmetric(
                                  horizontal: 15.w,
                                  vertical: 15.h,
                                ),
                                decoration: BoxDecoration(
                                  color:Color(0xffBD59D4),
                                  borderRadius: BorderRadius.circular(30.r),
                                ),
                                child: Center(
                                  child: Text(
                                    'Login',
                                    style: TextStyle(
                                      fontFamily: 'Gilroy',
                                      color: Colors.white,
                                      fontSize: 15.sp,
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
  FutureBuilder<LoginModel> buildFutureBuilder() {
    return FutureBuilder<LoginModel>(
      future:_login,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
        rollid=snapshot.data?.loggedInUserID ?? ' ';
        } else if (snapshot.hasError) {
          return Text('${snapshot.error}');
        }

        return const CircularProgressIndicator();
      },
    );
  }
}


