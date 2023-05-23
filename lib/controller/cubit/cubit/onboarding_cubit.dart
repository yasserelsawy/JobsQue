import 'package:bloc/bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'onboarding_state.dart';

class OnboardingCubit extends Cubit<OnboardingState> {
  OnboardingCubit() : super(OnboardingInitial());
  bool isOnboardingCompleted = false;
  Future onboarding() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    isOnboardingCompleted = prefs.getBool('isOnboardingCompleted') ?? false;
  }
}
