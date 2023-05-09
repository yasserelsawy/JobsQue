import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class Chatbottomsheet extends StatelessWidget {
  const Chatbottomsheet({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60.h,
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
            height: 1.h,
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
                onPressed: () {},
                child: Row(
                  children: [
                    Image.asset(
                      'assets/images/briefcase3.png',
                    ),
                    SizedBox(
                      width: 2.w,
                    ),
                    Text(
                      'Visit job post',
                      style:
                          TextStyle(color: Color(0xFF111827), fontSize: 12.sp),
                    ),
                    SizedBox(width: 42.w),
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
            height: 7.h,
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
                      'assets/images/note.png',
                    ),
                    SizedBox(
                      width: 2.w,
                    ),
                    Text(
                      'View my application',
                      style:
                          TextStyle(color: Color(0xFF111827), fontSize: 12.sp),
                    ),
                    SizedBox(width: 30.w),
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
            height: 7.h,
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
                      'assets/images/sms2.png',
                    ),
                    SizedBox(
                      width: 2.w,
                    ),
                    Text(
                      'Mark as unread',
                      style:
                          TextStyle(color: Color(0xFF111827), fontSize: 12.sp),
                    ),
                    SizedBox(width: 40.w),
                    const Icon(
                      Icons.arrow_forward_ios,
                      size: 15,
                      color: Color(0xFF111827),
                    ),
                  ],
                )),
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
                onPressed: () {},
                child: Row(
                  children: [
                    Image.asset(
                      'assets/images/notification.png',
                    ),
                    SizedBox(
                      width: 2.w,
                    ),
                    Text(
                      'Mute',
                      style:
                          TextStyle(color: Color(0xFF111827), fontSize: 12.sp),
                    ),
                    SizedBox(width: 57.w),
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
            height: 7.h,
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
                      'assets/images/notification.png',
                    ),
                    SizedBox(
                      width: 2.w,
                    ),
                    Text(
                      'Archive',
                      style:
                          TextStyle(color: Color(0xFF111827), fontSize: 12.sp),
                    ),
                    SizedBox(width: 52.w),
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
            height: 7.h,
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
                      'assets/images/trash.png',
                    ),
                    SizedBox(
                      width: 2.w,
                    ),
                    Text(
                      'Delete conversation',
                      style:
                          TextStyle(color: Color(0xFF111827), fontSize: 12.sp),
                    ),
                    SizedBox(width: 30.w),
                    const Icon(
                      Icons.arrow_forward_ios,
                      size: 15,
                      color: Color(0xFF111827),
                    )
                  ],
                )),
          ),
        ],
      ),
    );
  }
}
