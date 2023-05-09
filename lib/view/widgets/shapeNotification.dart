import 'package:flutter/material.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:sizer/sizer.dart';

import '../../model/notificationModel1.dart';

class ShapeNotification extends StatefulWidget {
  NotificationModel notificationModel;
  ShapeNotification({
    super.key,
    required this.notificationModel,
  });

  @override
  State<ShapeNotification> createState() => _ShapeNotificationState();
}

class _ShapeNotificationState extends State<ShapeNotification> {
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
              width: 58.w,
              child: Text(
                widget.notificationModel.name,
                style: const TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 16,
                    color: Color(0xff111827)),
              )),
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
