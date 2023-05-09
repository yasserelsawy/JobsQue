import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../pages/Messages/emptymessages.dart';
import '../pages/Messages/unreadmessages.dart';

class Bottomsheetbutton extends StatelessWidget {
  const Bottomsheetbutton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 32.h,
      width: 300.w,
      decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(85), topRight: Radius.circular(82))),
      child: Column(
        children: [
          SizedBox(
            height: 1.h,
          ),
          Image.asset('assets/images/smalldash.png'),
          SizedBox(
            height: 3.h,
          ),
          SizedBox(
            height: 6.h,
            width: 90.w,
            child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    elevation: 0,
                    side: const BorderSide(width: .5, color: Colors.grey),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(40)),
                    backgroundColor: const Color(0xFFFFFFFF)),
                onPressed: () {},
                child: Row(
                  children: [
                    Image.asset(
                      'assets/images/directbox.png',
                    ),
                    SizedBox(
                      width: 2.w,
                    ),
                    const Text(
                      'Apply job',
                      style: TextStyle(color: Color(0xFF111827)),
                    ),
                    SizedBox(width: 48.w),
                    const Icon(
                      Icons.arrow_forward_ios,
                      size: 15,
                      color: Color(0xFF111827),
                    )
                  ],
                )),
          ),
          SizedBox(
            height: 2.h,
          ),
          SizedBox(
            height: 6.h,
            width: 90.w,
            child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    elevation: 0,
                    side: const BorderSide(width: .5, color: Colors.grey),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(40)),
                    backgroundColor: const Color(0xFFFFFFFF)),
                onPressed: () {},
                child: Row(
                  children: [
                    Image.asset(
                      'assets/images/export.png',
                    ),
                    SizedBox(
                      width: 2.w,
                    ),
                    const Text(
                      'Share via...',
                      style: TextStyle(color: Color(0xFF111827)),
                    ),
                    SizedBox(width: 45.w),
                    const Icon(
                      Icons.arrow_forward_ios,
                      size: 15,
                      color: Color(0xFF111827),
                    )
                  ],
                )),
          ),
          SizedBox(
            height: 2.h,
          ),
          SizedBox(
            height: 6.h,
            width: 90.w,
            child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    elevation: 0,
                    side: const BorderSide(width: .5, color: Colors.grey),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(40)),
                    backgroundColor: const Color(0xFFFFFFFF)),
                onPressed: () {},
                child: Row(
                  children: [
                    Image.asset(
                      'assets/images/archiveminus.png',
                    ),
                    SizedBox(
                      width: 2.w,
                    ),
                    const Text(
                      'Cancel save',
                      style: TextStyle(color: Color(0xFF111827)),
                    ),
                    SizedBox(width: 45.w),
                    const Icon(
                      Icons.arrow_forward_ios,
                      size: 15,
                      color: Color(0xFF111827),
                    )
                  ],
                )),
          )
        ],
      ),
    );
  }
}

class messagesbottomsheet extends StatelessWidget {
  const messagesbottomsheet({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 35.h,
      width: 300.w,
      decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(85), topRight: Radius.circular(82))),
      child: Column(
        children: [
          SizedBox(
            height: 1.h,
          ),
          Image.asset('assets/images/smalldash.png'),
          SizedBox(
            height: 3.h,
          ),
          Align(
            alignment: Alignment.topLeft,
            child: Padding(
              padding: const EdgeInsets.only(left: 20),
              child: Text(
                'Message filters',
                style: TextStyle(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w500,
                    color: Color(0xFF111827)),
              ),
            ),
          ),
          SizedBox(
            height: 2.h,
          ),
          SizedBox(
            height: 7.h,
            width: 90.w,
            child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    elevation: 0,
                    side: const BorderSide(width: .5, color: Colors.grey),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(40)),
                    backgroundColor: const Color(0xFFFFFFFF)),
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => Unreadmessages()));
                },
                child: Row(
                  children: [
                    SizedBox(
                      width: 1.w,
                    ),
                    Text(
                      'Unread',
                      style:
                          TextStyle(fontSize: 13.sp, color: Color(0xFF374151)),
                    ),
                    SizedBox(width: 58.w),
                    const Icon(
                      Icons.arrow_forward_ios,
                      size: 15,
                      color: Color(0xFF111827),
                    )
                  ],
                )),
          ),
          SizedBox(
            height: 2.h,
          ),
          SizedBox(
            height: 6.h,
            width: 90.w,
            child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    elevation: 0,
                    side: const BorderSide(width: .5, color: Colors.grey),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(40)),
                    backgroundColor: const Color(0xFFFFFFFF)),
                onPressed: () {},
                child: Row(
                  children: [
                    SizedBox(
                      width: 2.w,
                    ),
                    Text(
                      'Spam',
                      style:
                          TextStyle(fontSize: 13.sp, color: Color(0xFF374151)),
                    ),
                    SizedBox(width: 60.w),
                    const Icon(
                      Icons.arrow_forward_ios,
                      size: 15,
                      color: Color(0xFF111827),
                    )
                  ],
                )),
          ),
          SizedBox(
            height: 2.h,
          ),
          SizedBox(
            height: 6.h,
            width: 90.w,
            child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    elevation: 0,
                    side: const BorderSide(width: .5, color: Colors.grey),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(40)),
                    backgroundColor: const Color(0xFFFFFFFF)),
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => Emptymessages()));
                },
                child: Row(
                  children: [
                    SizedBox(
                      width: 2.w,
                    ),
                    Text(
                      'Archived',
                      style:
                          TextStyle(fontSize: 13.sp, color: Color(0xFF374151)),
                    ),
                    SizedBox(width: 55.w),
                    const Icon(
                      Icons.arrow_forward_ios,
                      size: 15,
                      color: Color(0xFF111827),
                    )
                  ],
                )),
          )
        ],
      ),
    );
  }
}
