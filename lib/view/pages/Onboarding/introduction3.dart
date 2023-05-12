import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:graduation_project/view/pages/loginandregister/Registerscreen.dart';
import 'package:graduation_project/view/pages/Onboarding/introduction3.dart';
import 'package:graduation_project/view/pages/Onboarding/introduction4.dart';

class Thirdpage extends StatelessWidget {
  const Thirdpage({super.key});

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
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const RegisterScreen()));
                    },
                    child: const Padding(
                      padding: EdgeInsets.only(left: 220),
                      child: Text(
                        'skip',
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                            color: Color(0xFF6B7280)),
                      ),
                    ))
              ],
            ),
            Image.asset(
              'assets/images/background2.png',
            ),
            const ListTile(
                title: Text(
                  'Hundreds of jobs are waiting for you to join together',
                  style: TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.w500,
                      color: Color(0xFF111827)),
                ),
                subtitle: Text(
                  'Hundreds of jobs are waiting for you to join togethers',
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                      color: Color(0xFF6B7280)),
                )),
            const SizedBox(
              height: 10,
            ),
            DotsIndicator(
              dotsCount: 3,
              position: 1,
              decorator: const DotsDecorator(
                color: Color(0xFFADC8FF), // Inactive
                activeColor: Color(0xFF3366FF),
              ),
            ),
            SizedBox(
              height: 48,
              width: 327,
              child: ElevatedButton(
                  onPressed: () {
                    Navigator.pushReplacement(context,
                        MaterialPageRoute(builder: (context) => Forthpage()));
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
