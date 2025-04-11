import 'package:expensetracker/features/authentication/presentation/bloc/pin_bloc.dart';
import 'package:expensetracker/features/authentication/presentation/widget/pin_widget/pin_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PinScreen extends StatelessWidget {
  const PinScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(create: (context) => PinBloc(), child: PinWidget());
  }
}
