import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation_project/controller/cubit/mycubit_cubit.dart';
import 'package:graduation_project/view/pages/jobsInfo/jobsinfo.dart';
import 'package:sizer/sizer.dart';

import '../../../model/JobsModel.dart';
import '../jobsInfo/jobscontent.dart';

class SearchPage extends StatefulWidget {
  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  TextEditingController searchController = TextEditingController();
  List<JobsModel> searchlist = [];
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<MycubitCubit, MycubitState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        final cubit = MycubitCubit.get(context);
        List<JobsModel> jobslist = cubit.jobsList;
        void filterjobs(String query) {
          setState(() {
            searchlist = jobslist
                .where((job) =>
                    job.name!.toLowerCase().contains(query.toLowerCase()))
                .toList();
          });
        }

        return Scaffold(
          body: SafeArea(
            child: Padding(
              padding: const EdgeInsets.only(top: 15),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),

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
                                ))),
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
                              children: [
                                Image(
                                  image: AssetImage('assets/images/search.png'),
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Expanded(
                                  child: TextField(
                                    controller: searchController,
                                    onChanged: (query) => filterjobs(query),
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

                    // child: TextField(
                    //   controller: searchController,
                    //   onChanged: (query) => filterBooks(query),
                    //   decoration: InputDecoration(
                    //     hintText: 'Search books...',
                    //     border: OutlineInputBorder(),
                    //   ),
                    // ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 10, bottom: 10),
                    child: Container(
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
                                'Recent searches',
                                style: TextStyle(
                                    fontSize: 12.sp,
                                    fontWeight: FontWeight.w500,
                                    color: const Color(0xFF6B7280)),
                              ),
                            ),
                          ],
                        )),
                  ),
                  Expanded(
                    child: ListView.builder(
                      itemCount: searchlist.length,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: ListTile(
                            trailing: Image.asset('assets/images/ar.png'),
                            title: Text('${searchlist[index].name}'),
                            subtitle: Text('${searchlist[index].location}'),
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      JobDetail(jobsindex: index),
                                ),
                              );
                            },
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
