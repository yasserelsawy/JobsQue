// import 'package:flutter/material.dart';
// import 'package:sizer/sizer.dart';

// class Emptysave2 extends StatefulWidget {
//   const Emptysave2({super.key});

//   @override
//   State<Emptysave2> createState() => _Emptysave2State();
// }

// int selectedindex = 0;

// class _Emptysave2State extends State<Emptysave2> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: SafeArea(
//           child: Column(
//         children: [
//           Row(
//             children: [
//               IconButton(
//                   onPressed: () {
//                     Navigator.pop(context);
//                   },
//                   icon: const Icon(
//                     Icons.arrow_back,
//                     size: 30,
//                   )),
//               SizedBox(
//                 width: 30.w,
//               ),
//               Text(
//                 'Saved',
//                 style: TextStyle(
//                     fontSize: 18.sp,
//                     fontWeight: FontWeight.w500,
//                     color: const Color(0xFF111827)),
//               )
//             ],
//           ),
//           SizedBox(
//             height: 30.h,
//           ),
//           Image.asset('assets/images/midscreen.png'),
//           Text(
//             'Nothing has been saved yet',
//             style: TextStyle(
//                 fontSize: 19.sp,
//                 fontWeight: FontWeight.w500,
//                 color: Color(0xFF111827)),
//           ),
//           SizedBox(
//             height: 8.sp,
//           ),
//           Text(
//             'Press the star icon on the job you want to save.',
//             style: TextStyle(
//                 fontSize: 13.sp,
//                 fontWeight: FontWeight.w400,
//                 color: Color(0xFF6B7280)),
//           ),
//         ],
//       )),
//       bottomNavigationBar: BottomNavigationBar(
//           showUnselectedLabels: true,
//           selectedItemColor: const Color(0xFF3366FF),
//           unselectedItemColor: const Color(0xFF9CA3AF),
//           currentIndex: selectedindex,
//           onTap: (index) {
//             setState(() {
//               selectedindex = index;
//             });
//           },
//           items: [
//             BottomNavigationBarItem(
//                 label: 'home',
//                 icon: Image.asset('assets/images/home.png'),
//                 activeIcon: Image.asset('assets/images/home2.png')),
//             BottomNavigationBarItem(
//                 label: 'messages',
//                 icon: Image.asset('assets/images/message.png'),
//                 activeIcon: Image.asset('assets/images/message2.png')),
//             BottomNavigationBarItem(
//                 label: 'Applied',
//                 icon: Image.asset('assets/images/briefcase2.png'),
//                 activeIcon: Image.asset('assets/images/briefcase.png')),
//             BottomNavigationBarItem(
//                 label: 'Saved',
//                 icon: Image.asset('assets/images/archive.png'),
//                 activeIcon: Image.asset('assets/images/archive2.png')),
//             const BottomNavigationBarItem(
//                 label: 'Profile', icon: Icon(Icons.person))
//           ]),
//     );
//   }
// }
