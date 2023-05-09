import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../model/messagesmodel.dart';
import '../../model/savedjobsmodel.dart';
import '../pages/Messages/chat.dart';
import 'Constants.dart';

class SavedJobCard extends StatelessWidget {
  Savedjobsmodel savedmodel;
  SavedJobCard({
    Key? key,
    required this.savedmodel,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 16.h,
      width: 300.w,
      child: Column(
        children: [
          ListTile(
            title: Text(
              '${savedmodel.title}',
              style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w500),
            ),
            subtitle: Text(
              '${savedmodel.subtitle}',
              style: TextStyle(
                  fontSize: 10.sp,
                  fontWeight: FontWeight.w400,
                  color: const Color(0xFF374151)),
            ),
            leading: Image.asset('${savedmodel.icon}'),
            trailing: IconButton(
                onPressed: () {
                  showModalBottomSheet(
                      shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(25),
                              topRight: Radius.circular(25))),
                      context: context,
                      builder: (context) => const Bottomsheetbutton());
                },
                icon: Image.asset('assets/images/more.png')),
          ),
          Row(
            children: [
              SizedBox(
                width: 4.w,
              ),
              Text(
                '${savedmodel.posttime}',
                style: TextStyle(
                    fontSize: 9.sp,
                    fontWeight: FontWeight.w500,
                    color: const Color(0xFF374151)),
              ),
              SizedBox(
                width: 35.w,
              ),
              Image.asset('assets/images/clock.png'),
              SizedBox(
                width: 1.w,
              ),
              Text(
                'Be an early applicant',
                style: TextStyle(
                    fontSize: 9.sp,
                    fontWeight: FontWeight.w500,
                    color: const Color(0xFF374151)),
              ),
            ],
          )
        ],
      ),
    );
  }
}

// contacs page card
class ContactsCard extends StatelessWidget {
  Contacts contacsmodel;
  ContactsCard({
    Key? key,
    required this.contacsmodel,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
        onTap: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => Chatpage()));
        },
        leading: Image.asset('${contacsmodel.image}'),
        title: Text(
          '${contacsmodel.name}',
          style: TextStyle(
              fontSize: 14.sp,
              color: const Color(0xFF111827),
              fontWeight: FontWeight.w500),
        ),
        subtitle: Text(
          '${contacsmodel.message}',
          style: TextStyle(fontSize: 10.sp, fontWeight: FontWeight.w400),
        ),
        trailing: Text('${contacsmodel.time}'));
  }
}
