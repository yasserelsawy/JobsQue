import 'dart:convert';
import 'dart:io';

import 'package:easy_stepper/easy_stepper.dart';
import 'package:graduation_project/view/pages/Profile/Education.dart';
import 'package:graduation_project/view/pages/Setting_profile/profile.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sizer/sizer.dart';
import 'package:http/http.dart' as http;
import '../../../controller/database/remote.dart';
import '../../Widgets/customtTextFormField.dart';

class PersonalDetails extends StatefulWidget {
  PersonalDetails({super.key});

  @override
  State<PersonalDetails> createState() => _PersonalDetailsState();
}

class _PersonalDetailsState extends State<PersonalDetails> {
  Api api = Api();
  TextEditingController namecontroller = TextEditingController();
  TextEditingController biocontroller = TextEditingController();
  TextEditingController adresscontroller = TextEditingController();
  TextEditingController phonecontroller = TextEditingController();

  var _image;
  ImageProvider defaultimage = AssetImage('assets/images/circle.png');

  Future getImage() async {
    final pickedFile =
        await ImagePicker().getImage(source: ImageSource.gallery);

    setState(() {
      if (pickedFile != null) {
        _image = File(pickedFile.path);
      } else {
        print('No image selected.');
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: SafeArea(
            child: Column(
              children: [
                Row(
                  children: [
                    IconButton(
                        onPressed: () {
                          Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                builder: (context) => Profile(),
                              ));
                        },
                        icon: Icon(Icons.arrow_back)),
                    SizedBox(
                      width: 25.w,
                    ),
                    const Text(
                      "Edit profile",
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w500,
                          color: Color(0xff111827)),
                    )
                  ],
                ),
                SizedBox(
                  height: 4.h,
                ),
                InkWell(
                  onTap: () {
                    getImage();
                  },
                  child: CircleAvatar(
                    backgroundColor: Colors.white,
                    backgroundImage:
                        _image != null ? FileImage(_image) : defaultimage,
                    radius: 50,
                    child: _image == null
                        ? Image.asset('assets/images/camera.png')
                        : null,
                  ),
                ),
                TextButton(
                    onPressed: () {
                      getImage();
                    },
                    child: Text(
                      'Change photo',
                      style:
                          TextStyle(color: Color(0xFF3366FF), fontSize: 13.sp),
                    )),
                SizedBox(
                  height: 2.h,
                ),
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 22, bottom: 10),
                      child: Text(
                        'Name',
                        style: TextStyle(
                            fontSize: 14.sp, color: Color(0xFF9CA3AF)),
                      ),
                    )
                  ],
                ),
                SizedBox(
                    height: 7.h,
                    width: 90.w,
                    child: CustomTextFormFieldnoImage(
                      controller: namecontroller,
                      hintText: 'Please enter your Name',
                    )),
                SizedBox(
                  height: 2.h,
                ),
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 22, bottom: 10),
                      child: Text(
                        'Bio',
                        style: TextStyle(
                            fontSize: 14.sp, color: Color(0xFF9CA3AF)),
                      ),
                    )
                  ],
                ),
                SizedBox(
                    height: 7.h,
                    width: 90.w,
                    child: CustomTextFormFieldnoImage(
                      controller: biocontroller,
                      hintText: 'Please enter your bio',
                    )),
                SizedBox(
                  height: 2.h,
                ),
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 22, bottom: 10),
                      child: Text(
                        'Adress',
                        style: TextStyle(
                            fontSize: 14.sp, color: Color(0xFF9CA3AF)),
                      ),
                    )
                  ],
                ),
                SizedBox(
                    width: 90.w,
                    child: CustomTextFormFieldnoImage(
                      controller: adresscontroller,
                      hintText: 'Please enter your Adress',
                    )),
                SizedBox(
                  height: 2.h,
                ),
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 22, bottom: 10),
                      child: Text(
                        'No.Headphone',
                        style: TextStyle(
                            fontSize: 14.sp, color: Color(0xFF9CA3AF)),
                      ),
                    )
                  ],
                ),
                SizedBox(
                  width: 90.w,
                  child: IntlPhoneField(
                    controller: phonecontroller,
                    invalidNumberMessage: 'Invalid Number',
                    style: TextStyle(fontSize: 14.sp),
                    decoration: InputDecoration(
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: const BorderSide(color: Colors.blue)),
                        enabledBorder: OutlineInputBorder(
                            borderSide:
                                const BorderSide(color: Color(0xFFD1D5DB)),
                            borderRadius: BorderRadius.circular(10)),
                        prefixIconColor: Colors.black,
                        focusColor: Colors.blue,
                        hintText: 'Enter Phone Number',
                        hintStyle: TextStyle(
                          fontSize: 14.sp,
                          color: Color(0xFF9CA3AF),
                        )),
                  ),
                ),
                SizedBox(
                  height: 1.h,
                ),
                SizedBox(
                  height: 48,
                  width: 327,
                  child: ElevatedButton(
                      onPressed: () {
                        api.updateProfile(
                            biocontroller.text,
                            namecontroller.text,
                            adresscontroller.text,
                            phonecontroller.text);
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => EducationPage()));
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
              ],
            ),
          ),
        ));
  }
}
