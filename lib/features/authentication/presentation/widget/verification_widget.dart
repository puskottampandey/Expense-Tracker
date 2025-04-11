import 'package:expensetracker/core/widget/button/custom_round_button.dart';
import 'package:expensetracker/core/wrapper/scaffold_wrapper.dart';
import 'package:flutter/material.dart';

class VerificationWidget extends StatelessWidget {
  const VerificationWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textTheme = theme.textTheme;
    return ScaffoldWrapper(
      title: "Verification",
      body: ListView(
        children: [
          Text("Enter your Verification Code", style: textTheme.bodyLarge),

          CustomRoundButton(title: "Verify", onPressed: () {}),
        ],
      ),
    );
  }
}
