import 'package:easy_stepper/easy_stepper.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class CustomStepper extends StatefulWidget {
  CustomStepper({
    Key? key,
  });

  @override
  State<CustomStepper> createState() => _CustomStepperState();
}

class _CustomStepperState extends State<CustomStepper> {
  int currentStep = 0;
  @override
  Widget build(
    BuildContext context,
  ) {
    return EasyStepper(
        stepRadius: 6.w,
        activeStep: currentStep,
        showLoadingAnimation: false,
        enableStepTapping: true,
        steppingEnabled: true,
        lineLength: 12.w,
        activeLineColor: Colors.blue,
        defaultLineColor: const Color(0xFFD1D5DB),
        defaultStepBorderType: BorderType.normal,
        internalPadding: 10.w,
        finishedStepBorderColor: Colors.transparent,
        finishedLineColor: const Color(0xFF03366FF),
        finishedStepBackgroundColor: const Color(0xFF03366FF),
        finishedStepIconColor: Colors.white,
        finishedStepTextColor: const Color(0xFF03366FF),
        activeStepBorderColor: const Color(0xFF03366FF),
        activeStepTextColor: const Color(0xFF03366FF),
        activeStepBackgroundColor: Colors.transparent,
        borderThickness: 3,
        unreachedStepTextColor: const Color(0xFF9CA3AF),
        steps: [
          EasyStep(
              customStep: currentStep > 0
                  ? Icon(
                      Icons.done,
                      color: Colors.white,
                      size: 4.h,
                    )
                  : Text(
                      '1',
                      style:
                          TextStyle(color: Color(0xFF03366FF), fontSize: 13.sp),
                    ),
              customTitle: Text(
                'Biodata',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 11.sp, color: Color(0xFF03366FF)),
              )),
          EasyStep(
            customStep: currentStep == 1
                ? Text(
                    '2',
                    style:
                        TextStyle(color: Color(0xFF03366FF), fontSize: 13.sp),
                  )
                : currentStep > 1
                    ? Icon(
                        Icons.done,
                        color: Colors.white,
                        size: 4.h,
                      )
                    : Text(
                        '2',
                        style: TextStyle(
                            color: Color(0xFF9CA3AF), fontSize: 13.sp),
                      ),
            customTitle: Text(
              'Type Of Work',
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: 11.sp,
                  color: currentStep >= 1
                      ? Color(0xFF03366FF)
                      : Color(0xFF9CA3AF)),
            ),
          ),
          EasyStep(
            customStep: currentStep == 2
                ? Text(
                    '3',
                    style:
                        TextStyle(color: Color(0xFF03366FF), fontSize: 13.sp),
                  )
                : currentStep > 2
                    ? Icon(
                        Icons.done,
                        color: Colors.white,
                        size: 4.h,
                      )
                    : Text(
                        '3',
                        style: TextStyle(
                            color: Color(0xFF9CA3AF), fontSize: 13.sp),
                      ),
            customTitle: Text(
              'Upload Portofolio',
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: 11.sp,
                  color: currentStep >= 2
                      ? Color(0xFF03366FF)
                      : Color(0xFF9CA3AF)),
            ),
          ),
        ],
        onStepReached: (index) {
          setState(() => currentStep = index);
        });
  }
}
