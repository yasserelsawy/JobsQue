import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:sizer/sizer.dart';

import '../../../controller/database/remote.dart';
import 'Loginscreen.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final FormKey = GlobalKey<FormState>();
  bool obsecuretext = true;
  late Api api;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Form(
          key: FormKey,
          child: Column(
            children: [
              Row(
                children: [
                  IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: const Icon(Icons.arrow_back),
                    padding: const EdgeInsets.only(right: 240),
                  ),
                  Image.asset('assets/images/logo.png')
                ],
              ),
              const Padding(
                padding: EdgeInsets.only(top: 60, right: 120),
                child: Text(
                  'Create Account',
                  style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.w500,
                      color: Color(0xFF111827)),
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(left: 7),
                child: Text('Please create an account to find your dream job',
                    style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w400,
                        color: Color(0xFF6B7280))),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 45),
                child: SizedBox(
                  width: 85.w,
                  height: 7.h,
                  child: TextFormField(
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'please enter your name';
                      }
                    },
                    controller: _nameController,
                    decoration: InputDecoration(
                        prefixIcon: Image.asset('assets/images/profile.png'),
                        hintText: 'Username',
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
              ),
              SizedBox(
                height: 2.h,
              ),
              SizedBox(
                width: 85.w,
                height: 7.h,
                child: TextFormField(
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'please enter your email';
                    }
                    if (!value.contains('@')) {
                      return 'please enter a valid email';
                    }
                  },
                  controller: _emailController,
                  decoration: InputDecoration(
                      prefixIcon: Image.asset('assets/images/emailicon.png'),
                      hintText: 'email',
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
              SizedBox(
                height: 2.h,
              ),
              SizedBox(
                width: 85.w,
                height: 10.h,
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
                  controller: _passwordController,
                  decoration: InputDecoration(
                      prefixIcon: Image.asset('assets/images/lock.png'),
                      suffixIcon: IconButton(
                        onPressed: () {
                          setState(() {
                            obsecuretext = !obsecuretext;
                          });
                        },
                        icon: Image.asset('assets/images/eye.png'),
                      ),
                      hintText: 'password',
                      helperText: 'password must contain 8 characters',
                      helperStyle: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                          color: _passwordController.text.length >= 8
                              ? Colors.green
                              : Colors.red),
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
              SizedBox(
                height: 8.h,
              ),
              Row(
                children: [
                  const Padding(
                    padding: EdgeInsets.only(left: 80),
                    child: Text(
                      'Already have an account?',
                      style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          color: Color.fromARGB(255, 185, 184, 184)),
                    ),
                  ),
                  TextButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: ((context) => LoginScreen())));
                      },
                      child: const Text(
                        'Login',
                        style:
                            TextStyle(color: Color.fromARGB(255, 15, 105, 179)),
                      ))
                ],
              ),
              SizedBox(
                height: 1.h,
              ),
              SizedBox(
                height: 6.h,
                width: 85.w,
                child: ElevatedButton(
                    onPressed: () {
                      Register(_nameController.text, _emailController.text,
                          _passwordController.text, (context));
                    },
                    style: ElevatedButton.styleFrom(
                        primary: Color(0xFF3366FF),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(25))),
                    child: const Text('Create account',
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
}
