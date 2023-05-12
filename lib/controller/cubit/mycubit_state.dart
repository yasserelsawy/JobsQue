part of 'mycubit_cubit.dart';

@immutable
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
