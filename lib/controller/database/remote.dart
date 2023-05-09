import 'dart:convert';

import 'package:graduation_project/view/pages/Profile/Personaldetails.dart';
import 'package:graduation_project/view/pages/Setting_profile/profile.dart';
import 'package:graduation_project/view/pages/loginandregister/Loginscreen.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../view/pages/Profile/Education.dart';

Future<void> Register(
    String name, String email, var password, BuildContext context) async {
  String error;
  String username;
  final response = await http.post(
    Uri.parse(
        'http://164.92.246.77/api/auth/register?name=$name&email=$email&password=$password'),
    body: {'name': name, 'email': email, 'password': password},
  );

  if (response.statusCode == 200) {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => LoginScreen()));
  } else {
    error = 'oops error';
  }
}

Future<void> Login(String email, var password, BuildContext context) async {
  final response = await http.post(
    Uri.parse('http://164.92.246.77/api/auth/login'),
    body: {
      'email': email,
      'password': password,
    },
  );

  if (response.statusCode == 200) {
    final prefs = await SharedPreferences.getInstance();
    prefs.setInt('id', jsonDecode(response.body)['user']['id']);
    prefs.setString('name', jsonDecode(response.body)['user']['name']);
    prefs.setString('token', jsonDecode(response.body)['token']);
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => const Profile()));
    print('successss');
  } else if (response.statusCode == 401) {
    // setState(() {
    //   errorMessage = 'Wrong email or password';
    // });
  } else {
    final error = json.decode(response.body)['error'];
  }
}

Future updateProfile(
    String bio, String name, String adress, String phone) async {
  final prefs = await SharedPreferences.getInstance();
  var id = prefs.getInt('id');
  var token = prefs.getString('token');

  final url = Uri.parse(
    'http://164.92.246.77/api/user/profile/edit/$id?bio=$bio&address=$adress&mobile=$phone&name=$name',
  );
  final response = await http.put(url, headers: {
    'Content-Type': 'application/json',
    'Authorization': 'Bearer $token',
  });

  if (response.statusCode == 200) {
    final responseData = json.decode(response.body);
    var newadress = responseData['data']['address'];
    var newbio = responseData['data']['bio'];
    print(newadress);
  } else {
    print('Request failed with status: ${response.statusCode}.');
  }
}

// Future<void> Login(
//   String email,
//   var password,
// ) async {
//   final response = await http.post(
//     Uri.parse('http://164.92.246.77/api/auth/login'),
//     body: {'email': email, 'password': password},
//   );

//   if (response.statusCode == 200) {
//     final prefs = await SharedPreferences.getInstance();
//     prefs.setInt('id', jsonDecode(response.body)['user']['id']);
//     prefs.setString('name', jsonDecode(response.body)['user']['name']);
//     prefs.setString('token', jsonDecode(response.body)['token']);

//     print('successssss');
//   } else if (response.statusCode == 401) {
//   } else {
//     final error = json.decode(response.body)['error'];
//   }
// }

class Api {
  //String url = 'http://164.92.246.77/api/jobs';
  String token = '30|jxLnsxOjadcD9vtxGSzZrQ4PT08ERFB6zUg1poGM';

  Future<dynamic> get({required String url}) async {
    http.Response response = await http.get(Uri.parse(url), headers: {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer $token',
    });

    if (response.statusCode == 200) {
      print('shiblllllllllllll');
      return jsonDecode(response.body)['data'];
    } else {
      throw Exception('problem with status code ${response.statusCode}');
    }
  }
}
