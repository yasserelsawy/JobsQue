import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../model/accessModel.dart';

class ShapeAccess extends StatelessWidget {
  AccessModel accessModel;
  ShapeAccess({super.key, required this.accessModel});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 10.h,
      width: 130.w,
      decoration: BoxDecoration(color: Color(0xffFAFAFA)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(
            width: 5.w,
          ),
          SizedBox(
              child: Text(
                accessModel.name,
                style: const TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 16,
                    color: Color(0xff111827)),
              ),
              width: 45.w),
          SizedBox(width: 30.w),
          IconButton(onPressed: () {}, icon: const Icon(Icons.arrow_forward))
        ],
      ),
    );
  }
}
