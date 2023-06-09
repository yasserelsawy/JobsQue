import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:sizer/sizer.dart';

import '../../../model/chatmodel.dart';
import '../../widgets/chatbottomsheet.dart';
import '../../widgets/messagebubble.dart';

class Chatpage extends StatelessWidget {
  Chatpage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Column(
        children: [
          SizedBox(
            height: 2.h,
          ),
          Container(
            height: 10.h,
            decoration: const BoxDecoration(
                border: Border(bottom: BorderSide(color: Color(0xFFD1D5DB)))),
            child: Row(
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
                  width: 2.w,
                ),
                Image.asset('assets/images/twitter3.png'),
                SizedBox(
                  width: 2.w,
                ),
                Text(
                  'Twitter',
                  style: TextStyle(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w500,
                      color: const Color(0xFF111827)),
                ),
                SizedBox(
                  width: 40.w,
                ),
                IconButton(
                    onPressed: () {
                      showModalBottomSheet(
                          shape: const RoundedRectangleBorder(
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(25),
                                  topRight: Radius.circular(25))),
                          context: context,
                          builder: (context) => const Chatbottomsheet());
                    },
                    icon: Image.asset('assets/images/more.png'))
              ],
            ),
          ),
          SizedBox(
            height: 3.h,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset('assets/images/smalldash2.png'),
              SizedBox(
                width: 3.w,
              ),
              Text(
                'Today,Nov 13',
                style:
                    TextStyle(color: const Color(0xFF9CA3AF), fontSize: 9.sp),
              ),
              SizedBox(
                width: 3.w,
              ),
              Image.asset('assets/images/smalldash2.png')
            ],
          ),
          SizedBox(
            height: 2.h,
          ),
          Expanded(
            child: Container(
              width: 100.w,
              height: double.infinity,
              child: ListView.separated(
                separatorBuilder: (context, index) => SizedBox(
                  height: 2.h,
                ),
                itemCount: chatMessages.length,
                itemBuilder: (context, index) => MessageBubble(
                  chat: chatMessages[index],
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 25),
            child: Row(
              children: [
                InkWell(
                    onTap: () {},
                    child: Image.asset('assets/images/paperclip.png')),
                SizedBox(
                  width: 2.w,
                ),
                SizedBox(
                  width: 70.w,
                  height: 6.h,
                  child: TextFormField(
                    decoration: InputDecoration(
                        hintText: 'Write a message',
                        hintStyle: const TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w400,
                            color: Color(0xFF9CA3AF)),
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(85.0),
                            borderSide:
                                const BorderSide(color: Color(0xFFD1D5DB))),
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(85.0),
                            borderSide: const BorderSide(
                              color: Color.fromARGB(255, 180, 177, 177),
                            ))),
                  ),
                ),
                SizedBox(
                  width: 2.w,
                ),
                InkWell(
                    onTap: () {},
                    child: Image.asset('assets/images/Microphone.png'))
              ],
            ),
          )
        ],
      )),
    );
  }
}
