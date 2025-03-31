import 'package:flutter_bloc/flutter_bloc.dart';

class OnboardingBloc extends Cubit<int> {
  OnboardingBloc() : super(0);
  currentPage(int value) {
    emit(value);
  }
}
