import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation_project/controller/cubit/mycubit_cubit.dart';
import 'package:graduation_project/model/JobsModel.dart';
import 'package:graduation_project/view/widgets/custom-stepper.dart';
import 'package:sizer/sizer.dart';

class RejectedContent extends StatelessWidget {
  const RejectedContent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<MycubitCubit, MycubitState>(
      listener: (context, state) {},
      builder: (context, state) {
        return Scaffold(
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Center(
                child: Image.asset(
                  'assets/images/Data Ilustration.png',
                  height: 35.h,
                  width: 50.w,
                ),
              ),
              Text(
                'No applications were rejected',
                style: TextStyle(
                    fontSize: 16.sp,
                    color: Color(0xff111827),
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 1.h),
              Padding(
                padding: const EdgeInsets.only(left: 50.0, right: 30.0),
                child: Text(
                  'If there is an application that is rejected by the company it will appear here',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 10.sp,
                    color: Color(0xff6B7280),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

class ActiveContent extends StatelessWidget {
  const ActiveContent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<MycubitCubit, MycubitState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        final cubit = BlocProvider.of<MycubitCubit>(context);
        if (cubit.AppliedJobs.isNotEmpty) {
          return Scaffold(
            body: Column(
              children: [
                Container(
                  color: Color(0xffE5E7EB),
                  height: 5.h,
                  width: 100.w,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 20.0),
                    child: Row(
                      children: [
                        Text(
                          '3 Jobs',
                          style: TextStyle(
                              color: const Color(0xff6B7280), fontSize: 9.sp),
                        )
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 3.h,
                ),
                Expanded(
                  child: ListView.separated(
                    separatorBuilder: (context, index) => Divider(
                      height: 5.h,
                      thickness: 1.5,
                      color: Color(0xFFE5E7EB),
                    ),
                    itemBuilder: (context, index) => ActiveItemList(
                        jobsmodel: cubit.AppliedJobs[index], index: index),
                    itemCount: cubit.AppliedJobs.length,
                  ),
                )
              ],
            ),
          );
        } else {
          return Scaffold(
            body: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Center(
                  child: Image.asset(
                    'assets/images/Data Ilustration.png',
                    height: 35.h,
                    width: 50.w,
                  ),
                ),
                Text(
                  'No applications were registered',
                  style: TextStyle(
                      fontSize: 16.sp,
                      color: Color(0xff111827),
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 1.h),
                Padding(
                  padding: const EdgeInsets.only(left: 50.0, right: 30.0),
                  child: Text(
                    'If there is an application that is rejected by the company it will appear here',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 10.sp,
                      color: Color(0xff6B7280),
                    ),
                  ),
                ),
              ],
            ),
          );
        }
      },
    );
  }
}

class ActiveItemList extends StatelessWidget {
  int index;
  JobsModel jobsmodel;

  ActiveItemList({super.key, required this.jobsmodel, required this.index});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<MycubitCubit, MycubitState>(
      listener: (context, state) {},
      builder: (context, state) {
        List<JobsModel> savedjobscubit = [];
        final cubit = BlocProvider.of<MycubitCubit>(context);
        return Container(
          child: Column(
            children: [
              SizedBox(
                height: 2.h,
              ),
              Row(
                children: [
                  Image.asset('assets/images/Amit.png'),
                  SizedBox(
                    width: 5.w,
                  ),
                  Column(
                    children: [
                      Text(
                        '${jobsmodel.name}',
                        style: TextStyle(
                            color: Color(0xff111827),
                            fontSize: 13.sp,
                            fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: 1.h,
                      ),
                      Text(
                        '${jobsmodel.jobSkill}',
                        style:
                            TextStyle(color: Color(0xff374151), fontSize: 9.sp),
                      )
                    ],
                  ),
                  Spacer(),
                  IconButton(
                      onPressed: () {
                        cubit.savejob(jobsmodel, savedjobscubit);
                      },
                      icon: Image.asset(
                        'assets/images/archive-minus-white.png',
                        height: 5.h,
                        width: 10.w,
                      ))
                ],
              ),
              SizedBox(
                height: 3.h,
              ),
              Row(
                children: [
                  Container(
                    height: 5.h,
                    width: 15.w,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(25),
                      color: const Color(0xFFD6E4FF),
                    ),
                    child: Center(
                        child: Text(
                      'Fulltime',
                      style: TextStyle(
                          fontSize: 10.sp, color: const Color(0xFF3366FF)),
                    )),
                  ),
                  SizedBox(
                    width: 5.w,
                  ),
                  Container(
                    height: 5.h,
                    width: 15.w,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(25),
                      color: const Color(0xFFD6E4FF),
                    ),
                    child: Center(
                        child: Text(
                      'Remote',
                      style: TextStyle(
                          fontSize: 10.sp, color: const Color(0xFF3366FF)),
                    )),
                  ),
                  SizedBox(
                    width: 30.w,
                  ),
                  Text(
                    'Posted 2 days ago',
                    style:
                        TextStyle(fontSize: 9.sp, color: (Color(0xff374151))),
                  ),
                ],
              ),
              SizedBox(
                height: 3.h,
              ),
              Container(
                height: 15.h,
                width: 100.w,
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey),
                    borderRadius: BorderRadius.circular(15)),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: CustomStepper(),
                ),
              ),
              SizedBox(
                height: 1.h,
              ),
            ],
          ),
        );
      },
    );
  }
}
