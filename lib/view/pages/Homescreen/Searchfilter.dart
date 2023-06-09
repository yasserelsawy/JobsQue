import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'extras.dart';

class SearchViewFilter extends StatelessWidget {
  const SearchViewFilter({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(top: 10),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),

                  /// back and search bar
                  child: Row(
                    children: [
                      Expanded(
                        flex: 1,
                        child: IconButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            icon: const Icon(
                              Icons.arrow_back,
                              size: 25,
                            )),
                      ),
                      SizedBox(
                        width: 5.w,
                      ),
                      Expanded(
                        flex: 7,
                        child: Container(
                          margin: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                          padding: const EdgeInsets.fromLTRB(12, 14, 26, 10),
                          width: 300,
                          height: 52,
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: Colors.grey,
                            ),
                            borderRadius: BorderRadius.circular(90),
                          ),
                          child: Row(
                            children: const [
                              Image(
                                image: AssetImage('assets/images/search.png'),
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Expanded(
                                child: TextField(
                                  decoration: InputDecoration.collapsed(
                                    hintText: 'Search....',
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),

                /// filters
                Padding(
                  padding: const EdgeInsets.fromLTRB(12, 0, 12, 0),
                  child: Row(
                    children: [
                      Expanded(
                        flex: 1,
                        child: IconButton(
                          onPressed: () {
                            showModalBottomSheet(
                                shape: const RoundedRectangleBorder(
                                  borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(25.0),
                                      topRight: Radius.circular(25.0)),
                                ),
                                context: context,
                                isScrollControlled: true,
                                builder: (context) {
                                  return FilterBottomSheet();
                                });
                          },
                          icon: Image.asset(
                            AssetsImages.filter,
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 2.w,
                      ),
                      Expanded(
                        flex: 7,
                        child: Row(
                          children: [
                            Expanded(
                              flex: 1,
                              child: ActionChip(
                                  label: const Text('Remote'),
                                  labelStyle: const TextStyle(
                                      color: Colors.white, fontSize: 16),
                                  avatar: const Icon(Icons.arrow_drop_down,
                                      color: Colors.white),
                                  backgroundColor: cardPrimaryColor,
                                  onPressed: () {
                                    showModalBottomSheet(
                                        shape: const RoundedRectangleBorder(
                                          borderRadius: BorderRadius.only(
                                              topLeft: Radius.circular(25.0),
                                              topRight: Radius.circular(25.0)),
                                        ),
                                        context: context,
                                        isScrollControlled: true,
                                        builder: (context) {
                                          return chipsBottomSheet();
                                        });
                                  }),
                            ),
                            SizedBox(
                              width: 2.w,
                            ),
                            Expanded(
                              flex: 1,
                              child: ActionChip(
                                  label: const Text('Remote'),
                                  labelStyle: const TextStyle(
                                      color: Colors.white, fontSize: 16),
                                  avatar: const Icon(Icons.arrow_drop_down,
                                      color: Colors.white),
                                  backgroundColor: cardPrimaryColor,
                                  onPressed: () {}),
                            ),
                            SizedBox(
                              width: 2.w,
                            ),
                            Expanded(
                              flex: 1,
                              child: ActionChip(
                                  label: const Text('Remote'),
                                  labelStyle: const TextStyle(
                                      color: Colors.white, fontSize: 16),
                                  avatar: const Icon(Icons.arrow_drop_down,
                                      color: Colors.white),
                                  backgroundColor: cardPrimaryColor,
                                  onPressed: () {}),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),

                /// Featuring 120+ jobs
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
                            'Featuring 120+ jobs',
                            style: TextStyle(
                                fontSize: 12.sp,
                                fontWeight: FontWeight.w500,
                                color: const Color(0xFF6B7280)),
                          ),
                        ),
                      ],
                    )),

                /// jobs list
                Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    ListTile(
                      leading: const Image(
                        image: AssetImage('assets/images/twiter.png'),
                      ),
                      title: Text(
                        'Senior UI Designer',
                        style: TextStyle(
                            fontSize: 16.sp, fontWeight: FontWeight.bold),
                      ),
                      subtitle: Text(
                        'Twitter • Jakarta, Indonesia ',
                        style: TextStyle(
                          fontSize: 10.sp,
                        ),
                        textAlign: TextAlign.start,
                      ),
                      trailing: const Image(
                        image: AssetImage('assets/images/save1.png'),
                      ),
                    ),
                    const SizedBox(
                      height: 18,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                          left: 16, top: 0, right: 16, bottom: 10),
                      child: Row(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                width: 80,
                                height: 35,
                                decoration: BoxDecoration(
                                  border: Border.all(
                                    color: Colors.grey,
                                  ),
                                  borderRadius: BorderRadius.circular(20),
                                  color: const Color(0xFFD6E4FF),
                                ),
                                child: Center(
                                  child: Text(
                                    'Fulltime',
                                    style: TextStyle(
                                      fontSize: 10.sp,
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(
                                width: 6.5,
                              ),
                              Container(
                                width: 80,
                                height: 35,
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
                                      fontSize: 10.sp,
                                    ),
                                    textAlign: TextAlign.start,
                                  ),
                                ),
                              ),
                              const SizedBox(
                                width: 6.5,
                              ),
                              Container(
                                width: 80,
                                height: 35,
                                decoration: BoxDecoration(
                                  border: Border.all(
                                    color: Colors.grey,
                                  ),
                                  borderRadius: BorderRadius.circular(20),
                                  color: const Color(0xFFD6E4FF),
                                ),
                                child: Center(
                                  child: Text(
                                    'Design',
                                    style: TextStyle(
                                      fontSize: 10.sp,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          const Spacer(),
                          const Text('15K/Month'),
                        ],
                      ),
                    ),
                  ],
                ),

                /// separate line
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: defaultSeparatorContainer(),
                ),

                Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    ListTile(
                      leading: const Image(
                        image: AssetImage('assets/images/twiter.png'),
                      ),
                      title: Text(
                        'Senior UI Designer',
                        style: TextStyle(
                            fontSize: 16.sp, fontWeight: FontWeight.bold),
                      ),
                      subtitle: Text(
                        'Twitter • Jakarta, Indonesia ',
                        style: TextStyle(
                          fontSize: 10.sp,
                        ),
                        textAlign: TextAlign.start,
                      ),
                      trailing: const Image(
                        image: AssetImage('assets/images/save1.png'),
                      ),
                    ),
                    const SizedBox(
                      height: 18,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                          left: 16, top: 0, right: 16, bottom: 10),
                      child: Row(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                width: 80,
                                height: 35,
                                decoration: BoxDecoration(
                                  border: Border.all(
                                    color: Colors.grey,
                                  ),
                                  borderRadius: BorderRadius.circular(20),
                                  color: const Color(0xFFD6E4FF),
                                ),
                                child: Center(
                                  child: Text(
                                    'Fulltime',
                                    style: TextStyle(
                                      fontSize: 10.sp,
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(
                                width: 6.5,
                              ),
                              Container(
                                width: 80,
                                height: 35,
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
                                      fontSize: 10.sp,
                                    ),
                                    textAlign: TextAlign.start,
                                  ),
                                ),
                              ),
                              const SizedBox(
                                width: 6.5,
                              ),
                              Container(
                                width: 80,
                                height: 35,
                                decoration: BoxDecoration(
                                  border: Border.all(
                                    color: Colors.grey,
                                  ),
                                  borderRadius: BorderRadius.circular(20),
                                  color: const Color(0xFFD6E4FF),
                                ),
                                child: Center(
                                  child: Text(
                                    'Design',
                                    style: TextStyle(
                                      fontSize: 10.sp,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          const Spacer(),
                          const Text('15K/Month'),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
