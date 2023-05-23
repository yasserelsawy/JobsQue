import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation_project/controller/cubit/mycubit_cubit.dart';
import 'package:graduation_project/controller/database/remote.dart';
import 'package:graduation_project/view/pages/loginandregister/Registerscreen.dart';
import 'package:graduation_project/view/widgets/snackbar.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sizer/sizer.dart';

import '../Homescreen/Homeview.dart';
import '../Setting_profile/profile.dart';

class LoginScreen extends StatefulWidget {
  LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  Api? api = Api();
  bool ischecked = false;
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final formkey = GlobalKey<FormState>();
  String? errorMessage;
  bool obsecuretext = true;

  // Future<void> Login() async {
  //   final response = await http.post(
  //     Uri.parse('http://164.92.246.77/api/auth/login'),
  //     body: {
  //       'email': emailController.text,
  //       'password': passwordController.text
  //     },
  //   );

  //   if (response.statusCode == 200) {
  //     final prefs = await SharedPreferences.getInstance();
  //     prefs.setInt('id', jsonDecode(response.body)['user']['id']);
  //     prefs.setString('name', jsonDecode(response.body)['user']['name']);
  //     prefs.setString('token', jsonDecode(response.body)['token']);
  //     setState(() {
  //       Navigator.push(
  //           context, MaterialPageRoute(builder: (context) => Profile()));
  //     });
  //     print('successss');
  //   } else if (response.statusCode == 401) {
  //     setState(() {
  //       errorMessage = 'Wrong email or password';
  //     });
  //   } else {
  //     final error = json.decode(response.body)['error'];
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<MycubitCubit, MycubitState>(
      listener: (context, state) {
        if (state is LoginSucsseed) {
          Navigator.pushReplacement(
              context, MaterialPageRoute(builder: (context) => Profile()));
        } else if (state is LoginFailure) {
          showSimpleSnackbar(context, 'Failed to login');
        }
      },
      builder: (context, state) {
        if (state is LoginLoadingstate) {
          return Scaffold(
            body: Center(
              child: CircularProgressIndicator(),
            ),
          );
        } else {
          return Scaffold(
            resizeToAvoidBottomInset: false,
            body: SafeArea(
              child: Form(
                key: formkey,
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [Image.asset('assets/images/logo.png')],
                    ),
                    const Padding(
                      padding: EdgeInsets.only(top: 100, left: 20),
                      child: Align(
                        alignment: Alignment.topLeft,
                        child: Text(
                          'Login',
                          style: TextStyle(
                              fontSize: 28,
                              fontWeight: FontWeight.w500,
                              color: Color(0xFF111827)),
                        ),
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.only(left: 20, top: 10),
                      child: Align(
                          alignment: Alignment.topLeft,
                          child: Text(
                            'Please login to find your dream job',
                            style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w400,
                                color: Color(0xFF6B7280)),
                          )),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 65),
                      child: SizedBox(
                        width: 85.w,
                        height: 7.h,
                        child: TextFormField(
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'please enter your email';
                            }
                            if (!value.contains('@')) {
                              return 'password must contain @';
                            }
                          },
                          controller: emailController,
                          decoration: InputDecoration(
                              prefixIcon:
                                  Image.asset('assets/images/profile.png'),
                              hintText: 'Email',
                              hintStyle: const TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400,
                                  color: Color.fromARGB(255, 189, 186, 186)),
                              focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(8.0),
                                  borderSide: const BorderSide(
                                      color:
                                          Color.fromARGB(255, 95, 156, 206))),
                              enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(8.0),
                                  borderSide: const BorderSide(
                                    color: Color.fromARGB(255, 180, 177, 177),
                                  ))),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 2.h,
                    ),
                    SizedBox(
                      width: 85.w,
                      height: 7.h,
                      child: TextFormField(
                        obscureText: obsecuretext,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'please enter a password';
                          }

                          if (value.length < 8) {
                            return 'password must contain 8 characters';
                          }
                        },
                        controller: passwordController,
                        decoration: InputDecoration(
                            prefixIcon: Image.asset('assets/images/lock.png'),
                            suffixIcon: IconButton(
                                onPressed: () {
                                  setState(() {
                                    obsecuretext = !obsecuretext;
                                  });
                                },
                                icon: Image.asset('assets/images/eye.png')),
                            hintText: 'password',
                            hintStyle: const TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w400,
                                color: Color.fromARGB(255, 189, 186, 186)),
                            focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8.0),
                                borderSide: const BorderSide(
                                    color: Color.fromARGB(255, 95, 156, 206))),
                            enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8.0),
                                borderSide: const BorderSide(
                                  color: Color.fromARGB(255, 180, 177, 177),
                                ))),
                      ),
                    ),
                    Row(
                      children: [
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Padding(
                            padding: const EdgeInsets.only(left: 15),
                            child: StatefulBuilder(
                                builder: (context, StateSetter setState) {
                              return Checkbox(
                                value: ischecked,
                                onChanged: (newvalue) {
                                  setState(
                                    () {
                                      ischecked = newvalue!;
                                    },
                                  );
                                },
                              );
                            }),
                          ),
                        ),
                        const Text(
                          'Remember me',
                          style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                              color: Color(0xFF1F2937)),
                        ),
                        const Spacer(),
                        TextButton(
                            onPressed: () {},
                            child: const Text(
                              'Forgot password?',
                              style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400,
                                  color: Color(0xFF3366FF)),
                            ))
                      ],
                    ),
                    SizedBox(
                      height: 8.h,
                    ),
                    Row(
                      children: [
                        const Padding(
                          padding: EdgeInsets.only(left: 80),
                          child: Text(
                            'Dont have an account? ',
                            style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w400,
                                color: Color(0xFF9CA3AF)),
                          ),
                        ),
                        TextButton(
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => RegisterScreen()));
                            },
                            child: const Text(
                              'Register',
                              style: TextStyle(color: Color(0xFF3366FF)),
                            ))
                      ],
                    ),
                    SizedBox(
                      height: 2.h,
                    ),
                    if (errorMessage != null)
                      Text(
                        errorMessage!,
                        style: const TextStyle(color: Colors.red),
                      ),
                    SizedBox(
                      height: 6.h,
                      width: 85.w,
                      child: ElevatedButton(
                          onPressed: () {
                            BlocProvider.of<MycubitCubit>(context).Login(
                                emailController.text, passwordController.text);
                          },
                          style: ElevatedButton.styleFrom(
                              primary: const Color(0xFF3366FF),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(25))),
                          child: const Text('Login',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                              ))),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 30, left: 30),
                      child: Row(
                        children: [
                          Image.asset('assets/images/Line 1.png'),
                          const Padding(
                            padding: EdgeInsets.only(left: 10, right: 10),
                            child: Text('Or Sign Up With Account',
                                style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500,
                                    color: Color.fromARGB(255, 182, 179, 179))),
                          ),
                          Image.asset('assets/images/Line 1.png'),
                        ],
                      ),
                    ),
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 15),
                          child: SizedBox(
                            height: 8.h,
                            width: 45.w,
                            child: IconButton(
                                onPressed: () {},
                                icon: Image.asset('assets/images/google.png')),
                          ),
                        ),
                        SizedBox(
                          height: 8.h,
                          width: 45.w,
                          child: IconButton(
                              onPressed: () {},
                              icon: Image.asset('assets/images/facebook.png')),
                        )
                      ],
                    )
                  ],
                ),
              ),
            ),
          );
        }
      },
    );
    ;
  }
}
