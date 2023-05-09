import 'package:flutter/material.dart';
import 'package:flutter_switch/flutter_switch.dart';

import 'package:sizer/sizer.dart';

import '../../model/notificationModel2.dart';

class ShapeNotification2 extends StatefulWidget {
  NotificationModel2 notificationModel2;
  ShapeNotification2({super.key, required this.notificationModel2});

  @override
  State<ShapeNotification2> createState() => _ShapeNotificationState();
}

class _ShapeNotificationState extends State<ShapeNotification2> {
  bool status = false;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 10.h,
      width: 130.w,
      decoration: BoxDecoration(color: Color(0xffFAFAFA)),
      child: Row(
        children: [
          SizedBox(
            width: 7.w,
          ),
          SizedBox(
              child: Text(
                widget.notificationModel2.name,
                style: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 16,
                    color: Color(0xff111827)),
              ),
              width: 58.w),
          SizedBox(width: 10.w),
          FlutterSwitch(
            width: 45.sp,
            height: 25.sp,
            valueFontSize: 25.0,
            toggleSize: 15.0,
            value: status,
            borderRadius: 25.0,
            padding: 8.0,
            showOnOff: false,
            onToggle: (val) {
              setState(() {
                status = val;
              });
            },
          ),
        ],
      ),
    );
  }
}
