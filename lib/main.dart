import 'dart:async';
import 'package:expensetracker/core/config/env.dart';
import 'package:expensetracker/core/utils/log.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'core/app/app_prod.dart';

void main() async {
  runZonedGuarded(
    () async {
      WidgetsFlutterBinding.ensureInitialized();
      await SystemChrome.setPreferredOrientations([
        DeviceOrientation.portraitUp,
      ]).then((_) {
        runApp(App(env: EnvValue.production));
      });
    },
    (e, s) {
      Log.e(e);
      Log.d(s);
    },
  );
}
