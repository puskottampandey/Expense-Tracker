import 'package:expensetracker/core/app/update_wrapper.dart';
import 'package:expensetracker/core/config/env.dart';
import 'package:expensetracker/core/config/local_config.dart';
import 'package:expensetracker/core/route/app_router.dart';
import 'package:expensetracker/core/wrapper/multi_bloc_wrapper.dart';
import 'package:expensetracker/features/settings/presentation/bloc/language_cubit.dart';
import 'package:expensetracker/features/settings/presentation/bloc/theme_cubit.dart';
import 'package:expensetracker/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class App extends StatefulWidget {
  final Env env;

  const App({super.key, required this.env});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  @override
  Widget build(BuildContext context) {
    return MultipleBlocWrapper(
      child: ScreenUtilInit(
        designSize: const Size(360, 690),
        minTextAdapt: true,
        splitScreenMode: false,
        builder: (context, child) {
          return BlocBuilder<ThemeCubit, ThemeData>(
            builder: (context, theme) {
              return BlocBuilder<LanguageCubit, Locale>(
                builder: (context, locale) {
                  return MaterialApp.router(
                    debugShowCheckedModeBanner: false,
                    routerConfig: AppRouter.router,
                    theme: theme,
                    locale: locale,
                    localizationsDelegates: [
                      S.delegate,
                      GlobalMaterialLocalizations.delegate,
                      GlobalWidgetsLocalizations.delegate,
                      GlobalCupertinoLocalizations.delegate,
                    ],
                    supportedLocales: const [
                      LocalConfig.english,
                      LocalConfig.nepali,
                    ],
                    localeResolutionCallback: (locale, supportedLocales) {
                      for (var supportedLocale in supportedLocales) {
                        if (supportedLocale.languageCode ==
                            locale?.languageCode) {
                          return supportedLocale;
                        }
                      }
                      return supportedLocales.first;
                    },
                  );
                },
              );
            },
          );
        },
      ),
    );
  }
}
