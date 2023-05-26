import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation_project/controller/cubit/cubit/onboarding_cubit.dart';
import 'package:graduation_project/controller/cubit/mycubit_cubit.dart';

import 'package:graduation_project/view/pages/Onboarding/introduction2.dart';

import 'package:graduation_project/view/pages/loginandregister/Loginscreen.dart';
import 'package:sizer/sizer.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light);

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => MycubitCubit()..getAllJobs(),
        ),
        BlocProvider(
          create: (context) => OnboardingCubit()..onboarding(),
        ),
      ],
      child: Sizer(builder: (context, orientation, deviceType) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          home: BlocProvider.of<OnboardingCubit>(context).isOnboardingCompleted
              ? LoginScreen()
              : Secondpage(),
        );
      }),
    );
  }
}
