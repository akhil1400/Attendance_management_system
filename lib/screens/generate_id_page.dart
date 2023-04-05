import 'package:flutter/material.dart';
import 'package:flutter_email_sender/flutter_email_sender.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:project/screens/login_page.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../utils/util.dart';

class GenerateIdPage extends StatefulWidget {
  const GenerateIdPage({Key? key}) : super(key: key);

  @override
  State<GenerateIdPage> createState() => _JoiningPageState();
}

class _JoiningPageState extends State<GenerateIdPage> {

  List<String> attachments = [];
  bool isHTML = false;

  final _recipientController = TextEditingController(
    text: 'akhilteli55@gmail.com',
  );

  final _subjectController = TextEditingController(text: 'The subject');

  final _bodyController = TextEditingController(
    text: 'Mail body.',
  );
  var id=['EIS0123','EIS0124','EIS0125','EIS0127'];
  var name=['Ramesh','Rahul','Rohit','Raju'];
  var des=['software developer','software developer','Doctor','Doctor'];
  var email=['ramesh@gmail.com','rahul@gmail.com','rohit@gmail.com','raju@gamil.com'];
  var color=[Colors.orange,Colors.grey,Colors.black,Colors.green];

  Future<void> send() async {
    final Email email = Email(
      body: _bodyController.text,
      subject: _subjectController.text,
      recipients: [_recipientController.text],
      attachmentPaths: attachments,
      isHTML: isHTML,
    );

    String platformResponse;

    try {
      await FlutterEmailSender.send(email);
      platformResponse = 'success';
    } catch (error) {
      print(error);
      platformResponse = error.toString();
    }

    if (!mounted) return;

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(platformResponse),
      ),
    );
  }


  Future<Null> getSharedPrefs() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      Util.name=prefs.getStringList("stringt")!;
      Util.email = prefs.getStringList("stringta")!;
    });
  }

  @override
  initState() {
    getSharedPrefs();
    super.initState();
  }

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
              SizedBox(width:40.w,),
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
              SizedBox(width:50.w,),
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
            ],
          ),
          centerTitle:true,
          backgroundColor:Colors.blue),
      body:Padding(padding:EdgeInsets.only(top:20.h),
        child:ListView.separated(
          itemCount:Util.name.length ?? 0,
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
                          '${Util.name[index]}',
                          style: TextStyle(
                            fontWeight:FontWeight.bold,
                            fontFamily: 'Gilroy',
                            color: Colors.black,
                            fontSize: 20.sp,
                          ),
                        ),
                        // Text(
                        //   id[index],
                        //   style: TextStyle(
                        //     fontFamily: 'Gilroy',
                        //     color: Colors.black,
                        //     fontSize: 15.sp,
                        //   ),
                        // ),
                        // Text(
                        //   des[index],
                        //   style: TextStyle(
                        //     fontFamily: 'Gilroy',
                        //     color: Colors.black,
                        //     fontSize: 15.sp,
                        //   ),
                        // ),
                        Text(
                          '${Util.email[index]}',
                          style: TextStyle(
                            fontFamily: 'Gilroy',
                            color: Colors.black,
                            fontSize: 15.sp,
                          ),
                        ),
                      ],
                    ),

                        IconButton(
                          color: Colors.green,
                          onPressed: () {
send();
                          },
                          icon: Icon(Icons.link,color:Colors.blue,),
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
