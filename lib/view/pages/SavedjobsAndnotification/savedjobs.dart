// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:graduation_project/model/savedjobsmodel.dart';
import '../../widgets/Cards.dart';

class Savedjobs extends StatelessWidget {
  late Savedjobsmodel? model;
  int selectedindex = 0;
  Savedjobs({
    Key? key,
    this.model,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Column(
        children: [
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
            height: 1.h,
          ),
          Container(
            height: 5.h,
            width: 360.w,
            decoration: BoxDecoration(
                color: const Color(0xFFF4F4F5),
                border: Border.all(color: const Color(0xFFE5E7EB))),
            child: Center(
              child: Text(
                '12 Job Saved',
                style: TextStyle(
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w500,
                    color: Color(0xFF6B7280)),
              ),
            ),
          ),
          SizedBox(
            height: 1.h,
          ),
          Expanded(
            child: ListView.separated(
                separatorBuilder: (context, index) => const Divider(
                      height: 3,
                      thickness: 2,
                      endIndent: 25,
                      indent: 25,
                    ),
                itemCount: savedlist.length,
                itemBuilder: (context, index) {
                  return SavedJobCard(
                    savedmodel: savedlist[index],
                  );
                }),
          ),
          // StatefulBuilder(builder: (context, StateSetter setstate) {
          //   return BottomNavigationBar(
          //       showUnselectedLabels: true,
          //       selectedItemColor: const Color(0xFF3366FF),
          //       unselectedItemColor: const Color(0xFF9CA3AF),
          //       currentIndex: selectedindex,
          //       onTap: (index) {
          //         setstate(() {
          //           selectedindex = index;
          //         });
          //       },
          //       items: [
          //         BottomNavigationBarItem(
          //             label: 'home',
          //             icon: Image.asset('assets/images/home.png'),
          //             activeIcon: Image.asset('assets/images/home2.png')),
          //         BottomNavigationBarItem(
          //             label: 'messages',
          //             icon: Image.asset('assets/images/message.png'),
          //             activeIcon: Image.asset('assets/images/message2.png')),
          //         BottomNavigationBarItem(
          //             label: 'Applied',
          //             icon: Image.asset('assets/images/briefcase2.png'),
          //             activeIcon: Image.asset('assets/images/briefcase.png')),
          //         BottomNavigationBarItem(
          //             label: 'Saved',
          //             icon: Image.asset('assets/images/archive.png'),
          //             activeIcon: Image.asset('assets/images/archive2.png')),
          //         const BottomNavigationBarItem(
          //             label: 'Profile', icon: Icon(Icons.person))
          //       ]);
          // }),
        ],
      )),
    );
  }
}
