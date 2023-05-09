import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation_project/controller/cubit/mycubit_cubit.dart';
import 'package:graduation_project/controller/database/remote.dart';
import 'package:graduation_project/view/pages/Messages/chat.dart';
import 'package:graduation_project/view/pages/Messages/contactspage.dart';
import 'package:graduation_project/view/pages/Onboarding/introduction2.dart';
import 'package:graduation_project/view/pages/Profile/Education.dart';
import 'package:graduation_project/view/pages/Profile/Experience.dart';
import 'package:graduation_project/view/pages/Profile/Personaldetails.dart';
import 'package:graduation_project/view/pages/Profile/completeprofile.dart';
import 'package:graduation_project/view/pages/SavedjobsAndnotification/savedjobs.dart';
import 'package:graduation_project/view/pages/Setting_profile/profile.dart';
import 'package:graduation_project/view/pages/jobsInfo/jobApply.dart';
import 'package:graduation_project/view/pages/loginandregister/Loginscreen.dart';
import 'package:graduation_project/view/pages/loginandregister/Registerscreen.dart';
import 'package:sizer/sizer.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light);

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => MycubitCubit()..getAllJobs(),
      child: Sizer(builder: (context, orientation, deviceType) {
        return MaterialApp(
          // initialRoute: ,
          // useInheritedMediaQuery: true,
          // locale: DevicePreview.locale(context),
          // builder: DevicePreview.appBuilder,
          // theme: ThemeData().copyWith(),
          debugShowCheckedModeBanner: false,
          home: LoginScreen(),
        );
      }),
    );
  }
}
