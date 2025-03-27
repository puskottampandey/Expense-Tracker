import 'package:expensetracker/core/app/update_wrapper.dart';
import 'package:expensetracker/core/config/env.dart';
import 'package:expensetracker/core/config/local_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class App extends StatefulWidget {
  final Env env;

  const App({super.key, required this.env});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return UpdateWrapper(
      child: ScreenUtilInit(
        designSize: const Size(360, 690),
        minTextAdapt: true,
        splitScreenMode: false,
        builder: (context, child) {
          return MaterialApp.router(
            debugShowCheckedModeBanner: false,
            supportedLocales: const [LocalConfig.english, LocalConfig.nepali],
            localeResolutionCallback: (locale, supportedLocales) {
              for (var supportedLocale in supportedLocales) {
                if (supportedLocale.languageCode == locale?.languageCode) {
                  return supportedLocale;
                }
              }
              return supportedLocales.first;
            },

            // navigatorKey: NavigationService.navigationKey,
            // localizationsDelegates: [
            //   ...context.localizationDelegates,
            // ],
            // supportedLocales: context.supportedLocales,
            // theme: CustomTheme.lightTheme,
            // title: env.environment.appTitle,
            // initialRoute: Routes.root,
            // onGenerateRoute: (settings) {
            //   if (settings.name == Routes.root) {
            //     return RouteGenerator.generateRoute(
            //       RouteSettings(
            //         name: settings.name,
            //         arguments: receivedAction,
            //       ),
            //     );
            //   }
            //   return RouteGenerator.generateRoute(settings);
            // },
            // ),
          );
        },
        // child: child,
      ),
    );
  }
}
// void main() {
//   runApp(
//     const ProviderScope(
//       child: MyApp(),
//     ),
//   );
// }

// class MyApp extends ConsumerWidget {
//   const MyApp({super.key});
//   @override
//   Widget build(BuildContext context, WidgetRef ref) {
//     ref.watch(networkControllerProvider);
//     return ScreenUtilInit(
//         designSize: const Size(360, 690),
//         minTextAdapt: true,
//         splitScreenMode: true,
//         builder: (_, child) {
//           return MaterialApp.router(
//             debugShowCheckedModeBanner: false,
//             routerConfig: router,
//           );
//         });
//   }
// }
