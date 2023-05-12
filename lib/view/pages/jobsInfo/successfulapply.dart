import 'package:flutter/material.dart';
import 'package:graduation_project/view/pages/Setting_profile/profile.dart';
import 'package:sizer/sizer.dart';

class SuccessApply extends StatefulWidget {
  SuccessApply({super.key});

  @override
  State<SuccessApply> createState() => SuccessApplyState();
}

class SuccessApplyState extends State<SuccessApply> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Row(
              children: [
                IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: const Icon(
                      Icons.arrow_back,
                      size: 25,
                    )),
                SizedBox(
                  width: 25.w,
                ),
                Text(
                  'Apply Job',
                  style: TextStyle(
                      fontSize: 18.sp,
                      fontWeight: FontWeight.w500,
                      color: const Color(0xFF111827)),
                )
              ],
            ),
            SizedBox(
              height: 22.h,
            ),
            Image.asset('assets/images/apply.png'),
            SizedBox(
              height: 4.h,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 28),
              child: Center(
                child: ListTile(
                  title: Text(
                    'Your data has been successfully sent',
                    style: TextStyle(
                        fontSize: 19.sp,
                        fontWeight: FontWeight.w500,
                        color: Color(0xFF111827)),
                  ),
                  subtitle: Padding(
                    padding: const EdgeInsets.only(top: 8),
                    child: Text(
                      'You will get a message from our team, about the announcement of employee acceptance',
                      style: TextStyle(
                          fontSize: 13.sp,
                          fontWeight: FontWeight.w400,
                          color: Color(0xFF6B7280)),
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 20.h,
            ),
            SizedBox(
              height: 48,
              width: 327,
              child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => Profile()));
                  },
                  style: ElevatedButton.styleFrom(
                      primary: Color(0xFF3366FF),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(25))),
                  child: const Text('Back To Home',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ))),
            ),
          ],
        ),
      ),
    );
  }
}
