import 'package:flutter/material.dart';

import 'introduction2.dart';

class Introduction extends StatelessWidget {
  const Introduction({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 20),
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Image.asset('assets/images/blur.png'),
                  InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Secondpage()));
                      },
                      child: Image.asset('assets/images/logo2.png'))
                ],
              ),
            ),
            Image.asset('assets/images/blackdash.png')
          ],
        ),
      ),
    );
  }
}
