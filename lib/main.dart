import 'dart:async';
import 'package:expensetracker/core/config/env.dart';
import 'package:expensetracker/core/app/app_dev.dart';
import 'package:expensetracker/core/utils/log.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() async {
  runZonedGuarded(
    () async {
      WidgetsFlutterBinding.ensureInitialized();
      SystemChrome.setPreferredOrientations([
        DeviceOrientation.portraitUp,
      ]).then((_) {
        runApp(App(env: EnvValue.development));
      });
    },
    (e, s) {
      Log.e(e);
      Log.d(s);
    },
  );
}
