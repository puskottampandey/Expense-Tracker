import 'package:expensetracker/core/utils/form_validators.dart';
import 'package:expensetracker/core/widget/button/custom_round_button.dart';
import 'package:expensetracker/core/widget/text_field/custom_text_field.dart';
import 'package:expensetracker/core/wrapper/scaffold_wrapper.dart';
import 'package:flutter/material.dart';

class ResetWidget extends StatefulWidget {
  const ResetWidget({super.key});

  @override
  State<ResetWidget> createState() => _ResetWidgetState();
}

class _ResetWidgetState extends State<ResetWidget> {
  final TextEditingController newpassword = TextEditingController();
  final TextEditingController confirmpassword = TextEditingController();
  final _formkeyReset = GlobalKey<FormState>();
  bool _isAlreadyValidate = false;
  String newpass = "";
  @override
  Widget build(BuildContext context) {
    return ScaffoldWrapper(
      title: "Reset Password",
      body: ListView(
        children: [
          Form(
            key: _formkeyReset,
            child: Column(
              children: [
                ReusableFormField(
                  title: "New Password",
                  onChanged: (val) {
                    validateField();
                  },
                  validator: (String? val) {
                    newpass = val!;
                    return FormValidator.validatePassword(val);
                  },
                  controller: newpassword,
                ),
                ReusableFormField(
                  title: "New Password",
                  onChanged: (val) {
                    validateField();
                  },
                  validator: (String? val) {
                    return FormValidator.validateConfirmPassword(val, newpass);
                  },
                  controller: newpassword,
                ),
                CustomRoundButton(
                  title: "Reset",
                  onPressed: () {
                    reset();
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  validateField() {
    if (_isAlreadyValidate) {
      _formkeyReset.currentState!.validate();
    }
  }

  reset() async {
    setState(() {
      _isAlreadyValidate = true;
    });
    if (_formkeyReset.currentState!.validate()) {
      FocusScope.of(context).unfocus();
    }
  }
}
