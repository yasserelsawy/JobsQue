// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'mycubit_cubit.dart';

abstract class MycubitState {}

class MycubitInitial extends MycubitState {}

class NewsInitialState extends MycubitState {}

class NewsNtmNavState extends MycubitState {}

class GetJobsSuccessState extends MycubitState {}

class savejobstate extends MycubitState {}

class removejobstate extends MycubitState {}

class searchstate extends MycubitState {}

class gettingnamestate extends MycubitState {}

class togglesavestate extends MycubitState {}

class emptysavedjobs extends MycubitState {}

class changestepstate extends MycubitState {}

class changeindexstate extends MycubitState {}

class registerLoadingstate extends MycubitState {}

class registerSucsseed extends MycubitState {}

class registerFailure extends MycubitState {
  String error;
  registerFailure({
    required this.error,
  });
}

class LoginLoadingstate extends MycubitState {}

class LoginSucsseed extends MycubitState {}

class AddJobState extends MycubitState {}

class favoritestate extends MycubitState {}

class failedapply extends MycubitState {
  String error;
  failedapply({required this.error});
}

class LoginFailure extends MycubitState {
  String error;

  LoginFailure({required this.error});
}
