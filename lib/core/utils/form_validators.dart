import 'dart:io';

import 'package:expensetracker/core/navigation/navigation_service.dart';
import 'package:expensetracker/core/utils/regex.dart';
import 'package:expensetracker/generated/l10n.dart';

class FormValidator {
  static String? validateEmail(String? val, [bool supportEmpty = false]) {
    if (supportEmpty && (val == null || val.isEmpty)) {
      return null;
    } else if (val == null) {
      return "Email Required";
    } else if (val.isEmpty) {
      return "Email Required";
    } else if (Regex.emailRegex.hasMatch(val)) {
      return null;
    } else {
      return "Email Required";
    }
  }

  static String? validateFieldNotEmpty(String? val, String fieldName) {
    if (val == null) {
      return fieldName;
    } else if (val.isEmpty) {
      return fieldName;
    } else {
      return null;
    }
  }

  static String? validatePhoneNumber([String? val, bool supportEmpty = false]) {
    if (supportEmpty && (val == null || val.isEmpty)) {
      return null;
    } else if (val == null) {
      return "Phone Number";
    } else if (val.isEmpty) {
      return "Phone Number";
    } else if (val.length != 10 || !Regex.phoneNumberRegex.hasMatch(val)) {
      return "Phone Number";
    } else {
      return null;
    }
  }

  static String? validatePassword(
    String? val, {
    String? label,
    String? oldPassword,
  }) {
    if (val == null) {
      return "Password";
    } else if (val.isEmpty) {
      return "Password";
    }

    if (oldPassword != null && val == oldPassword) {
      return "Current Password and New Password should be different";
    } else if (Regex.passwordRegex.hasMatch(val)) {
      return null;
    } else {
      return "password is not stro";
    }
  }

  // static validateNepaliText(String? value, String fieldName,
  //     [bool supportEmpty = false]) {
  //   if (supportEmpty && (value == null || value.isEmpty)) {
  //     return null;
  //   } else if (value == null) {
  //     return LocaleKeys.fieldCannotBeEmpty.tr(args: [fieldName]);
  //   } else if (value.isEmpty) {
  //     return LocaleKeys.fieldCannotBeEmpty.tr(args: [fieldName]);
  //   } else if (!Regex.nepaliTextOnlyRegex.hasMatch(value)) {
  //     return null;
  //   } else {
  //     return LocaleKeys.shouldBeNepali.tr(args: [fieldName]);
  //   }
  // }

  static String? validateConfirmPassword(
    String? val,
    String? newPassword, {
    String? oldPassword,
    String? label,
  }) {
    if (val == null) {
      return "Password";
    } else if (val.isEmpty) {
      return "Password";
    } else if (Regex.passwordRegex.hasMatch(val)) {
      if (oldPassword != null && val == oldPassword) {
        return "Password";
      }
      if (val == newPassword) {
        return null;
      } else {
        return "Password";
      }
    } else {
      return "Password";
    }
  }

  // static String? validateFullName(String? val, String fieldName) {
  //   if (val == null) {
  //     return LocaleKeys.fieldCannotBeEmpty.tr(args: [fieldName]);
  //   } else if (val.isEmpty) {
  //     return LocaleKeys.fieldCannotBeEmpty.tr(args: [fieldName]);
  //   } else if (val.contains(" ")) {
  //     return null;
  //   } else {
  //     return LocaleKeys.enterValid.tr(args: [fieldName]);
  //   }
  // }

  // static String? validateCustomArea(String? val, String fieldName) {
  //   if (val == null) {
  //     return LocaleKeys.fieldCannotBeEmpty.tr(args: [fieldName]);
  //   } else if (val.isEmpty) {
  //     return LocaleKeys.fieldCannotBeEmpty.tr(args: [fieldName]);
  //   } else if (Regex.customAreaRegex.hasMatch(val)) {
  //     return null;
  //   } else {
  //     return LocaleKeys.pleaseEnterValidField.tr(args: [fieldName]);
  //   }
  // }

  // static String? validateDhurField(String? val, String fieldName) {
  //   if (val == null) {
  //     return LocaleKeys.fieldCannotBeEmpty.tr(args: [fieldName]);
  //   } else if (val.isEmpty) {
  //     return LocaleKeys.fieldCannotBeEmpty.tr(args: [fieldName]);
  //   }

  //   int? _temp = int.tryParse(val) ?? 0;

  //   if (_temp > 20) {
  //     return "$fieldName ${LocaleKeys.exceedMaxLimit.tr()}";
  //   } else {
  //     return null;
  //   }
  // }

  // static String? validateDiscountPercentage(String? val, String fieldName,
  //     [bool supportEmpty = false]) {
  //   if (supportEmpty && (val == null || val.isEmpty)) {
  //     return null;
  //   } else if (val == null) {
  //     return LocaleKeys.fieldCannotBeEmpty.tr(args: [fieldName]);
  //   } else if (val.isEmpty) {
  //     return LocaleKeys.fieldCannotBeEmpty.tr(args: [fieldName]);
  //   }
  //   var temp = double.tryParse(val);

  //   if (temp != null && temp > 100) {
  //     return LocaleKeys.discountEcommerceValidation.tr();
  //   } else {
  //     return null;
  //   }
  // }

  // static String? fileValidator(
  //     {required bool isRequired,
  //     File? file,
  //     required String fieldName,
  //     String? errorMessage,
  //     var size}) {
  //   if (!isRequired && file == null) {
  //     return null;
  //   } else if (file != null) {
  //     size ??= 3145728;
  //     if (file.lengthSync() > size) {
  //       return "Ex";
  //     }
  //     return null;
  //   } else {
  //     return errorMessage ?? LocaleKeys.thisFieldCannotBeEmpty.tr();
  //   }
  // }

  // static String? validateTableData(List<Map<String, String>> tableData) {
  //   if (tableData.isNotEmpty) {
  //     return null;
  //   } else {
  //     return LocaleKeys.tableDataRequired.tr();
  //   }
  // }
}
