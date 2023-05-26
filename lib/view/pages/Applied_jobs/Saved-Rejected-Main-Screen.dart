import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import 'Saved-Rejected-Content.dart';

class SavedScreen extends StatelessWidget {
  const SavedScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Text(
          'Applied Job',
          style: TextStyle(fontSize: 16.sp, color: Colors.black),
        ),
        centerTitle: true,
      ),
      // Appbar --------------------------------------------------
      body: DefaultTabController(
        length: 2,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              SizedBox(
                height: 1.h,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 8.0, right: 8),
                child: Container(
                  decoration: BoxDecoration(
                      color: Color(0xFFF4F4F5),
                      borderRadius: BorderRadius.circular(20)),
                  height: 7.h,
                  width: 90.w,
                  child: TabBar(
                    labelColor: Colors.white,
                    unselectedLabelColor: Color(0xFF6B7280),
                    indicator: BoxDecoration(
                      color: Color(0xFF02337A),
                      borderRadius: BorderRadius.circular(25),
                    ),
                    tabs: [
                      SizedBox(
                        height: 5.h,
                        child: Center(
                            child: Text(
                          'Active',
                          style: TextStyle(
                            fontSize: 10.sp,
                          ),
                        )),
                      ),
                      SizedBox(
                        height: 5.h,
                        child: Center(
                            child: Text(
                          'Rejected',
                          style: TextStyle(
                            fontSize: 10.sp,
                          ),
                        )),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 2.h,
              ),
              // el Tab Bar -----------------------------------------------------
              const Expanded(
                  child: TabBarView(
                children: [ActiveContent(), RejectedContent()],
              )),
            ],
          ),
        ),
      ),
    );
  }
}
