import 'package:expensetracker/core/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ReusableFormField extends StatefulWidget {
  final String? Function(String?)? validator;
  final void Function(String?)? onChanged;
  final void Function(String?)? onFieldSubmit;

  final TextEditingController? controller;
  final String? hint;
  final String title;
  final String? initialValue;
  final String? label;
  final String? labeltext;
  final bool obscureText;
  final bool isChirfaar;
  final TextInputType keyboardType;
  final int maxLines;
  final int minLines;
  final int? maxLength;
  final String? desc;

  final bool? enabled;
  final IconData? prefix;
  final Widget? sufixIcon;
  final TextCapitalization? textCapitalization;
  final bool requiredText;
  final bool marginBottom;
  final VoidCallback? onTap;
  final bool showError;
  final bool isPhone;
  final bool isFilled;
  final bool readonly;
  final bool? autofocus;
  final TextInputAction? textInputAction;
  final FocusNode? focusNode;
  final List<TextInputFormatter>? inputFormatter;
  final EdgeInsetsGeometry? contentPadding;
  final bool validation;
  const ReusableFormField({
    super.key,
    this.validator,
    this.onChanged,
    this.onFieldSubmit,
    this.enabled = true,
    this.marginBottom = true,
    this.isPhone = false,
    this.validation = false,
    this.hint,
    this.label,
    this.keyboardType = TextInputType.text,
    this.obscureText = false,
    this.isChirfaar = false,
    this.maxLines = 1,
    this.minLines = 1,
    this.maxLength,
    this.controller,
    this.prefix,
    this.desc,
    this.textCapitalization,
    this.requiredText = false,
    this.initialValue,
    this.onTap,
    this.sufixIcon,
    this.autofocus,
    this.textInputAction,
    this.showError = true,
    this.isFilled = true,
    this.readonly = false,
    this.inputFormatter,
    this.contentPadding,
    this.focusNode,
    this.labeltext,
    required this.title,
  });

  @override
  // ignore: library_private_types_in_public_api
  _ReusableFormFieldState createState() =>
  // ignore: no_logic_in_create_state
  _ReusableFormFieldState(obscureText: obscureText);
}

class _ReusableFormFieldState extends State<ReusableFormField> {
  String? errorText;
  bool interacted = false;

  bool obscureText;

  _ReusableFormFieldState({required this.obscureText});
  String _password = '';
  int _strength = 0; // Strength out of 100

  void _updatePassword(String value) {
    setState(() {
      _password = value;
      _calculateStrength();
    });
  }

