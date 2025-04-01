import 'package:expensetracker/core/theme/app_colors.dart';
import 'package:expensetracker/core/utils/form_validators.dart';
import 'package:expensetracker/core/widget/button/custom_round_button.dart';
import 'package:expensetracker/core/widget/text_field/custom_text_field.dart';
import 'package:expensetracker/core/wrapper/scaffold_wrapper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class SignupWidget extends StatefulWidget {
  const SignupWidget({super.key});

  @override
  State<SignupWidget> createState() => _SignupWidgetState();
}

class _SignupWidgetState extends State<SignupWidget> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordcontroller = TextEditingController();
  static final _formkeyLogin = GlobalKey<FormState>();
  bool _isAlreadyValidate = false;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textTheme = theme.textTheme;
    return ScaffoldWrapper(
      title: "SignUp",
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
                  hint: "Email",
                  textInputAction: TextInputAction.next,
                  keyboardType: TextInputType.text,
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
                  hint: "Password",
                  onChanged: (val) {
                    validateField();
                  },
                  textInputAction: TextInputAction.next,
                  keyboardType: TextInputType.text,
                  validator: (String? value) {
                    return FormValidator.validatePassword(value ?? "");
                  },
                ),
                SizedBox(height: 20.h),
                CustomRoundButton(
                  title: "Sign Up",
                  onPressed: () {
                    signUp();
                  },
                ),
                SizedBox(height: 10.h),
                GestureDetector(
                  onTap: () {},
                  child: Text(
                    "Forgot Password?",
                    style: textTheme.bodyLarge!.copyWith(
                      fontSize: AppColors.regular2,
                      color: AppColors.kPrimaryVoiletColor,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                SizedBox(height: 10.h),
                GestureDetector(
                  onTap: () {
                    context.push("/signup");
                  },
                  child: RichText(
                    text: TextSpan(
                      text: "Don't have an account yet? ",
                      style: textTheme.bodyLarge!.copyWith(
                        fontSize: AppColors.regular2,
                        color: AppColors.kPrimarylightColor,
                        fontWeight: FontWeight.w600,
                      ),
                      children: [
                        TextSpan(
                          text: "Login",
                          style: textTheme.bodyLarge!.copyWith(
                            fontSize: AppColors.regular2,
                            color: AppColors.kPrimaryVoiletColor,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                  ),
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
