import 'dart:convert';
import 'package:project/models/model.dart';
import 'package:http/http.dart' as http;

Future<LoginModel> createLogin(String emailid,String password) async {
  final response = await http.post(
    Uri.parse('http://10.10.20.75:8083/api/token'),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode(<String, String>{
      'emailId':emailid,
      'password':password,

    }),
  );

  if (response.statusCode == 200) {
    return LoginModel.fromJson(jsonDecode(response.body));
  } else {
    print("error");
    throw Exception('Failed to login.');
  }
}