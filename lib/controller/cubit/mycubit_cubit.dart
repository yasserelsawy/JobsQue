import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../model/JobsModel.dart';
import '../database/remote.dart';

part 'mycubit_state.dart';

class MycubitCubit extends Cubit<MycubitState> {
  static MycubitCubit get(context) => BlocProvider.of(context);

  MycubitCubit() : super(MycubitInitial());

  List<JobsModel> jobsList = [];
  Future<List> getAllJobs() async {
    List<dynamic> data = await Api().get(url: 'http://164.92.246.77/api/jobs');

    List<JobsModel> jobs = data.map((job) => JobsModel.fromJson(job)).toList();

    jobsList = jobs;
    emit(GetJobsSuccessState());
    print(jobsList[1].name);
    // List<JobsModel> jobs = [];
    // for(int i=0;i<data.length;i++){
    // jobs.add(JobsModel.fromJson(data[i]));
    // }

    // for (JobsModel job in jobs) {
    // print('${job.name}');
    // }
    // //print(jobs[data[1].]);
    return data;
  }

  // Future<void> loadName() async {
  //   final prefs = await SharedPreferences.getInstance();
  //   final name = prefs.getString('name') ?? '';
  //   emit(name as MycubitState);
  // }

  Future getName(String newname) async {
    var name;
    final prefs = await SharedPreferences.getInstance();
    name = prefs.getString('name');
    newname = name;
    emit(gettingname as MycubitState);
  }
}
