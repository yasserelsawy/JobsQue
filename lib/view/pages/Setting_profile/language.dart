import 'package:flutter/material.dart';
import 'package:graduation_project/view/pages/Setting_profile/profile.dart';
import 'package:sizer/sizer.dart';

import '../../../model/langugeModel.dart';
import '../../widgets/LangugeWidget.dart';
import '../../widgets/assets.dart';

class Language extends StatelessWidget {
  const Language({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.only(top: 10.sp),
            child: Row(
              children: [
                IconButton(
                    onPressed: () {
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => Profile(),
                          ));
                    },
                    icon: const Icon(Icons.arrow_back)),
                SizedBox(
                  width: 25.w,
                ),
                const Text(
                  "Language",
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                      color: Color(0xff111827)),
                )
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 20.sp),
            child: SizedBox(
              height: 80.h,
              width: 80.w,
              child: ListView.separated(
                  itemBuilder: (context, index) {
                    return LangugeWidget(
                      languge: Languge.lang[index],
                    );
                  },
                  separatorBuilder: (context, index) => const Divider(),
                  itemCount: Languge.lang.length),
            ),
          ),
          Image.asset(AppAssets.homeIndicator),
        ],
      ),
    ));
  }
}
