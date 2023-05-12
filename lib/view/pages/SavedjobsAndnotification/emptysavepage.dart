import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class Emptysave2 extends StatefulWidget {
  const Emptysave2({super.key});

  @override
  State<Emptysave2> createState() => _Emptysave2State();
}

int selectedindex = 0;

class _Emptysave2State extends State<Emptysave2> {
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
                width: 30.w,
              ),
              Text(
                'Saved',
                style: TextStyle(
                    fontSize: 18.sp,
                    fontWeight: FontWeight.w500,
                    color: const Color(0xFF111827)),
              )
            ],
          ),
          SizedBox(
            height: 25.h,
          ),
          Image.asset('assets/images/midscreen.png'),
          Text(
            'Nothing has been saved yet',
            style: TextStyle(
                fontSize: 19.sp,
                fontWeight: FontWeight.w500,
                color: Color(0xFF111827)),
          ),
          SizedBox(
            height: 8.sp,
          ),
          Text(
            'Press the star icon on the job you want to save.',
            style: TextStyle(
                fontSize: 13.sp,
                fontWeight: FontWeight.w400,
                color: Color(0xFF6B7280)),
          ),
        ],
      )),
    );
  }
}
