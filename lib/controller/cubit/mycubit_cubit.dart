import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation_project/view/pages/loginandregister/Loginscreen.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../model/JobsModel.dart';
import '../database/remote.dart';
import 'package:http/http.dart' as http;
part 'mycubit_state.dart';

class MycubitCubit extends Cubit<MycubitState> {
  static MycubitCubit get(context) => BlocProvider.of(context);

  MycubitCubit() : super(MycubitInitial());
  Api api = Api();
  // bool isregistered = false;
  bool isOnboardingCompleted = false;
  List<JobsModel> jobsList = [];

  Future<List> getAllJobs() async {
    List<dynamic> data = await Api().get(url: 'http://164.92.246.77/api/jobs');

    List<JobsModel> jobs = data.map((job) => JobsModel.fromJson(job)).toList();

    jobsList = jobs;

    emit(GetJobsSuccessState());
    print(jobsList[1].name);

    return data;
  }

  Future<void> register(
      String name, String email, String password, BuildContext context) async {
    try {
      await api.Register(name, email, password);
      emit(registerSucsseed());
      // final prefs = await SharedPreferences.getInstance();
      // prefs.setBool('isregistered', true);
    } catch (e) {
      emit(registerFailure(error: e.toString()));
    }
  }

  Future<void> Login(String email, String password) async {
    try {
      emit(LoginLoadingstate());
      await api.Login(email, password);
      emit(LoginSucsseed());
    } catch (e) {
      emit(LoginFailure(error: e.toString()));
    }
  }

  // Future<void> Login() async {}

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

  List<JobsModel> AppliedJobs = [];
  void addjobtoapplied(JobsModel Job) {
    AppliedJobs.add(Job);
    emit(AddJobState());
  }
}

// class Togglecubit extends Cubit<bool> {
//   Togglecubit() : super(false);
//   void toggle() => emit(!state);
// }
