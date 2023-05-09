import 'package:flutter/material.dart';

import 'package:sizer/sizer.dart';

import '../../model/langugeModel.dart';

class LangugeWidget extends StatefulWidget {
  Languge? languge;

  LangugeWidget({super.key, required this.languge});

  @override
  State<LangugeWidget> createState() => _LangugeWidgetState();
}

class _LangugeWidgetState extends State<LangugeWidget> {
  int radio = 0;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 8.h,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(color: Color(0xffFAFAFA)),
      child: Row(
        children: [
          Image.asset(widget.languge!.image),
          SizedBox(
            width: 5.w,
          ),
          SizedBox(
              child: Text(
                widget.languge!.name,
                style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 16,
                    color: Color(0xff111827)),
              ),
              width: 40.w),
          SizedBox(width: 13.w),
          Radio(
            value: Languge.lang.length,
            groupValue: radio,
            onChanged: (value) {
              setState(() {
                radio = value!;
              });
            },
          )
        ],
      ),
    );
  }
}
