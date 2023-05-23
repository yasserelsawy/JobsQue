import 'package:flutter/material.dart';
import 'package:graduation_project/view/pages/Setting_profile/profile.dart';
import 'package:sizer/sizer.dart';

import '../../../controller/database/remote.dart';
import '../../Widgets/customtTextFormField.dart';

class Experiencepage extends StatefulWidget {
  const Experiencepage({super.key});

  @override
  State<Experiencepage> createState() => _ExperiencepageState();
}

class _ExperiencepageState extends State<Experiencepage> {
  final List<String> _items = ['Full time', 'Part time', 'Freelance'];
  late var selectedItem;
  bool ischecked = false;
  TextEditingController positioncontroller = TextEditingController();
  TextEditingController Locationcontroller = TextEditingController();
  TextEditingController companynamecontroller = TextEditingController();

  TextEditingController startyearcontroller = TextEditingController();
  Api api = Api();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(
              Icons.arrow_back,
              color: Colors.black,
            )),
        title: Text(
          'Experience',
          style: TextStyle(
              fontSize: 16.sp,
              color: const Color(0xFF111827),
              fontWeight: FontWeight.w500),
        ),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        child: Column(children: [
          SizedBox(
            height: 2.h,
          ),
          Center(
              child: Container(
            height: 80.h,
            width: 90.w,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                border: Border.all(color: Color(0xFFD1D5DB))),
            child: Column(
              children: [
                SizedBox(
                  height: 2.h,
                ),
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 12, bottom: 10),
                      child: Text(
                        'Position *',
                        style: TextStyle(
                            fontSize: 14.sp, color: Color(0xFF9CA3AF)),
                      ),
                    )
                  ],
                ),
                SizedBox(
                    height: 7.h,
                    width: 80.w,
                    child: CustomTextFormFieldnoImage(
                      controller: positioncontroller,
                      hintText: 'Please enter your Position ',
                    )),
                SizedBox(
                  height: 2.h,
                ),
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 12, bottom: 10),
                      child: Text(
                        'Type of work ',
                        style: TextStyle(
                            fontSize: 14.sp, color: Color(0xFF9CA3AF)),
                      ),
                    )
                  ],
                ),
                SizedBox(
                  height: 7.h,
                  width: 80.w,
                  child: DropdownButtonFormField(
                      decoration: InputDecoration(
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide:
                                  const BorderSide(color: Color(0xFFD1D5DB)))),
                      items: _items.map((item) {
                        return DropdownMenuItem(value: item, child: Text(item));
                      }).toList(),
                      onChanged: (value) {
                        setState(() {
                          selectedItem = value;
                        });
                      }),
                ),
                SizedBox(
                  height: 2.h,
                ),
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 12, bottom: 10),
                      child: Text(
                        'Company name *',
                        style: TextStyle(
                            fontSize: 14.sp, color: const Color(0xFF9CA3AF)),
                      ),
                    )
                  ],
                ),
                SizedBox(
                    height: 7.h,
                    width: 80.w,
                    child: CustomTextFormFieldnoImage(
                      controller: companynamecontroller,
                      hintText: 'Please enter your Company name',
                    )),
                SizedBox(
                  height: 2.h,
                ),
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 12, bottom: 10),
                      child: Text(
                        'Location ',
                        style: TextStyle(
                            fontSize: 14.sp, color: const Color(0xFF9CA3AF)),
                      ),
                    )
                  ],
                ),
                SizedBox(
                    height: 7.h,
                    width: 80.w,
                    child: CustomTextFormField(
                        controller: Locationcontroller,
                        image: 'assets/images/location.png',
                        hintText: 'Please enter your Location')),
                SizedBox(
                  height: 2.h,
                ),
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 12, bottom: 10),
                      child: Text(
                        'Start Year * ',
                        style: TextStyle(
                            fontSize: 14.sp, color: const Color(0xFF9CA3AF)),
                      ),
                    )
                  ],
                ),
                SizedBox(
                    height: 7.h,
                    width: 80.w,
                    child: CustomTextFormFieldnoImage(
                      controller: startyearcontroller,
                      hintText: 'Please enter your Starting Year ',
                    )),
                Row(
                  children: [
                    Checkbox(
                      activeColor: const Color(0xFF3366FF),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5)),
                      value: ischecked,
                      onChanged: (newvalue) {
                        setState(
                          () {
                            ischecked = newvalue!;
                          },
                        );
                      },
                    ),
                    Text(
                      'I am currently working in this role',
                      style: TextStyle(
                          fontSize: 12.sp, fontWeight: FontWeight.w500),
                    )
                  ],
                ),
                SizedBox(
                  height: 48,
                  width: 327,
                  child: ElevatedButton(
                      onPressed: () {
                        api.PostExperience(
                            positioncontroller.text,
                            selectedItem,
                            companynamecontroller.text,
                            Locationcontroller.text,
                            startyearcontroller.text,
                            context);
                        // Navigator.push(context,
                        //     MaterialPageRoute(builder: (context) => Profile()));
                      },
                      style: ElevatedButton.styleFrom(
                          primary: Color(0xFF3366FF),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(25))),
                      child: const Text('Save',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                          ))),
                ),
              ],
            ),
          )),
          SizedBox(
            height: 3.h,
          ),
          Container(
            height: 15.h,
            width: 90.w,
            decoration: BoxDecoration(
                border: Border.all(color: Color(0xFFD1D5DB)),
                borderRadius: BorderRadius.circular(10)),
            child: Padding(
              padding: const EdgeInsets.only(top: 12),
              child: ListTile(
                leading: Image.asset('assets/images/logo4.png'),
                title: Text(
                  'Senior UI/UX Designer',
                  style:
                      TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w500),
                ),
                subtitle: Text(
                  'Remote • GrowUp Studio',
                  style: TextStyle(
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w400,
                      color: Color(0xFF6B7280)),
                ),
                trailing: IconButton(
                  onPressed: () {},
                  icon: Image.asset('assets/images/edit.png'),
                ),
              ),
            ),
          ),
          SizedBox(
            height: 2.h,
          )
        ]),
      ),
    );
  }
}
