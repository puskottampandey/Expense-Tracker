import 'package:expensetracker/features/authentication/presentation/bloc/check_box_bloc.dart';
import 'package:expensetracker/features/authentication/presentation/widget/sign_up_widget/signup_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CheckBoxBloc(),
      child: SignupWidget(),
    );
  }
}