  void _calculateStrength() {
    int length = _password.length;
    int strength = 0;
    if (length >= 8) strength += 20;
    if (RegExp(r'^(?=.*[a-z])(?=.*[A-Z]).+$').hasMatch(_password)) {
      strength += 40;
    }
    if (RegExp(r'[0-9]').hasMatch(_password)) strength += 20;
    if (RegExp(r'[!@#$%^&*(),.?":{}|<>]').hasMatch(_password)) strength += 20;

    setState(() {
      _strength = strength;
    });
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textTheme = theme.textTheme;
    return Container(
      margin:
          widget.marginBottom ? EdgeInsets.only(bottom: 10.h) : EdgeInsets.zero,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            widget.title,
            style: textTheme.titleSmall?.copyWith(
              fontWeight: FontWeight.w500,
              color: AppColors.kseconadaryDarkColor,
            ),
          ),
          formField(context),
        ],
      ),
    );
  }

  TextFormField formField(BuildContext context) {
    final theme = Theme.of(context);
    final textTheme = theme.textTheme;
    return TextFormField(
      style: textTheme.titleSmall,
      cursorColor: AppColors.kPrimaryVoiletColor,
      minLines: widget.minLines,
      focusNode: widget.focusNode,
      autofocus: widget.autofocus ?? false,
      enabled: widget.enabled,
      readOnly: widget.readonly,
      controller: widget.controller,
      keyboardType: widget.keyboardType,
      textInputAction: widget.textInputAction,
      textCapitalization: widget.textCapitalization ?? TextCapitalization.none,
      obscureText: obscureText,
      initialValue: widget.initialValue,
      maxLength: widget.maxLength ?? (widget.maxLines > 1 ? 1000 : 100),
      maxLines: widget.maxLines,
      textAlignVertical: TextAlignVertical.center,
      inputFormatters: widget.inputFormatter,
      decoration: InputDecoration(
        labelText: widget.labeltext,
        counterText: "",
        fillColor: AppColors.backgroundColor,
        filled: widget.isFilled,
        hintText: widget.hint,
        hintStyle: textTheme.titleMedium?.copyWith(
          color: AppColors.kverylightDarkColor,
        ),
        errorStyle: textTheme.titleSmall?.copyWith(
          color: AppColors.kPrimaryRedColor,
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.r),
          borderSide: BorderSide(width: 1.5, color: AppColors.kPrimaryRedColor),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.r),
          borderSide: BorderSide(width: 1.5, color: AppColors.kPrimaryRedColor),
        ),
        focusedBorder:
            widget.controller!.text.isNotEmpty
                ? OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.r),
                  borderSide: BorderSide(
                    color: AppColors.kPrimaryVoiletColor,
                    width: 1.5,
                  ),
                )
                : InputBorder.none,

        border: InputBorder.none,
        prefixIcon:
            widget.prefix != null
                ? Icon(
                  widget.prefix,
                  color: const Color(0xffBDBDBD),
                  size: 24.sp,
                )
                : null,
        isDense: true, // Added this
        contentPadding:
            widget.contentPadding ??
            EdgeInsets.symmetric(horizontal: 10.w, vertical: 12.h),
        suffixIcon:
            widget.sufixIcon ??
            (widget.maxLines == 1
                ? widget.obscureText
                    ? Padding(
                      padding: EdgeInsets.only(right: 8.w),
                      child: IconButton(
                        icon: Icon(
                          obscureText
                              ? Icons.visibility_off_outlined
                              : Icons.visibility_outlined,
                          color: AppColors.kverylightDarkColor,
                        ),
                        onPressed: () {
                          setState(() {
                            obscureText = !obscureText;
                          });
                        },
                      ),
                    )
                    : interacted && errorText == null
                    ? Icon(Icons.check, color: AppColors.kPrimaryDarkColor)
                    : null
                : null),
      ),
      validator: widget.validator,
      autovalidateMode: AutovalidateMode.disabled,
      onChanged: widget.onChanged,
    );
  }

  Widget errorTextWidget() {
    final theme = Theme.of(context);
    final textTheme = theme.textTheme;
    final lowerUpper = widget.controller?.text.contains(
      RegExp(r'^(?=.*[a-z])(?=.*[A-Z]).+$'),
    );
    final number = widget.controller?.text.contains(RegExp(r'[0-9]'));
    final unique = widget.controller?.text.contains(
      RegExp(r'[!@#$%^&*(),.?":{}|<>]'),
    );
    final totalChar = widget.controller!.text.length >= 8;

    return widget.validation
        ? Column(
          children: [
            LinearProgressIndicator(
              borderRadius: BorderRadius.circular(8.r),
              value: _strength / 100,
              backgroundColor: AppColors.kseconadarylightColor,
              valueColor: AlwaysStoppedAnimation<Color>(
                _getColorForStrength(_strength),
              ),
            ),
            SizedBox(height: 5.h),
            PassWordValidation(
              passCheck: lowerUpper,
              requirementText: "One Uppercase [A-Z] and One lowercase [a-z]",
            ),
            PassWordValidation(
              passCheck: number,
              requirementText: "One numeric value [0-9]]",
            ),
            PassWordValidation(
              passCheck: unique,
              requirementText: "One special character [#, \$, % etc..]",
            ),
            PassWordValidation(
              passCheck: totalChar,
              requirementText: "8 characters minimum",
            ),
          ],
        )
        // : Container()
        : widget.showError
        ? errorText != null
            ? Row(
              children: [
                Icon(
                  Icons.error_outline_rounded,
                  size: 14,
                  color: AppColors.kPrimaryRedColor,
                ),
                const SizedBox(width: 5),
                Expanded(
                  child: Text(
                    errorText ?? "",
                    maxLines: 2,
                    style: textTheme.titleMedium!.copyWith(
                      color: AppColors.kPrimaryRedColor,
                      fontSize: 12.sp,
                    ),
                  ),
                ),
              ],
            )
            : SizedBox()
        : SizedBox();
  }

  Color _getColorForStrength(int strength) {
    if (strength < 50) {
      return Colors.red;
    } else if (strength < 80) {
      return Colors.orange;
    } else {
      return Colors.green;
    }
  }
}

