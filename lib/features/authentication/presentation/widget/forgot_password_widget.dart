import 'package:expensetracker/core/route/constant_route.dart';
import 'package:expensetracker/core/utils/form_validators.dart';
import 'package:expensetracker/core/widget/button/custom_round_button.dart';
import 'package:expensetracker/core/widget/text_field/custom_text_field.dart';
import 'package:expensetracker/core/wrapper/scaffold_wrapper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class ForgotPasswordWidget extends StatefulWidget {
  const ForgotPasswordWidget({super.key});

  @override
  State<ForgotPasswordWidget> createState() => _ForgotPasswordWidgetState();
}

class _ForgotPasswordWidgetState extends State<ForgotPasswordWidget> {
  final TextEditingController forgotController = TextEditingController();
  final _formkeyforgot = GlobalKey<FormState>();
  bool _isAlreadyValidate = false;
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textTheme = theme.textTheme;
    return ScaffoldWrapper(
      title: "Forgot Password",
      body: ListView(
        children: [
          SizedBox(height: 40.h),
          Form(
            key: _formkeyforgot,
            child: Column(
              children: [
                Text(
                  "Don’t worry.",
                  textAlign: TextAlign.start,
                  style: textTheme.bodyMedium!,
                ),
                Text(
                  "Enter your email and we’ll send you a link to reset your password.",
                  maxLines: 3,
                  style: textTheme.bodyMedium,
                ),
                SizedBox(height: 20.h),
                ReusableFormField(
                  title: "Email",
                  onChanged: (val) {
                    validateField();
                  },
                  controller: forgotController,
                  validator: (String? value) {
                    return FormValidator.validateEmail(value ?? "");
                  },
                ),

                CustomRoundButton(
                  title: "Continue",
                  onPressed: () {
                    signUp();
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
      _formkeyforgot.currentState!.validate();
    }
  }

  signUp() async {
    setState(() {
      _isAlreadyValidate = true;
    });
    context.push(Routes.confrimScreen);
    if (_formkeyforgot.currentState!.validate()) {
      FocusScope.of(context).unfocus();
    }
  }
}
