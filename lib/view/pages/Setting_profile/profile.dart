import 'package:flutter/material.dart';
import 'package:graduation_project/view/pages/Setting_profile/notification.dart';
import 'package:graduation_project/view/pages/Setting_profile/protfolio.dart';
import 'package:graduation_project/view/widgets/shapeothers.dart';

import 'package:sizer/sizer.dart';

import '../../../model/generalModel.dart';
import '../../../model/othersModel.dart';
import '../../widgets/assets.dart';
import '../../widgets/shapegeneral.dart';
import '../Homescreen/Homeview.dart';
import '../Messages/contactspage.dart';
import '../Profile/Personaldetails.dart';
import '../SavedjobsAndnotification/savedjobs.dart';
import '../jobsInfo/jobApply.dart';
import '../loginandregister/Loginscreen.dart';
import 'editeProfile.dart';
import 'language.dart';
import 'loginAndsecurity.dart';

class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  var selectedindex = 0;
  static List<Widget> screens = [
    Center(child: HomeView()),
    Center(
      child: Contactspage(),
    ),
    Center(
      child: JobApplication(),
    ),
    Center(
      child: Savedjobs(),
    ),
    SingleChildScrollView(
      child: Column(
        children: [
          Align(
            alignment: Alignment.topCenter,
            child: Stack(
              children: [
                Container(
                  height: 30.h,
                  width: 150.w,
                  decoration: const BoxDecoration(
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(30),
                          topRight: Radius.circular(30)),
                      color: Color(0xffD6E4FF)),
                  child: Padding(
                    padding: EdgeInsets.only(top: 50.sp, left: 10.sp),
                    child: Column(
                      children: [
                        Align(
                          alignment: AlignmentDirectional.topCenter,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              IconButton(
                                  onPressed: () {},
                                  icon: Image.asset(AppAssets.arrowleft)),
                              SizedBox(
                                width: 25.w,
                              ),
                              const Text(
                                "Profile",
                                style: TextStyle(
                                    fontWeight: FontWeight.w500,
                                    fontSize: 20,
                                    color: Color(0xff111827)),
                              ),
                              SizedBox(
                                width: 25.w,
                              ),
                              IconButton(
                                  onPressed: () {},
                                  icon: Image.asset(AppAssets.logout)),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(top: 130.sp),
                      child: Align(
                        alignment: AlignmentDirectional.topCenter,
                        child: Container(
                          width: 30.0.w,
                          height: 15.0.h,
                          decoration: BoxDecoration(
                            color: const Color(0xff7c94b6),
                            image: const DecorationImage(
                              image: AssetImage('assets/images/circle.png'),
                              fit: BoxFit.cover,
                            ),
                            borderRadius:
                                const BorderRadius.all(Radius.circular(150.0)),
                            border: Border.all(
                              color: Colors.white,
                              width: 1.0.w,
                            ),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 5.sp, left: 7.sp),
                      child: const Align(
                        alignment: Alignment.topCenter,
                        child: ListTile(
                          title: Text(
                            "Rafi Dian Axelingga",
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w500,
                              color: Color(0xff111827),
                            ),
                            textAlign: TextAlign.center,
                          ),
                          subtitle: Text(
                            "Senior UI/UX Designer",
                            style: TextStyle(
                                fontWeight: FontWeight.w400,
                                fontSize: 14,
                                color: Color(0xff6B7280)),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 25.sp, right: 25.sp),
                      child: Container(
                          width: 100.w,
                          height: 10.h,
                          decoration: const BoxDecoration(
                            color: Color(0xffE5E7EB),
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                          ),
                          child: ListView.separated(
                              scrollDirection: Axis.horizontal,
                              physics: const NeverScrollableScrollPhysics(),
                              itemBuilder: (context, index) {
                                return SizedBox(
                                  height: 10.h,
                                  width: 22.w,
                                  child: Padding(
                                    padding: EdgeInsets.only(top: 2.h),
                                    child: Column(
                                      children: [
                                        const Text(
                                          "Applied",
                                          style: TextStyle(
                                              fontSize: 14,
                                              fontWeight: FontWeight.w500,
                                              color: Color(0xff6B7280)),
                                          textAlign: TextAlign.center,
                                        ),
                                        SizedBox(
                                          height: 2.h,
                                        ),
                                        const Text(
                                          "46",
                                          style: TextStyle(
                                              fontWeight: FontWeight.w500,
                                              fontSize: 20,
                                              color: Color(0xff111827)),
                                          textAlign: TextAlign.center,
                                        ),
                                      ],
                                    ),
                                  ),
                                );
                              },
                              separatorBuilder: (context, index) => Padding(
                                    padding: EdgeInsets.only(
                                        left: 20.sp, right: 0.w),
                                    child: Image.asset(AppAssets.line),
                                  ),
                              itemCount: 3)),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                          top: 10.sp, left: 30.sp, right: 25.sp),
                      child: Align(
                          alignment: Alignment.topLeft,
                          child: Row(
                            children: [
                              const Text(
                                "About",
                                style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500,
                                    color: Color(0xff6B7280)),
                              ),
                              SizedBox(
                                width: 155.sp,
                              ),
                              TextButton(
                                onPressed: () {
                                  Navigator.pushReplacement(
                                      BuildContext as BuildContext,
                                      MaterialPageRoute(
                                        builder: (context) => Editeprofile(),
                                      ));
                                },
                                child: const Text(
                                  "Edit",
                                  style: TextStyle(
                                      fontWeight: FontWeight.w500,
                                      fontSize: 14,
                                      color: Color(0xff3366FF)),
                                ),
                              )
                            ],
                          )),
                    ),
                    SizedBox(
                      height: 30.sp,
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 30.sp, right: 25.sp),
                      child: const Align(
                        alignment: Alignment.topLeft,
                        child: Text(
                          "I'm Rafif Dian Axelingga, I’m UI/UX Designer, I have experience designing UI Design for approximately 1 year. I am currently joining the Vektora studio team based in Surakarta, Indonesia.I am a person who has a high spirit and likes to work to achieve what I dream of.",
                          style: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 14,
                            color: Color(0xff6B7280),
                          ),
                          maxLines: 6,
                        ),
                      ),
                    ),
                    Padding(
                        padding: EdgeInsets.only(top: 30.sp),
                        child: Container(
                            height: 5.h,
                            width: 360.w,
                            decoration: BoxDecoration(
                                color: const Color(0xFFF4F4F5),
                                border:
                                    Border.all(color: const Color(0xFFE5E7EB))),
                            child: Row(
                              children: [
                                SizedBox(
                                  width: 5.w,
                                ),
                                Align(
                                  alignment: Alignment.centerLeft,
                                  child: Text(
                                    'General',
                                    style: TextStyle(
                                        fontSize: 12.sp,
                                        fontWeight: FontWeight.w500,
                                        color: Color(0xFF6B7280)),
                                  ),
                                ),
                              ],
                            ))),
                    SizedBox(
                      height: 62.h,
                      width: 80.w,
                      child: ListView.separated(
                          physics: const NeverScrollableScrollPhysics(),
                          itemBuilder: (context, index) {
                            return InkWell(
                                onTap: () {
                                  if (index == 0) {
                                    Navigator.pushReplacement(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) =>
                                              PersonalDetails(),
                                        ));
                                  } else if (index == 1) {
                                    Navigator.pushReplacement(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) => Protfolio(),
                                        ));
                                  } else if (index == 2) {
                                    Navigator.pushReplacement(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) => Language(),
                                        ));
                                  } else if (index == 3) {
                                    Navigator.pushReplacement(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) =>
                                              Notifications1(),
                                        ));
                                  } else if (index == 4) {
                                    Navigator.pushReplacement(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) =>
                                              LoginAndSecurity(),
                                        ));
                                  }
                                },
                                child: Shapegeneral(
                                    generalModel: GeneralModel.data[index]));
                          },
                          separatorBuilder: (context, index) => const Divider(),
                          itemCount: GeneralModel.data.length),
                    ),
                    Padding(
                        padding: EdgeInsets.only(top: 10.sp),
                        child: Container(
                            height: 5.h,
                            width: 360.w,
                            decoration: BoxDecoration(
                                color: const Color(0xFFF4F4F5),
                                border:
                                    Border.all(color: const Color(0xFFE5E7EB))),
                            child: Row(
                              children: [
                                SizedBox(
                                  width: 5.w,
                                ),
                                Align(
                                  alignment: Alignment.centerLeft,
                                  child: Text(
                                    'Other',
                                    style: TextStyle(
                                        fontSize: 12.sp,
                                        fontWeight: FontWeight.w500,
                                        color: Color(0xFF6B7280)),
                                  ),
                                ),
                              ],
                            ))),
                    SizedBox(
                      height: 62.h,
                      width: 80.w,
                      child: ListView.separated(
                          physics: const NeverScrollableScrollPhysics(),
                          itemBuilder: (context, index) {
                            return InkWell(
                                onTap: () {
                                  if (index == 0) {
                                    Navigator.pushReplacement(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) =>
                                              const Editeprofile(),
                                        ));
                                  } else if (index == 1) {
                                    Navigator.pushReplacement(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) => LoginScreen(),
                                        ));
                                  } else if (index == 2) {
                                    Navigator.pushReplacement(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) => LoginScreen(),
                                        ));
                                  } else if (index == 3) {
                                    Navigator.pushReplacement(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) => LoginScreen(),
                                        ));
                                  } else if (index == 4) {
                                    Navigator.pushReplacement(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) => LoginScreen(),
                                        ));
                                  }
                                },
                                child: Shapeothers(
                                  othersModel: OthersModel.data[index],
                                ));
                          },
                          separatorBuilder: (context, index) => const Divider(),
                          itemCount: OthersModel.data.length),
                    ),
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    )
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
          showUnselectedLabels: true,
          type: BottomNavigationBarType.fixed,
          selectedItemColor: const Color(0xFF3366FF),
          unselectedItemColor: const Color(0xFF9CA3AF),
          currentIndex: selectedindex,
          onTap: (index) {
            setState(() {
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
          ]),
      backgroundColor: const Color(0xffFAFAFA),
      body: screens[selectedindex],
    );
  }
}
