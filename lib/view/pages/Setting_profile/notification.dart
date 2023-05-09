import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:graduation_project/view/pages/Setting_profile/profile.dart';
import 'package:graduation_project/view/pages/Setting_profile/protfolio.dart';

import 'package:sizer/sizer.dart';

import '../../../model/notificationModel1.dart';
import '../../../model/notificationModel2.dart';
import '../../widgets/assets.dart';
import '../../widgets/shapeNotification.dart';
import '../../widgets/shapeNotification2.dart';
import '../loginandregister/Loginscreen.dart';
import 'editeProfile.dart';
import 'language.dart';

class Notifications1 extends StatelessWidget {
  const Notifications1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  IconButton(
                      onPressed: () {
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (context) => Profile(),
                            ));
                      },
                      icon: Image.asset(AppAssets.arrowleft)),
                  SizedBox(
                    width: 25.w,
                  ),
                  const Text(
                    "Notification",
                    style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 20,
                        color: Color(0xff111827)),
                  ),
                  SizedBox(
                    width: 25.w,
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsets.only(top: 30.sp),
                child: Container(
                  height: 5.h,
                  width: 120.w,
                  decoration: const BoxDecoration(color: Color(0xffE5E7E4)),
                  child: Padding(
                    padding: EdgeInsets.only(top: 8.sp, left: 20.sp),
                    child: const Text(
                      "Job notification",
                      style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          color: Color(0xff6B7280)),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 50.h,
                width: 130.w,
                child: ListView.separated(
                    physics: const NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index) {
                      return InkWell(
                          onTap: () {
                            if (index == 0) {
                              Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => const Editeprofile(),
                                  ));
                            } else if (index == 1) {
                              Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => Protfolio(),
                                  ));
                            } else if (index == 2) {
                              Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => Language(),
                                  ));
                            } else if (index == 3) {
                              Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => Notifications1(),
                                  ));
                            } else if (index == 4) {
                              Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => LoginScreen(),
                                  ));
                            }
                          },
                          child: ShapeNotification(
                            notificationModel: NotificationModel.data[index],
                          ));
                    },
                    separatorBuilder: (context, index) => const Divider(),
                    itemCount: NotificationModel.data.length),
              ),
              Container(
                height: 5.h,
                width: 120.w,
                decoration: const BoxDecoration(color: Color(0xffE5E7E4)),
                child: Padding(
                  padding: EdgeInsets.only(top: 8.sp, left: 20.sp),
                  child: const Text(
                    "Other notification",
                    style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color: Color(0xff6B7280)),
                  ),
                ),
              ),
              SizedBox(
                height: 35.h,
                width: 130.w,
                child: ListView.separated(
                    physics: const NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index) {
                      return InkWell(
                          onTap: () {
                            if (index == 0) {
                              Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => const Editeprofile(),
                                  ));
                            } else if (index == 1) {
                              Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => Protfolio(),
                                  ));
                            } else if (index == 2) {
                              Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => Language(),
                                  ));
                            } else if (index == 3) {
                              Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => Notifications1(),
                                  ));
                            } else if (index == 4) {
                              Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => LoginScreen(),
                                  ));
                            }
                          },
                          child: ShapeNotification2(
                            notificationModel2: NotificationModel2.data[index],
                          ));
                    },
                    separatorBuilder: (context, index) => const Divider(),
                    itemCount: NotificationModel2.data.length),
              ),
              Image.asset(AppAssets.homeIndicator),
            ],
          ),
        ),
      ),
    );
  }
}
