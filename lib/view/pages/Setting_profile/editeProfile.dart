import 'package:flutter/material.dart';
import 'package:graduation_project/view/pages/Setting_profile/profile.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:sizer/sizer.dart';

import '../../widgets/assets.dart';

class Editeprofile extends StatelessWidget {
  const Editeprofile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            children: [
              Row(
                children: [
                  IconButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => Profile(),
                            ));
                      },
                      icon: Icon(Icons.arrow_back)),
                  SizedBox(
                    width: 25.w,
                  ),
                  Text(
                    "Edite Profile",
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w500,
                        color: Color(0xff111827)),
                  )
                ],
              ),
              Padding(
                padding: EdgeInsets.only(top: 12.sp),
                child: Align(
                  alignment: AlignmentDirectional.topCenter,
                  child: Container(
                    child: IconButton(
                        onPressed: () {},
                        icon: Icon(
                          Icons.camera_alt_outlined,
                          color: Colors.white,
                        )),
                    width: 30.0.w,
                    height: 15.0.h,
                    decoration: BoxDecoration(
                      color: const Color(0xff7c94b6),
                      image: const DecorationImage(
                        image: AssetImage(AppAssets.profile),
                        fit: BoxFit.cover,
                      ),
                      borderRadius:
                          const BorderRadius.all(Radius.circular(150.0)),
                      border: Border.all(
                        color: Colors.white,
                        width: 1.0.w,
                      ),
                    ),
                  ),
                ),
              ),
              TextButton(
                  onPressed: () {},
                  child: Text(
                    "Change  Photo",
                    style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 16,
                        color: Color(0xff3366FF)),
                  )),
              SizedBox(
                height: 55.h,
                child: ListView(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(left: 7.w),
                      child: Text(
                        "Name",
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                            color: Color(0xff9CA3AF)),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                          right: 15.sp, left: 15.sp, top: 3.sp, bottom: 3.sp),
                      child: TextFormField(
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "please enter Username";
                          } else {
                            return null;
                          }
                        },
                        keyboardType: TextInputType.name,
                        decoration: InputDecoration(
                          border: const OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(20))),
                          hintText: "Username",
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 7.w),
                      child: Text(
                        "Bio",
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                            color: Color(0xff9CA3AF)),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                          right: 15.sp, left: 15.sp, top: 3.sp, bottom: 3.sp),
                      child: TextFormField(
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "please enter Bio";
                          } else {
                            return null;
                          }
                        },
                        keyboardType: TextInputType.name,
                        decoration: InputDecoration(
                          border: const OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(20))),
                          hintText: "Bio",
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 7.w),
                      child: Text(
                        "Address",
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                            color: Color(0xff9CA3AF)),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                          right: 15.sp, left: 15.sp, top: 3.sp, bottom: 3.sp),
                      child: TextFormField(
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "please enter Username";
                          } else {
                            return null;
                          }
                        },
                        keyboardType: TextInputType.name,
                        decoration: InputDecoration(
                          border: const OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(20))),
                          hintText: "Address",
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 7.w),
                      child: Text(
                        "No.Handphone",
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                            color: Color(0xff9CA3AF)),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                          right: 15.sp, left: 15.sp, top: 3.sp, bottom: 3.sp),
                      child: IntlPhoneField(
                        decoration: InputDecoration(
                          labelText: 'Phone Number',
                          border: const OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(20))),
                        ),
                        initialCountryCode: 'IN',
                        onChanged: (phone) {
                          print(phone.completeNumber);
                        },
                      ),
                    )
                  ],
                ),
              ),
              ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all(Color(0xff3366FF)),
                    padding: MaterialStateProperty.all<EdgeInsets>(
                        const EdgeInsets.only(
                            right: 135, left: 135, top: 20, bottom: 20)),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(50))),
                  ),
                  onPressed: () {},
                  child: const Text(
                    "Save",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: Color(0xffFFFFFF),
                    ),
                  )),
              Image.asset(AppAssets.homeIndicator)
            ],
          ),
        ),
      ),
    );
  }
}
