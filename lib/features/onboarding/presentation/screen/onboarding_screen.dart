import 'package:expensetracker/features/onboarding/presentation/bloc/onboarding_bloc.dart';
import 'package:expensetracker/features/onboarding/presentation/widget/onboarding_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => OnboardingBloc(),
      child: OnboardingWidget(),
    );
  }
}
