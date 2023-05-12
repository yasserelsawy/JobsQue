import 'package:easy_stepper/easy_stepper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation_project/controller/cubit/mycubit_cubit.dart';
import 'package:sizer/sizer.dart';

class CustomStepper extends StatefulWidget {
  CustomStepper({
    Key? key,
  });

  @override
  State<CustomStepper> createState() => _CustomStepperState();
}

class _CustomStepperState extends State<CustomStepper> {
  // int currentStep = 0;
  @override
  Widget build(
    BuildContext context,
  ) {
    return BlocBuilder<MycubitCubit, MycubitState>(
      builder: (context, state) {
        var cubit = MycubitCubit.get(context);
        return EasyStepper(
            stepRadius: 6.w,
            activeStep: cubit.currentstep,
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
                  customStep: cubit.currentstep > 0
                      ? Icon(
                          Icons.done,
                          color: Colors.white,
                          size: 4.h,
                        )
                      : Text(
                          '1',
                          style: TextStyle(
                              color: Color(0xFF03366FF), fontSize: 13.sp),
                        ),
                  customTitle: Text(
                    'Biodata',
                    textAlign: TextAlign.center,
                    style:
                        TextStyle(fontSize: 11.sp, color: Color(0xFF03366FF)),
                  )),
              EasyStep(
                customStep: cubit.currentstep == 1
                    ? Text(
                        '2',
                        style: TextStyle(
                            color: Color(0xFF03366FF), fontSize: 13.sp),
                      )
                    : cubit.currentstep > 1
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
                      color: cubit.currentstep >= 1
                          ? Color(0xFF03366FF)
                          : Color(0xFF9CA3AF)),
                ),
              ),
              EasyStep(
                customStep: cubit.currentstep == 2
                    ? Text(
                        '3',
                        style: TextStyle(
                            color: Color(0xFF03366FF), fontSize: 13.sp),
                      )
                    : cubit.currentstep > 2
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
                      color: cubit.currentstep >= 2
                          ? Color(0xFF03366FF)
                          : Color(0xFF9CA3AF)),
                ),
              ),
            ],
            onStepReached: (index) {
              cubit.changeindex(index);
            });
      },
    );
  }
}
