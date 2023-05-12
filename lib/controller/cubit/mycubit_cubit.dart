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
  List<JobsModel> cubitsave = [];

  void savejob(
    JobsModel job,
    List<JobsModel> savedjobscubit,
  ) {
    if (savedjobscubit.contains(job)) {
      savedjobscubit.remove(job);
      emit(removejobstate());
    } else {
      savedjobscubit.add(job);

      emit(savejobstate());
    }
    for (JobsModel i in savedjobscubit) {
      if (!cubitsave.contains(i)) {
        cubitsave.add(i);
        emit(savejobstate());
      } else {
        cubitsave.remove(i);
        emit(removejobstate());
      }
    }

    print(cubitsave.length);
  }

  void filterjobs(String query, List jobslist, List searchlist) async {
    searchlist = jobslist
        .where((job) => job.name!.toLowerCase().contains(query.toLowerCase()))
        .toList();

    emit(searchstate());
  }

  void toggle(bool favorite) {
    favorite = !favorite;
  }

  Future<String> getName() async {
    final prefs = await SharedPreferences.getInstance();
    final name = prefs.getString('name') ?? '';
    return name;
  }

  int currentstep = 0;
  void changestep() {
    currentstep++;
    emit(changestepstate());
  }

  void changeindex(int index) {
    currentstep = index;
    emit(changeindexstate());
  }
}
