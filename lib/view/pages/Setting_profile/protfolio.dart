import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:graduation_project/view/pages/Setting_profile/profile.dart';
import 'package:sizer/sizer.dart';

import '../../widgets/assets.dart';

class Protfolio extends StatelessWidget {
  const Protfolio({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.only(top: 8.0.sp),
          child: Column(
            children: [
              Row(
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: 15.sp),
                    child: IconButton(
                        onPressed: () {
                          Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                builder: (context) => Profile(),
                              ));
                        },
                        icon: Icon(Icons.arrow_back)),
                  ),
                  SizedBox(
                    width: 20.w,
                  ),
                  Text(
                    "Portfolio",
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w500,
                        color: Color(0xff111827)),
                  )
                ],
              ),
              Padding(
                padding:
                    EdgeInsets.only(left: 10.sp, top: 15.sp, bottom: 20.sp),
                child: Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      "Add portfolio here",
                      style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 16.sp,
                          color: Color(0xff111827)),
                    )),
              ),
              DottedBorder(
                dashPattern: [5, 5],
                strokeWidth: 1.5,
                color: Color(0xFF3366FF),
                child: Container(
                  height: 30.h,
                  width: 90.w,
                  color: Color(0xFFECF2FF),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 16.0),
                        child: Image.asset(
                          'assets/images/document-upload.png',
                          height: 9.h,
                          width: 50.w,
                        ),
                      ),
                      SizedBox(height: 1.h),
                      Text(
                        'Upload your other file',
                        style: TextStyle(
                            fontSize: 16.sp, fontWeight: FontWeight.w500),
                      ),
                      SizedBox(height: 1.h),
                      Text(
                        'Max. file size 10 MB',
                        style: TextStyle(
                            fontSize: 10.sp, color: Color(0xFF6B7280)),
                      ),
                      SizedBox(height: 2.h),
                      Container(
                        width: 80.w,
                        height: 6.h,
                        color: Colors.transparent,
                        child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(25),
                                ),
                                backgroundColor: const Color(0xFFD6E4FF)),
                            onPressed: () {},
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Image.asset(
                                  'assets/images/export.png',
                                  height: 3.h,
                                  width: 5.w,
                                ),
                                Text(
                                  'Add file',
                                  style: TextStyle(
                                      fontSize: 12.sp,
                                      color: Color(0xFF3366FF)),
                                )
                              ],
                            )),
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 8.sp),
                child: SizedBox(
                    height: 40.h,
                    width: 90.w,
                    child: ListView.separated(
                        itemBuilder: (context, index) => Container(
                              height: 10.h,
                              width: 60.w,
                              decoration: BoxDecoration(
                                  border: Border.all(color: Color(0xffD1D1D1)),
                                  borderRadius: BorderRadius.circular(15),
                                  color: Colors.white),
                              child: Row(
                                children: [
                                  Padding(
                                    padding: EdgeInsets.only(left: 10.sp),
                                    child: Image.asset(AppAssets.pdf),
                                  ),
                                  SizedBox(
                                    width: 120.sp,
                                    child: const ListTile(
                                      title: Text(
                                        "UI/UX Designer",
                                        style: TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.w500,
                                            color: Color(0xff111827)),
                                      ),
                                      subtitle: Text(
                                        "CV.pdf 300KB",
                                        style: TextStyle(
                                            fontSize: 12,
                                            fontWeight: FontWeight.w400,
                                            color: Color(0xff111827)),
                                      ),
                                    ),
                                  ),
                                  IconButton(
                                      onPressed: () {},
                                      icon: Image.asset(AppAssets.edit)),
                                  IconButton(
                                      onPressed: () {},
                                      icon: Image.asset(AppAssets.close))
                                ],
                              ),
                            ),
                        separatorBuilder: (context, index) => SizedBox(
                              height: 10.sp,
                            ),
                        itemCount: 3)),
              ),
              Image.asset(AppAssets.homeIndicator)
            ],
          ),
        ),
      ),
    );
  }
}
