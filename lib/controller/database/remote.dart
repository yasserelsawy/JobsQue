import 'dart:convert';

import 'package:graduation_project/view/pages/Profile/Experience.dart';
import 'package:graduation_project/view/pages/Setting_profile/profile.dart';
import 'package:graduation_project/view/pages/loginandregister/Loginscreen.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

// Future<void> Login(String email, var password, BuildContext context) async {
//   final response = await http.post(
//     Uri.parse('http://164.92.246.77/api/auth/login'),
//     body: {
//       'email': email,
//       'password': password,
//     },
//   );

//   if (response.statusCode == 200) {
//     final prefs = await SharedPreferences.getInstance();
//     prefs.setInt('id', jsonDecode(response.body)['user']['id']);
//     prefs.setString('name', jsonDecode(response.body)['user']['name']);
//     prefs.setString('token', jsonDecode(response.body)['token']);

//     // ignore: use_build_context_synchronously
//     Navigator.push(
//         context, MaterialPageRoute(builder: (context) => const Profile()));
//     print('successss');
//   } else if (response.statusCode == 401) {
//   } else {
//     final error = json.decode(response.body)['error'];
//   }
// }

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
  String url = 'http://164.92.246.77/api/jobs';

  Future<dynamic> get({required String url}) async {
    final prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString('token');
    int? id = prefs.getInt('id');
    http.Response response = await http.get(Uri.parse(url), headers: {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer $token',
    });

    if (response.statusCode == 200) {
      print('$id ');
      return jsonDecode(response.body)['data'];
    } else {
      throw Exception('problem with status code ${response.statusCode}');
    }
  }

  Future<void> Register(
    String name,
    String email,
    var password,
  ) async {
    final response = await http.post(
      Uri.parse(
          'http://164.92.246.77/api/auth/register?name=$name&email=$email&password=$password'),
      body: {'name': name, 'email': email, 'password': password},
    );

    // if (response.statusCode == 200) {
    // }

    if (response.statusCode != 200) {
      throw Exception('Failed to register user');
    }
  }

  String? savename;
  Future<void> Login(
    String email,
    var password,
  ) async {
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
      // ignore: use_build_context_synchronously
      // Navigator.pushReplacement(
      //     context, MaterialPageRoute(builder: (context) => const Profile()));
      print('successss');
    } else if (response.statusCode != 200) {
      throw Exception('failed To Login');
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

  Future<void> postEducation(String university, String title, String start,
      String end, BuildContext context) async {
    final prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString('token');
    int? id = prefs.getInt('id');
    final url = Uri.parse('http://164.92.246.77/api/education');
    final Headers = {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer $token',
    };
    final data = {
      'universty': university,
      'title': title,
      'start': start,
      'end': end,
      'user_id': id
    };
    final response =
        await http.post(url, headers: Headers, body: json.encode(data));
    if (response.statusCode == 200) {
      String uni = json.decode(response.body)['data']['title'];
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => Experiencepage()));
      print(uni);
    } else {
      print('errorr');
    }
  }

  Future<void> PostExperience(
      String position,
      String typeofwork,
      String compname,
      String location,
      String start,
      BuildContext context) async {
    final prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString('token');
    int? id = prefs.getInt('id');
    final url = Uri.parse(
        'http://164.92.246.77/api/experince?user_id=$id&postion=$position&type_work=$typeofwork&comp_name=$compname&location=$location&start=$start');
    final headers = {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer $token',
    };
    final data = {
      'postion': position,
      'type_work': typeofwork,
      'comp_name': compname,
      'start': start,
      'location': location,
      'user_id': id
    };
    final response =
        await http.post(url, headers: headers, body: json.encode(data));
    if (response.statusCode == 200) {
      String uni = json.decode(response.body)['data']['location'];
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => Profile()));
      print(uni);
    } else {
      print('errorr');
    }
  }
}
