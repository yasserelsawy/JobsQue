// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:graduation_project/view/pages/Profile/Education.dart';
import 'package:graduation_project/view/pages/Profile/Personaldetails.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:sizer/sizer.dart';

import '../../../model/completeprofile.dart';

class Completeprofile extends StatefulWidget {
  const Completeprofile({super.key});

  @override
  State<Completeprofile> createState() => _CompleteprofileState();
}

class _CompleteprofileState extends State<Completeprofile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        title: Text(
          'Complete Profile',
          style: TextStyle(
              fontSize: 17.sp,
              fontWeight: FontWeight.w500,
              color: const Color(0xFF111827)),
        ),
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(
              Icons.arrow_back,
              size: 25,
              color: Color(0xFF292D32),
            )),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: 2.h,
            ),
            CircularPercentIndicator(
              radius: 55.0,
              lineWidth: 10.0,
              percent: 0.5,
              circularStrokeCap: CircularStrokeCap.round,
              center: Text(
                "50%",
                style: TextStyle(
                    fontSize: 18.sp,
                    color: const Color(0xFF3366FF),
                    fontWeight: FontWeight.w500),
              ),
              progressColor: const Color(0xFF3366FF),
            ),
            SizedBox(
              height: 2.h,
            ),
            Text(
              '2/4 Completed',
              style: TextStyle(
                  fontSize: 14.sp,
                  color: const Color(0xFF3366FF),
                  fontWeight: FontWeight.w500),
            ),
            SizedBox(
              height: 1.h,
            ),
            Text(
              'Complete your profile before applying for a job',
              style: TextStyle(
                  fontSize: 12.sp,
                  color: const Color(0xFF6B7280),
                  fontWeight: FontWeight.w400),
            ),
            SizedBox(
              height: 4.h,
            ),
            Center(
              child: SizedBox(
                height: 60.h,
                width: 85.w,
                child: ListView.separated(
                  separatorBuilder: (context, index) => Divider(),
                  itemCount: completeprofileList.length,
                  itemBuilder: (context, index) => GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => PersonalDetails()),
                      );
                    },
                    onLongPress: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => EducationPage()));
                    },
                    child: CompleteProfileCard(
                        completeprofilemodel: completeprofileList[index]),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class CompleteProfileCard extends StatelessWidget {
  CompleteProfile completeprofilemodel;
  CompleteProfileCard({
    Key? key,
    required this.completeprofilemodel,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 11.h,
      width: 85.w,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: const Color(0xFFE5E7EB), width: 2)),
      child: Center(
        child: ListTile(
          leading: Image.asset('assets/images/tick.png'),
          title: Padding(
            padding: const EdgeInsets.only(bottom: 8),
            child: Text(completeprofilemodel.title,
                style: TextStyle(fontSize: 12.sp, fontWeight: FontWeight.w500)),
          ),
          subtitle: Text(completeprofilemodel.subtitle,
              style: TextStyle(fontSize: 10.sp, fontWeight: FontWeight.w400)),
          trailing: Icon(Icons.arrow_forward),
        ),
      ),
    );
  }
}
