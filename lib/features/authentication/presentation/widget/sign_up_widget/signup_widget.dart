import 'package:expensetracker/core/constants/constant_assets.dart';
import 'package:expensetracker/core/route/constant_route.dart';
import 'package:expensetracker/core/theme/app_colors.dart';
import 'package:expensetracker/core/utils/form_validators.dart';
import 'package:expensetracker/core/widget/button/custom_icon_button.dart';
import 'package:expensetracker/core/widget/button/custom_round_button.dart';
import 'package:expensetracker/core/widget/text_field/custom_text_field.dart';
import 'package:expensetracker/core/widget/text_tile/content_text.dart';
import 'package:expensetracker/core/wrapper/scaffold_wrapper.dart';
import 'package:expensetracker/features/authentication/presentation/widget/sign_up_widget/check_button_text_widget.dart';
import 'package:expensetracker/features/authentication/presentation/widget/sign_up_widget/text_onpressed_widget.dart';
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
  final TextEditingController namecontroller = TextEditingController();
  final _formkeySignUp = GlobalKey<FormState>();
  bool _isAlreadyValidate = false;

  @override
  Widget build(BuildContext context) {
    return ScaffoldWrapper(
      title: "SignUp",
      body: ListView(
        children: [
          SizedBox(height: 80.h),
          Form(
            key: _formkeySignUp,
            child: Column(
              children: [
                ReusableFormField(
                  title: "Name",
                  controller: namecontroller,
                  onChanged: (val) {
                    validateField();
                  },
                  validator: (String? value) {
                    return FormValidator.validateEmail(value ?? "");
                  },
                ),
                ReusableFormField(
                  title: "Email",
                  controller: emailController,
                  onChanged: (val) {
                    validateField();
                  },
                  validator: (String? value) {
                    return FormValidator.validateEmail(value ?? "");
                  },
                ),

                ReusableFormField(
                  title: "Password",
                  obscureText: true,
                  controller: passwordcontroller,
                  onChanged: (val) {
                    validateField();
                  },
                  validator: (String? value) {
                    return FormValidator.validatePassword(value ?? "");
                  },
                ),
                CheckButtonText(
                  policytext: " Terms of Service and Privacy Policy",
                  text: "By signing up, you agree to the",
                ),
                SizedBox(height: 10.h),
                ContentText(
                  title: "Or with",
                  color: AppColors.kPrimarylightColor,
                ),
                CustomIconButton(title: "  Sign Up with Google"),
                CustomRoundButton(
                  title: "Sign Up",
                  onPressed: () {
                    signUp();
                  },
                ),
                SizedBox(height: 10.h),
                TextWithOnPressed(
                  staticText: "Already have an account? ",
                  navigateText: "Login",
                  onTap: () {
                    context.push(Routes.loginScreen);
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
      _formkeySignUp.currentState!.validate();
    }
  }

  signUp() async {
    setState(() {
      _isAlreadyValidate = true;
    });
    if (_formkeySignUp.currentState!.validate()) {
      FocusScope.of(context).unfocus();
    }
  }

  @override
  void dispose() {
    emailController.dispose();
    namecontroller.dispose();
    passwordcontroller.dispose();
    super.dispose();
  }
}
