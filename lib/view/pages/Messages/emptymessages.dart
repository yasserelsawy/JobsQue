import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../widgets/Constants.dart';

class Emptymessages extends StatelessWidget {
  Emptymessages({super.key});
  int selectedindex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Column(children: [
        SizedBox(
          height: 2.h,
        ),
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
              width: 25.w,
            ),
            Text(
              'Messsages',
              style: TextStyle(
                  fontSize: 18.sp,
                  fontWeight: FontWeight.w500,
                  color: const Color(0xFF111827)),
            )
          ],
        ),
        SizedBox(
          height: 2.h,
        ),
        Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
          SizedBox(
            width: 70.w,
            height: 7.h,
            child: TextFormField(
              decoration: InputDecoration(
                  prefixIcon: const Icon(
                    Icons.search,
                    size: 30,
                    color: Color(0xFF292D32),
                  ),
                  hintText: 'Search messages....',
                  hintStyle: const TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w400,
                      color: Color(0xFF9CA3AF)),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(85.0),
                      borderSide: const BorderSide(color: Color(0xFFD1D5DB))),
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(85.0),
                      borderSide: const BorderSide(
                        color: Color.fromARGB(255, 180, 177, 177),
                      ))),
            ),
          ),
          InkWell(
            onTap: () {
              showModalBottomSheet(
                  shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(25),
                          topRight: Radius.circular(25))),
                  context: context,
                  builder: (context) => const messagesbottomsheet());
            },
            child: Image.asset('assets/images/Filter.png'),
          )
        ]),
        SizedBox(
          height: 15.h,
        ),
        Image.asset('assets/images/midscreen3.png'),
        SizedBox(
          height: 4.h,
        ),
        Padding(
          padding: const EdgeInsets.only(left: 25),
          child: Text(
            'You have not received any messages',
            style: TextStyle(
                fontSize: 19.sp,
                fontWeight: FontWeight.w500,
                color: Color(0xFF111827)),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 25, top: 10),
          child: Text(
            'Once your application has reached the interview stage, you will get a message from the recruiter.',
            style: TextStyle(
                fontSize: 12.sp,
                fontWeight: FontWeight.w400,
                color: Color(0xFF6B7280)),
          ),
        ),
      ])),
      bottomNavigationBar:
          StatefulBuilder(builder: (context, StateSetter setstate) {
        return BottomNavigationBar(
            showUnselectedLabels: true,
            selectedItemColor: const Color(0xFF3366FF),
            unselectedItemColor: const Color(0xFF9CA3AF),
            currentIndex: selectedindex,
            onTap: (index) {
              setstate(() {
                selectedindex = index;
              });
            },
            items: [
              BottomNavigationBarItem(
                  label: 'home',
                  icon: Image.asset('assets/images/home.png'),
                  activeIcon: Image.asset('assets/images/home2.png')),
              BottomNavigationBarItem(
                  label: 'messages',
                  icon: Image.asset('assets/images/message.png'),
                  activeIcon: Image.asset('assets/images/message2.png')),
              BottomNavigationBarItem(
                  label: 'Applied',
                  icon: Image.asset('assets/images/briefcase2.png'),
                  activeIcon: Image.asset('assets/images/briefcase.png')),
              BottomNavigationBarItem(
                  label: 'Saved',
                  icon: Image.asset('assets/images/archive.png'),
                  activeIcon: Image.asset('assets/images/archive2.png')),
              const BottomNavigationBarItem(
                  label: 'Profile', icon: Icon(Icons.person))
            ]);
      }),
    );
  }
}
