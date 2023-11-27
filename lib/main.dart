import 'dart:io';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:web_booking/utils/app_route_config.dart';
import 'package:web_booking/widgets/horizontal_scroll.dart';

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}

void main() async {
  HttpOverrides.global = MyHttpOverrides();

  await Hive.initFlutter();

  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();

  runApp(EasyLocalization(
    startLocale: Locale('vi', 'VN'),
    // startLocale: Locale('en', 'EN'),
    supportedLocales: const [
      Locale('vi', 'VN'),
      Locale('en', 'EN'),
    ],
    saveLocale: false,
    path: "lib/resources/langs",
    child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
        title: 'HAI AN Service',
        // theme: ThemeData(
        // textTheme:
        //     GoogleFonts.montserratTextTheme(Theme.of(context).textTheme),
        // textButtonTheme: TextButtonThemeData(
        //     style: TextButton.styleFrom(primary: Colors.blueGrey)),
        // elevatedButtonTheme: ElevatedButtonThemeData(
        //     style: ButtonStyle(
        //         backgroundColor:
        //             MaterialStateProperty.all<Color>(Color(0xFF3D45EE)))),
        // colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        // ),
        debugShowCheckedModeBanner: false,
        scrollBehavior: CustomHorizontalScroll(),
        localizationsDelegates: context.localizationDelegates,
        supportedLocales: context.supportedLocales,
        locale: context.locale,
        routerConfig: AppRoutes.router //use MaterialApp.router
        // getPages: GetRoutes.router,
        );
  }
}
