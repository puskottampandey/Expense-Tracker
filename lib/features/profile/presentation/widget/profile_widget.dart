import 'package:expensetracker/core/wrapper/scaffold_wrapper.dart';
import 'package:flutter/material.dart';

class ProfileWidget extends StatelessWidget {
  const ProfileWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return ScaffoldWrapper(
      body: Column(children: [Text("hello")]),
      title: "profile",
    );
  }
}
