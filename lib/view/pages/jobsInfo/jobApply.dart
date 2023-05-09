import 'package:easy_stepper/easy_stepper.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../widgets/custom-stepper.dart';
import 'jobApplycontent.dart';

class JobApplication extends StatefulWidget {
  const JobApplication({Key? key}) : super(key: key);

  @override
  State<JobApplication> createState() => _JobApplicationState();
}

class _JobApplicationState extends State<JobApplication> {
  int currentStep = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
          toolbarHeight: 5.h,
          backgroundColor: Colors.white,
          elevation: 0,
          title: Text(
            'Apply Job',
            style: TextStyle(
                fontSize: 16.sp,
                color: const Color(0xFF111827),
                fontWeight: FontWeight.bold),
          ),
          centerTitle: true),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              CustomStepper(),
              SizedBox(height: 2.h),
              currentStep == 0
                  ? Biodata()
                  : currentStep == 1
                      ? TypeOfWork()
                      : currentStep == 2
                          ? UploadPortofolio()
                          : Text('Done')
            ],
          ),
        ),
      ),
      floatingActionButton: Container(
        color: Colors.transparent,
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(25),
              ),
              minimumSize: Size(80.w, 6.h),
              backgroundColor: const Color(0xFF3366FF)),
          onPressed: () {
            setState(() {
              currentStep++;
            });
          },
          child: currentStep == 0
              ? Text(
                  'Next',
                  style: TextStyle(fontSize: 10.sp),
                )
              : currentStep == 1
                  ? Text(
                      'Next',
                      style: TextStyle(fontSize: 10.sp),
                    )
                  : currentStep == 2
                      ? Text(
                          'Submit',
                          style: TextStyle(fontSize: 10.sp),
                        )
                      : Text(
                          'Submit',
                          style: TextStyle(fontSize: 10.sp),
                        ),
        ),
      ),
      floatingActionButtonLocation:
          FloatingActionButtonLocation.miniCenterFloat,
    );
  }
}
