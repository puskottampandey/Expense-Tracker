import 'package:expensetracker/core/route/constant_route.dart';
import 'package:expensetracker/core/theme/app_colors.dart';
import 'package:expensetracker/core/utils/form_validators.dart';
import 'package:expensetracker/core/widget/button/custom_round_button.dart';
import 'package:expensetracker/core/widget/text_field/custom_text_field.dart';
import 'package:expensetracker/core/wrapper/scaffold_wrapper.dart';
import 'package:expensetracker/features/authentication/presentation/widget/single_text_onpressed_widget.dart';
import 'package:expensetracker/features/authentication/presentation/widget/text_onpressed_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class LoginWidget extends StatefulWidget {
  const LoginWidget({super.key});

  @override
  State<LoginWidget> createState() => _LoginWidgetState();
}

class _LoginWidgetState extends State<LoginWidget> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordcontroller = TextEditingController();
  static final _formkeyLogin = GlobalKey<FormState>();
  bool _isAlreadyValidate = false;

  @override
  Widget build(BuildContext context) {
    return ScaffoldWrapper(
      title: "Login",
      body: ListView(
        children: [
          SizedBox(height: 80.h),
          Form(
            key: _formkeyLogin,
            child: Column(
              children: [
                ReusableFormField(
                  title: "Email or Username",
                  controller: emailController,
                  onChanged: (val) {
                    validateField();
                  },
                  validator: (String? value) {
                    return FormValidator.validateEmail(value ?? "");
                  },
                ),
                SizedBox(height: 10.h),

                ReusableFormField(
                  title: "Password",
                  obscureText: true,
                  controller: passwordcontroller,
                  onChanged: (val) {
                    validateField();
                  },
                  textInputAction: TextInputAction.done,
                  validator: (String? value) {
                    return FormValidator.validatePassword(value ?? "");
                  },
                ),
                SizedBox(height: 10.h),
                CustomRoundButton(
                  title: "Login",
                  onPressed: () {
                    signUp();
                  },
                ),
                SizedBox(height: 10.h),
                TextTapped(text: "Forgot Password", onTap: () {}),
                SizedBox(height: 10.h),
                TextWithOnPressed(
                  staticText: "Don't have account yet? ",
                  navigateText: "SignUp",
                  onTap: () {
                    context.push(Routes.signUpScreen);
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
      _formkeyLogin.currentState!.validate();
    }
  }

  signUp() async {
    setState(() {
      _isAlreadyValidate = true;
    });
    if (_formkeyLogin.currentState!.validate()) {
      FocusScope.of(context).unfocus();
    }
  }
}