class PassWordValidation extends StatelessWidget {
  final bool? passCheck;
  final String? requirementText;
  final IconData? activeIcon;
  final IconData? inActiveIcon;
  final Color? inActiveColor;
  final Color? activeColor;
  const PassWordValidation({
    super.key,
    @required this.passCheck,
    @required this.requirementText,
    this.inActiveIcon = Icons.circle,
    this.activeIcon = Icons.circle,
    this.inActiveColor = Colors.grey,
    this.activeColor = Colors.green,
  });
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textTheme = theme.textTheme;
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 3.5),
      child: Row(
        children: [
          passCheck!
              ? Icon(Icons.circle, size: 10, color: activeColor)
              : Icon(Icons.circle, size: 10, color: inActiveColor),
          SizedBox(width: 8.w),
          Text(
            requirementText!,
            style: textTheme.titleSmall?.copyWith(
              color: passCheck! ? activeColor : inActiveColor,
              fontSize: 10.sp,
            ),
          ),
        ],
      ),
    );
  }
}

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    super.key,
    this.width = double.infinity,
    this.height,
    this.fontSize = 16,
    this.labelText,
    this.isObscureText = false,
    this.initialValue,
    this.textInputType,
    this.controller,
    this.validator,
    this.color,
    this.prefixIcon,
    this.maxLength,
    this.onTap,
    this.onChanged,
    this.suffixIcon,
    this.isReadOnly = false,
    this.isRequired = false,
    this.maxLines = 1,
    this.helperText,
    this.textInputFormatterList,
    this.bottomMargin,
    this.textInputAction,
    this.hintText,
    this.contentPadding,
    this.isDisable = false,
    this.focusNode,
    TextStyle? helperStyle,
  });

  final double? width;
  final double? height;
  final double fontSize;
  final String? labelText;
  final bool isObscureText;
  final bool isReadOnly;
  final Color? color;
  final String? initialValue;
  final TextInputType? textInputType;
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final int? maxLength;
  final Function()? onTap;
  final void Function(String)? onChanged;
  final bool isRequired;
  final int maxLines;
  final String? helperText;
  final List<TextInputFormatter>? textInputFormatterList;
  final double? bottomMargin;
  final TextInputAction? textInputAction;
  final String? hintText;

  final EdgeInsets? contentPadding;
  final bool isDisable;
  final FocusNode? focusNode;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textTheme = theme.textTheme;
    return AbsorbPointer(
      absorbing: isDisable,
      child: Container(
        margin: EdgeInsets.only(bottom: bottomMargin ?? 20),
        width: width,
        height: height,
        child: TextFormField(
          selectionControls: MaterialTextSelectionControls(),
          focusNode: focusNode,
          scrollPadding: const EdgeInsets.all(0),
          textAlign: maxLength != null ? TextAlign.center : TextAlign.left,
          controller: controller,
          keyboardType: textInputType,
          obscureText: isObscureText,
          cursorColor: color,
          initialValue: initialValue,
          validator: validator,
          maxLength: maxLength,
          onChanged: onChanged,
          onTap: onTap,
          readOnly: isReadOnly,
          maxLines: maxLines,
          textInputAction: textInputAction,
          inputFormatters: textInputFormatterList,
          style:
              maxLength == 1
                  ? textTheme.bodyMedium!.copyWith(
                    color: color,
                    fontSize: fontSize,
                    fontWeight: FontWeight.w400,
                  )
                  : textTheme.bodyMedium!.copyWith(
                    fontSize: fontSize,
                    fontWeight: FontWeight.w400,
                  ),
          decoration: InputDecoration(
            hintText: hintText,
            errorStyle: textTheme.bodyMedium!.copyWith(
              inherit: true,
              fontSize: 12,
              color: AppColors.kPrimaryRedColor,
              // fontWeight: FontWeight.w400
            ),
            contentPadding:
                contentPadding ??
                EdgeInsets.symmetric(vertical: 8.h, horizontal: 20.w),
            counterText: "",
            fillColor: AppColors.backgroundColor,
            filled: true,
            prefixIcon: prefixIcon,
            suffixIcon: suffixIcon,
            errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8.r),
              borderSide: BorderSide(
                width: 1,
                color: AppColors.kPrimaryRedColor,
              ),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8.r),
              borderSide: BorderSide(color: AppColors.kseconadaryDarkColor),
            ),
            border: InputBorder.none,
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: AppColors.kseconadaryDarkColor),
              borderRadius: BorderRadius.circular(8.r),
            ),
            labelText:
                labelText != null
                    ? isRequired
                        ? "$labelText * "
                        : labelText
                    : null,
            alignLabelWithHint: true,
            labelStyle: textTheme.labelMedium,
          ),
        ),
      ),
    );
  }
}
