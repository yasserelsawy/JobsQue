import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../model/othersModel.dart';

class Shapeothers extends StatelessWidget {
  OthersModel? othersModel;

  Shapeothers({super.key, required this.othersModel});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 8.h,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(color: Color(0xffFAFAFA)),
      child: Row(
        children: [
          SizedBox(
            width: 2.w,
          ),
          SizedBox(
              child: Text(
                othersModel!.name,
                style: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 16,
                    color: Color(0xff111827)),
              ),
              width: 58.w),
          SizedBox(width: 5.w),
          IconButton(onPressed: () {}, icon: const Icon(Icons.arrow_forward))
        ],
      ),
    );
  }
}
