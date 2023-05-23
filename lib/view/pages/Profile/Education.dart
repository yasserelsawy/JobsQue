import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation_project/controller/cubit/mycubit_cubit.dart';
import 'package:graduation_project/view/pages/Profile/Experience.dart';
import 'package:sizer/sizer.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:http/http.dart' as http;
import '../../../controller/database/remote.dart';
import '../../Widgets/customtTextFormField.dart';

class EducationPage extends StatefulWidget {
  const EducationPage({super.key});

  @override
  State<EducationPage> createState() => _EducationPageState();
}

class _EducationPageState extends State<EducationPage> {
  TextEditingController universitycontroller = TextEditingController();
  TextEditingController titlecontroller = TextEditingController();
  TextEditingController startyearcontroller = TextEditingController();

  TextEditingController endyearcontroller = TextEditingController();

  late DateTime _Startyear;
  late DateTime _Endyear;
  Api api = Api();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: const Icon(
          Icons.arrow_back,
          color: Colors.black,
        ),
        title: Text(
          'Education',
          style: TextStyle(
              fontSize: 16.sp,
              color: const Color(0xFF111827),
              fontWeight: FontWeight.w500),
        ),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 2.h,
            ),
            Center(
              child: Container(
                height: 68.h,
                width: 90.w,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    border: Border.all(color: Color(0xFFD1D5DB))),
                child: Column(children: [
                  SizedBox(
                    height: 2.h,
                  ),
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 12, bottom: 10),
                        child: Text(
                          'University *',
                          style: TextStyle(
                              fontSize: 14.sp, color: Color(0xFF9CA3AF)),
                        ),
                      )
                    ],
                  ),
                  SizedBox(
                      height: 7.h,
                      width: 80.w,
                      child: CustomTextFormFieldnoImage(
                        controller: universitycontroller,
                        hintText: 'Please enter your University',
                      )),
                  SizedBox(
                    height: 2.h,
                  ),
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 12, bottom: 10),
                        child: Text(
                          'Title ',
                          style: TextStyle(
                              fontSize: 14.sp, color: Color(0xFF9CA3AF)),
                        ),
                      )
                    ],
                  ),
                  SizedBox(
                      height: 7.h,
                      width: 80.w,
                      child: CustomTextFormFieldnoImage(
                        controller: titlecontroller,
                        hintText: 'Please enter your Title',
                      )),
                  SizedBox(
                    height: 2.h,
                  ),
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 12, bottom: 10),
                        child: Text(
                          'Start Year ',
                          style: TextStyle(
                              fontSize: 14.sp, color: Color(0xFF9CA3AF)),
                        ),
                      )
                    ],
                  ),
                  SizedBox(
                      height: 7.h,
                      width: 80.w,
                      child: CustomTextFormFieldnoImage(
                        controller: startyearcontroller,
                        hintText: 'Please enter your Start Year',
                        suffixIcon: IconButton(
                            onPressed: () {
                              DatePicker.showDatePicker(
                                context,
                                showTitleActions: true,
                                onConfirm: (date) {
                                  setState(() {
                                    _Startyear = date;
                                    startyearcontroller.text =
                                        _Startyear.toString();
                                  });
                                },
                                currentTime: DateTime.now(),
                              );
                              controller:
                              TextEditingController(
                                  text: _Startyear.toString());
                            },
                            icon: Image.asset('assets/images/calendar.png')),
                      )),
                  SizedBox(
                    height: 2.h,
                  ),
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 12, bottom: 10),
                        child: Text(
                          'End Year ',
                          style: TextStyle(
                              fontSize: 14.sp, color: Color(0xFF9CA3AF)),
                        ),
                      )
                    ],
                  ),
                  SizedBox(
                      height: 7.h,
                      width: 80.w,
                      child: CustomTextFormFieldnoImage(
                        controller: endyearcontroller,
                        suffixIcon: IconButton(
                            onPressed: () {
                              DatePicker.showDatePicker(
                                context,
                                showTitleActions: true,
                                onConfirm: (date) {
                                  setState(() {
                                    _Endyear = date;
                                    endyearcontroller.text =
                                        _Endyear.toString();
                                  });
                                },
                                currentTime: DateTime.now(),
                              );
                            },
                            icon: Image.asset('assets/images/calendar.png')),
                        hintText: 'Please enter your End Year',
                      )),
                  SizedBox(
                    height: 8.h,
                  ),
                  SizedBox(
                    height: 48,
                    width: 327,
                    child: ElevatedButton(
                        onPressed: () {
                          api.postEducation(
                              universitycontroller.text,
                              titlecontroller.text,
                              startyearcontroller.text,
                              endyearcontroller.text,
                              context);
                          // Navigator.push(
                          //     context,
                          //     MaterialPageRoute(
                          //         builder: (context) => Experiencepage()));
                        },
                        style: ElevatedButton.styleFrom(
                            primary: Color(0xFF3366FF),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(25))),
                        child: const Text('Next',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                            ))),
                  ),
                ]),
              ),
            ),
            SizedBox(
              height: 2.h,
            ),
            Container(
              height: 15.h,
              width: 90.w,
              decoration: BoxDecoration(
                  border: Border.all(color: Color(0xFFD1D5DB)),
                  borderRadius: BorderRadius.circular(10)),
              child: Padding(
                padding: const EdgeInsets.only(top: 12),
                child: ListTile(
                  leading: Image.asset('assets/images/logo4.png'),
                  title: Text(
                    'The University of Arizona',
                    style:
                        TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w500),
                  ),
                  subtitle: Text(
                    'Bachelor of Art and Design',
                    style: TextStyle(
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w400,
                        color: Color(0xFF6B7280)),
                  ),
                  trailing: IconButton(
                    onPressed: () {},
                    icon: Image.asset('assets/images/edit.png'),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
