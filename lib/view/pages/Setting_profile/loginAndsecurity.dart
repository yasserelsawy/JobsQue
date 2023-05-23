import 'package:flutter/material.dart';
import 'package:graduation_project/view/pages/Setting_profile/profile.dart';
import 'package:graduation_project/view/pages/Setting_profile/protfolio.dart';
import 'package:graduation_project/view/pages/Setting_profile/notification.dart';

import 'package:sizer/sizer.dart';

import '../../../model/accessModel.dart';
import '../../../model/notificationmodel.dart';
import '../../widgets/assets.dart';
import '../../widgets/shapeAccess.dart';
import '../loginandregister/Loginscreen.dart';
import 'editeProfile.dart';
import 'language.dart';

class LoginAndSecurity extends StatelessWidget {
  const LoginAndSecurity({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                IconButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => Profile(),
                          ));
                    },
                    icon: Image.asset(AppAssets.arrowleft)),
                SizedBox(
                  width: 15.w,
                ),
                const Text(
                  "Login and security",
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
                    "Accont access",
                    style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color: Color(0xff6B7280)),
                  ),
                ),
              ),
            ),
            Stack(
              children: [
                SizedBox(
                  height: 65.h,
                  width: 130.w,
                  child: ListView.separated(
                      physics: const NeverScrollableScrollPhysics(),
                      itemBuilder: (context, index) {
                        return InkWell(
                            onTap: () {
                              if (index == 0) {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          const Editeprofile(),
                                    ));
                              } else if (index == 1) {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => Protfolio(),
                                    ));
                              } else if (index == 2) {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => Language(),
                                    ));
                              } else if (index == 3) {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => Notifications1(),
                                    ));
                              } else if (index == 4) {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => LoginScreen(),
                                    ));
                              }
                            },
                            child: ShapeAccess(
                              accessModel: AccessModel.data[index],
                            ));
                      },
                      separatorBuilder: (context, index) => const Divider(),
                      itemCount: AccessModel.data.length),
                ),
                Padding(
                  padding: EdgeInsets.only(right: 55.sp, top: 22.sp),
                  child: const Align(
                    alignment: Alignment.topRight,
                    child: Text(
                      "rafifdian12@gmail.com",
                      style: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 14,
                          color: Color(0xff6B7280)),
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.bottomRight,
                  child: Padding(
                    padding: EdgeInsets.only(right: 55.sp, top: 249.sp),
                    child: const Text(
                      "Non active",
                      style: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 14,
                          color: Color(0xff6B7280)),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 7.h,
            ),
            Image.asset(AppAssets.homeIndicator),
          ],
        ),
      ),
    );
  }
}
