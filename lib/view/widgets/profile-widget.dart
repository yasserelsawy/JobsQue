import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class ProfileWidget extends StatelessWidget {
  const ProfileWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Spacer(),
        CircleAvatar(
          backgroundColor: Colors.transparent,
          child: Image.asset(
            height: 8.h,
            'assets/images/Dimas Profile.png',
            fit: BoxFit.cover,
          ),
        ),
        Spacer(),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Text(
                  'Dimas Adi Saputro',
                  style: TextStyle(
                      fontSize: 11.sp,
                      fontWeight: FontWeight.w700,
                      color: Color(0xFF111827)),
                ),
              ],
            ),
            SizedBox(
              height: 1.h,
            ),
            Text(
              'Senior UI/UX Designer at Twitter',
              style: TextStyle(fontSize: 9.sp, color: Color(0xFF6B7280)),
            ),
          ],
        ),
        Spacer(
          flex: 3,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text(
              'Work during',
              style: TextStyle(fontSize: 9.sp, color: Color(0xFF6B7280)),
            ),
            SizedBox(
              height: 1.h,
            ),
            Row(
              children: [
                Text(
                  '5 Years',
                  style: TextStyle(fontSize: 9.sp, color: Color(0xFF3366FF)),
                ),
              ],
            ),
          ],
        ),
        Spacer()
      ],
    );
  }
}
