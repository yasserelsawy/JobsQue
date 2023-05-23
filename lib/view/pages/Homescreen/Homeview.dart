import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:graduation_project/model/JobsModel.dart';
import 'package:sizer/sizer.dart';
import '../../../controller/cubit/mycubit_cubit.dart';
import '../../../controller/database/remote.dart';
import '../SavedjobsAndnotification/notificationpage.dart';
import '../jobsInfo/jobsinfo.dart';
import 'Newsearch.dart';
import 'extras.dart';

class HomeView extends StatelessWidget {
  // HomeScreen({Key? key}) : super(key: key);
  var list = [];
  Api api = Api();
  final cubit = MycubitCubit();
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<MycubitCubit, MycubitState>(
        listener: (context, state) {},
        builder: (context, state) {
          var cubit = MycubitCubit.get(context);

          list = cubit.jobsList;
          return FutureBuilder(
            future: cubit.getName(),
            builder: (context, snapshot) {
              if (!snapshot.hasData) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              } else {
                return Scaffold(
                  body: SafeArea(
                    child: Padding(
                      padding: EdgeInsets.all(24.0),
                      child: SingleChildScrollView(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            /// hi and notification
                            Row(
                              //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Padding(
                                  padding: EdgeInsets.only(top: 2),
                                  child: SingleChildScrollView(
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          'Hi. ${snapshot.data} 👋',
                                          style: TextStyle(
                                            fontSize: 19.sp,
                                          ),
                                          textAlign: TextAlign.start,
                                        ),
                                        SizedBox(
                                          height: 8,
                                        ),
                                        Text(
                                          'Create a better future for yourself here',
                                          style: TextStyle(
                                              fontSize: 11.sp,
                                              color: Colors.grey),
                                        ),
                                        SizedBox(
                                          height: 30,
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                Spacer(),
                                Container(
                                  width: 60,
                                  height: 60,
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                      color: Colors.grey,
                                    ),
                                    borderRadius: BorderRadius.circular(30),
                                    //color: Colors.redAccent
                                  ),
                                  child: IconButton(
                                      onPressed: () {
                                        navigateTo(context, NotificationPage());
                                      },
                                      icon: Icon(
                                          Icons.notifications_none_outlined)),
                                ),
                                //image: AssetImage('assets/images/ring.png')
                              ],
                            ),

                            /// search bar
                            InkWell(
                              onTap: () {
                                navigateTo(context, SearchPage());
                              },
                              child: Container(
                                // margin:  EdgeInsets.fromLTRB(0, 0, 0, 0),
                                padding: EdgeInsets.fromLTRB(12, 14, 26, 10),
                                width: double.infinity,
                                height: 52,
                                decoration: BoxDecoration(
                                  border: Border.all(
                                    color: Colors.grey,
                                  ),
                                  borderRadius: BorderRadius.circular(100),
                                ),
                                child: Row(
                                  children: const [
                                    Image(
                                      image: AssetImage(
                                          'assets/images/search.png'),
                                    ),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    Expanded(
                                      child: Text('Search...'),
                                    ),
                                  ],
                                ),
                              ),
                            ),

                            /// Suggested Job
                            Row(
                              children: [
                                Text(
                                  'Suggested Job',
                                  style: TextStyle(
                                    fontSize: 14.sp,
                                  ),
                                ),
                                const Spacer(),
                                TextButton(
                                  onPressed: () {},
                                  child: Text(
                                    'View all',
                                    style: TextStyle(
                                      fontSize: 11.sp,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 20,
                            ),

                            /// card
                            SizedBox(
                              width: double.infinity,
                              height: 200,
                              child: ConditionalBuilder(
                                  condition: list.isNotEmpty,
                                  builder: (context) => ListView.separated(
                                      scrollDirection: Axis.horizontal,
                                      // padding: EdgeInsets.only(left: 16,right: 6),
                                      physics: BouncingScrollPhysics(),
                                      separatorBuilder: (context, index) =>
                                          const SizedBox(
                                            width: 16,
                                          ),
                                      itemCount: list.length,
                                      itemBuilder: (context, index) => InkWell(
                                            onTap: () {
                                              navigateTo(context,
                                                  JobDetail(jobsindex: index));
                                            },
                                            child: customSuggestedJobsList(
                                                list[index], context),
                                          )

                                      //list[index]
                                      ),
                                  fallback: (context) => const Center(
                                      child: CircularProgressIndicator())),
                            ),

                            SizedBox(
                              height: 20,
                            ),

                            /// recent job & view all
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Recent Job',
                                  style: TextStyle(
                                    fontSize: 14.sp,
                                  ),
                                ),
                                TextButton(
                                  onPressed: () {},
                                  child: Text(
                                    'View all',
                                    style: TextStyle(
                                      fontSize: 11.sp,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 20,
                            ),

                            SizedBox(
                              height: 300,
                              child: ConditionalBuilder(
                                  condition: list.isNotEmpty,
                                  builder: (context) => ListView.separated(
                                        physics: BouncingScrollPhysics(),
                                        separatorBuilder: (context, index) =>
                                            defaultSeparatorContainer(),
                                        itemCount: list.length,
                                        itemBuilder: (context, index) =>
                                            InkWell(
                                          onTap: () {
                                            navigateTo(context,
                                                JobDetail(jobsindex: index));
                                          },
                                          child: customJobsList(
                                              list[index], context),
                                        ),
                                      ),
                                  fallback: (context) => const Center(
                                      child: CircularProgressIndicator())),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                );
              }
            },
          );
        });
  }
}

Widget customSuggestedJobsList(list, BuildContext context) {
  return Container(
    height: 183,
    width: 300,
    decoration: BoxDecoration(
      border: Border.all(
        color: Colors.grey,
      ),
      borderRadius: BorderRadius.circular(15),
      color: cardPrimaryColor,
    ),
    child: Column(
      children: [
        Flexible(
          flex: 1,
          child: ListTile(
            leading: const Image(
              image: AssetImage('assets/images/Amit.png'),
            ),
            title: Text(
              '${list.name}',
              style: TextStyle(fontSize: 13.sp, color: Colors.white),
              textAlign: TextAlign.start,
            ),
            subtitle: Text(
              '${list.compName}',
              style: TextStyle(fontSize: 9.sp, color: Colors.grey),
              textAlign: TextAlign.start,
            ),
            trailing: const Image(
              image: AssetImage('assets/images/save.png'),
            ),
          ),
        ),
        Flexible(
          flex: 1,
          child: Center(
            child: Padding(
              padding: const EdgeInsets.only(right: 8, left: 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    width: 87,
                    height: 30,
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.grey,
                      ),
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.white.withOpacity(0.15),
                    ),
                    child: Center(
                      child: Text(
                        '${list.jobTimeType}',
                        style: TextStyle(
                            fontSize: 9.sp, color: const Color(0xFFFFFFFF)),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 6.5,
                  ),
                  Container(
                    width: 87,
                    height: 30,
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.grey,
                      ),
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.white.withOpacity(0.15),
                    ),
                    child: Center(
                      child: Text(
                        'Onsite',
                        style:
                            TextStyle(fontSize: 9.sp, color: Color(0xFFFFFFFF)),
                        textAlign: TextAlign.start,
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 6.5,
                  ),
                  Container(
                    width: 87,
                    height: 30,
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.grey,
                      ),
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.white.withOpacity(0.15),
                    ),
                    child: Center(
                      child: Text(
                        '${list.jobLevel}',
                        style:
                            TextStyle(fontSize: 9.sp, color: Color(0xFFFFFFFF)),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        Flexible(
          flex: 1,
          child: Container(
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Row(
                children: [
                  Text(
                    '\$${list.salary}/Month',
                    style: TextStyle(fontSize: 14.sp, color: Colors.white),
                    textAlign: TextAlign.start,
                  ),
                  Spacer(),
                  // apply job
                  InkWell(
                    onTap: () {},
                    child: Container(
                      width: 96,
                      height: 32,
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.grey,
                        ),
                        borderRadius: BorderRadius.circular(20),
                        color: const Color(0xFF3366FF),
                      ),
                      child: Center(
                        child: GestureDetector(
                          onTap: () {},
                          child: Text(
                            'Apply now',
                            style:
                                TextStyle(fontSize: 9.sp, color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    ),
  );
}

Widget customJobsList(list, BuildContext context) {
  var cubit = MycubitCubit.get(context);
  List<JobsModel> save = [];

  return BlocConsumer<MycubitCubit, MycubitState>(
    listener: (context, state) {},
    builder: (context, state) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          ListTile(
              leading: const Image(
                image: AssetImage('assets/images/Amit.png'),
              ),
              title: Text(
                '${list.name}',
                style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.bold),
              ),
              subtitle: Text(
                '${list.compName}',
                style: TextStyle(
                  fontSize: 9.sp,
                ),
                textAlign: TextAlign.start,
              ),
              trailing: IconButton(
                  onPressed: () {
                    cubit.savejob(
                      list,
                      save,
                    );
                  },
                  icon: Image.asset('assets/images/archive2.png'))

              //const Image(
              //   image: AssetImage('assets/images/save3.png'),
              // ),
              ),
          SizedBox(
            height: 12,
          ),
          Row(
            children: [
              Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: 70,
                      height: 30,
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.grey,
                        ),
                        borderRadius: BorderRadius.circular(20),
                        color: const Color(0xFFD6E4FF),
                      ),
                      child: Center(
                        child: Text(
                          '${list.jobTimeType}',
                          style: TextStyle(
                            fontSize: 9.sp,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 6.5,
                    ),
                    Container(
                      width: 70,
                      height: 30,
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.grey,
                        ),
                        borderRadius: BorderRadius.circular(20),
                        color: const Color(0xFFD6E4FF),
                      ),
                      child: Center(
                        child: Text(
                          'Remote',
                          style: TextStyle(
                            fontSize: 9.sp,
                          ),
                          textAlign: TextAlign.start,
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 6.5,
                    ),
                    Container(
                      width: 70,
                      height: 30,
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.grey,
                        ),
                        borderRadius: BorderRadius.circular(20),
                        color: const Color(0xFFD6E4FF),
                      ),
                      child: Center(
                        child: Text(
                          '${list.jobLevel}',
                          style: TextStyle(
                            fontSize: 9.sp,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Spacer(),
              Text(
                '\$${list.salary}/Month',
                style: TextStyle(fontSize: 10.sp),
              ),
            ],
          ),
          SizedBox(
            height: 2.h,
          )
        ],
      );
    },
  );
}
