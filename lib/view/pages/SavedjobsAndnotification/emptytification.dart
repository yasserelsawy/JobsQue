import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class EmptyNotification extends StatefulWidget {
  const EmptyNotification({super.key});

  @override
  State<EmptyNotification> createState() => _EmptyNotificationState();
}

int selectedindex = 0;

class _EmptyNotificationState extends State<EmptyNotification> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
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
            SizedBox(
              height: 25.h,
            ),
            Image.asset('assets/images/midescreen2.png'),
            SizedBox(
              height: 4.h,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 28),
              child: ListTile(
                title: Text(
                  'No new notifications yet',
                  style: TextStyle(
                      fontSize: 19.sp,
                      fontWeight: FontWeight.w500,
                      color: Color(0xFF111827)),
                ),
                subtitle: Text(
                  'You will receive a notification if there is something on your account',
                  style: TextStyle(
                      fontSize: 13.sp,
                      fontWeight: FontWeight.w400,
                      color: Color(0xFF6B7280)),
                ),
              ),
            )
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
          showUnselectedLabels: true,
          selectedItemColor: const Color(0xFF3366FF),
          unselectedItemColor: const Color(0xFF9CA3AF),
          currentIndex: selectedindex,
          onTap: (index) {
            setState(() {
              selectedindex = index;
            });
          },
          items: [
            BottomNavigationBarItem(
                label: 'home',
                icon: Image.asset('assets/images/home.png'),
                activeIcon: Image.asset('assets/images/home2.png')),
            BottomNavigationBarItem(
                label: 'messages',
                icon: Image.asset('assets/images/message.png'),
                activeIcon: Image.asset('assets/images/message2.png')),
            BottomNavigationBarItem(
                label: 'Applied',
                icon: Image.asset('assets/images/briefcase2.png'),
                activeIcon: Image.asset('assets/images/briefcase.png')),
            BottomNavigationBarItem(
                label: 'Saved',
                icon: Image.asset('assets/images/archive.png'),
                activeIcon: Image.asset('assets/images/archive2.png')),
            const BottomNavigationBarItem(
                label: 'Profile', icon: Icon(Icons.person))
          ]),
    );
  }
}
