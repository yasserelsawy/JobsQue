import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../model/generalModel.dart';

class Shapegeneral extends StatelessWidget {
  GeneralModel? generalModel;

  Shapegeneral({super.key, required this.generalModel});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 8.h,
      width: 100.w,
      decoration: const BoxDecoration(color: Color(0xffFAFAFA)),
      child: Row(
        children: [
          CircleAvatar(
            backgroundColor: Color(0xffD6E4FF),
            maxRadius: 25.sp,
            child: Image.asset(generalModel!.image),
          ),
          SizedBox(
            width: 5.w,
          ),
          SizedBox(
              width: 40.w,
              child: Text(
                generalModel!.name,
                style: const TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 16,
                    color: Color(0xff111827)),
              )),
          SizedBox(width: 5.w),
          IconButton(onPressed: () {}, icon: const Icon(Icons.arrow_forward))
        ],
      ),
    );
  }
}
