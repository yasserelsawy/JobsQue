import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:graduation_project/view/pages/loginandregister/Registerscreen.dart';
import 'package:graduation_project/view/pages/Onboarding/introduction3.dart';
import 'package:graduation_project/view/pages/Onboarding/introduction4.dart';
import 'package:sizer/sizer.dart';

class Secondpage extends StatelessWidget {
  const Secondpage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Row(
              children: [
                Image.asset('assets/images/logo.png'),
                Spacer(),
                TextButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const RegisterScreen()));
                    },
                    child: Text(
                      'skip',
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                          color: Color(0xFF6B7280)),
                    ))
              ],
            ),
            Image.asset(
              'assets/images/Background.png',
            ),
            const ListTile(
                title: Text(
                  'Find a job, and start building your career from now on',
                  style: TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.w500,
                      color: Color(0xFF111827)),
                ),
                subtitle: Text(
                  'Explore over 25,924 available job roles and upgrade your operator now.',
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                      color: Color(0xFF6B7280)),
                )),
            DotsIndicator(
              dotsCount: 3,
              position: 0,
              decorator: const DotsDecorator(
                color: Color(0xFFADC8FF), // Inactive
                activeColor: Color(0xFF3366FF),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            SizedBox(
              height: 48,
              width: 327,
              child: ElevatedButton(
                  onPressed: () {
                    Navigator.pushReplacement(context,
                        MaterialPageRoute(builder: (context) => Thirdpage()));
                  },
                  style: ElevatedButton.styleFrom(
                      primary: const Color(0xFF3366FF),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(25))),
                  child: const Text('Next',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ))),
            ),
            Padding(
                padding: EdgeInsets.only(top: 10),
                child: Image.asset('assets/images/blackdash.png'))
          ],
        ),
      ),
    );
  }
}
