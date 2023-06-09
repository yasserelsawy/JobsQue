// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import 'package:graduation_project/model/notificationmodel.dart';

class NotificationPage extends StatelessWidget {
  NotificationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(top: 10),
          child: Column(
            children: [
              Row(
                children: [
                  IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: const Icon(
                        Icons.arrow_back,
                        size: 25,
                      )),
                  SizedBox(
                    width: 25.w,
                  ),
                  Text(
                    'Notification',
                    style: TextStyle(
                        fontSize: 18.sp,
                        fontWeight: FontWeight.w500,
                        color: const Color(0xFF111827)),
                  )
                ],
              ),
              Container(
                  height: 5.h,
                  width: 360.w,
                  decoration: BoxDecoration(
                      color: const Color(0xFFF4F4F5),
                      border: Border.all(color: const Color(0xFFE5E7EB))),
                  child: Row(
                    children: [
                      SizedBox(
                        width: 5.w,
                      ),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          'New',
                          style: TextStyle(
                              fontSize: 12.sp,
                              fontWeight: FontWeight.w500,
                              color: Color(0xFF6B7280)),
                        ),
                      ),
                    ],
                  )),
              SizedBox(
                height: 40.h,
                width: 300.w,
                child: ListView.separated(
                    separatorBuilder: (context, index) => const Divider(
                          height: 2,
                          endIndent: 30,
                          indent: 30,
                          thickness: 1.5,
                        ),
                    itemCount: notificationList.length,
                    itemBuilder: (context, index) => ListTile(
                        leading: Image.asset('${notificationList[index].icon}'),
                        title: Text(
                          '${notificationList[index].title}',
                          style: TextStyle(
                              fontSize: 12.sp,
                              color: Color(0xFF111827),
                              fontWeight: FontWeight.w500),
                        ),
                        subtitle: Text('${notificationList[index].subtitle}'),
                        trailing: Text('${notificationList[index].time}'))),
              ),
              Container(
                  height: 5.h,
                  width: 360.w,
                  decoration: BoxDecoration(
                      color: const Color(0xFFF4F4F5),
                      border: Border.all(color: const Color(0xFFE5E7EB))),
                  child: Row(
                    children: [
                      SizedBox(
                        width: 5.w,
                      ),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          'Yesterday',
                          style: TextStyle(
                              fontSize: 12.sp,
                              fontWeight: FontWeight.w500,
                              color: Color(0xFF6B7280)),
                        ),
                      ),
                    ],
                  )),
              SizedBox(
                height: 2.h,
              ),
              Expanded(
                child: ListView.separated(
                    separatorBuilder: (context, index) => const Divider(
                          height: 3,
                          endIndent: 30,
                          indent: 30,
                          thickness: 1.5,
                        ),
                    itemCount: oldnotificationList.length,
                    itemBuilder: (context, index) => ListTile(
                        leading:
                            Image.asset('${oldnotificationList[index].icon}'),
                        title: Text(
                          '${oldnotificationList[index].title}',
                          style: TextStyle(
                              fontSize: 12.sp,
                              color: Color(0xFF111827),
                              fontWeight: FontWeight.w500),
                        ),
                        subtitle:
                            Text('${oldnotificationList[index].subtitle}'),
                        trailing: Text('${oldnotificationList[index].time}'))),
              ),
              Image.asset('assets/images/blackdash.png')
            ],
          ),
        ),
      ),
    );
  }
}

class notificationcard extends StatelessWidget {
  Notifications model;
  notificationcard({
    Key? key,
    required this.model,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
        leading: Image.asset('${model.icon}'),
        title: Text(
          '${model.title}',
          style: TextStyle(
              fontSize: 12.sp,
              color: Color(0xFF111827),
              fontWeight: FontWeight.w500),
        ),
        subtitle: Text('${model.subtitle}'),
        trailing: Text('${model.time}'));
  }
}
