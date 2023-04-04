import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:url_launcher/url_launcher.dart';

class DirectoryPage extends StatefulWidget {
  const DirectoryPage({Key? key}) : super(key: key);

  @override
  State<DirectoryPage> createState() => _DirectoryPageState();
}

class _DirectoryPageState extends State<DirectoryPage> {
  var name = ['Ramesh', 'Rahul', 'Rohit', 'Raju'];
  var des = ['software developer', 'software developer', 'Doctor', 'Doctor','software developer', 'software developer', 'Doctor', 'Doctor'];
  var email = [
    'ramesh@gmail.com',
    'rahul@gmail.com',
    'rohit@gmail.com',
    'raju@gmail.com',
    'ramesh@gmail.com',
    'rahul@gmail.com',
    'rohit@gmail.com',
    'raju@gmail.com',
  ];
  var color = [Colors.orange, Colors.grey, Colors.black, Colors.green];
  var searchResult = [];
  TextEditingController _controller = TextEditingController();
  Icon customIcon = const Icon(Icons.search);
  Widget customSearchBar = const Text(
    'Directory',
    style: TextStyle(
      fontFamily: 'Gilroy',
      color: Colors.black,
    ),
  );
  @override
  void initState() {
    super.initState();
    searchResult = name;
    _controller.addListener(_performSearch);
  }

  Future<void> _performSearch() async {


    //Simulates waiting for an API call
    await Future.delayed(const Duration(milliseconds: 1000));

    setState(() {
      searchResult = name
          .where((element) => element
          .toLowerCase()
          .contains(_controller.text.toLowerCase()))
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.black),
        title: customSearchBar,
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {
              setState(() {
                if (customIcon.icon == Icons.search) {
                  customIcon = const Icon(Icons.cancel);
                  customSearchBar = ListTile(
                    title: TextField(
                      cursorColor:Colors.black,
                      controller: _controller,
                      onChanged: (content) {
                        setState(() {
                          searchResult.add(content);
                        });
                      },
                      decoration: InputDecoration(
                        hintText: 'Search...',
                        hintStyle: TextStyle(
                          color: Colors.black,
                          fontSize: 18,
                          fontStyle: FontStyle.italic,
                        ),
                        border: InputBorder.none,
                      ),
                      style: TextStyle(
                        color: Colors.black,
                      ),
                    ),
                  );
                } else {
                  customIcon = const Icon(Icons.search);
                  customSearchBar = const Text(
                    'Directory',
                    style: TextStyle(
                      fontFamily: 'Gilroy',
                      color: Colors.black,
                    ),
                  );
                }
              });
            },
            icon: customIcon,
          ),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.only(top: 20.h),
        child:_controller.text.isNotEmpty
            ? ListView.separated(
                itemCount:searchResult.length,
                itemBuilder: (BuildContext context, int index) {
                  return ListTile(
                    leading: CircleAvatar(
                      backgroundColor: color[index],
                      radius: 40,
                      child: Image.asset(
                        'assets/user.jpg',
                        width: 20.w,
                      ),
                    ),
                    title: Padding(
                      padding: EdgeInsets.only(
                        left: 2.w,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                searchResult[index],
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
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
                            children: [
                              IconButton(
                                color: Colors.green,
                                onPressed: () async {
                                  Uri phoneno =
                                      Uri.parse('tel:+97798345348734');
                                  if (await launchUrl(phoneno)) {
                                    //dialer opened
                                  } else {
                                    //dailer is not opened
                                  }
                                },
                                icon: Icon(Icons.add, color: Colors.grey),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  );
                },
                separatorBuilder: (BuildContext context, int index) {
                  return Divider(
                    color: Colors.black,
                  );
                },
              )
            : ListView.separated(
                itemCount:name.length,
                itemBuilder: (BuildContext context, int index) {
                  return ListTile(
                    leading: CircleAvatar(
                      backgroundColor: color[index],
                      radius: 40,
                      child: Image.asset(
                        'assets/user.jpg',
                        width: 20.w,
                      ),
                    ),
                    title: Padding(
                      padding: EdgeInsets.only(
                        left: 2.w,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                name[index],
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
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
                            children: [
                              IconButton(
                                color: Colors.green,
                                onPressed: () async {
                                  Uri phoneno =
                                      Uri.parse('tel:+97798345348734');
                                  if (await launchUrl(phoneno)) {
                                    //dialer opened
                                  } else {
                                    //dailer is not opened
                                  }
                                },
                                icon: Icon(Icons.add, color: Colors.grey),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  );
                },
                separatorBuilder: (BuildContext context, int index) {
                  return Divider(
                    color: Colors.black,
                  );
                },
              ),
      ),
    );
  }
}
