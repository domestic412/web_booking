import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:web_booking/resources/localization_service.dart';
import 'package:web_booking/widgets/horizontal_scroll.dart';

import 'utils/getx_route.dart';

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

  WidgetsFlutterBinding.ensureInitialized();
  // await EasyLocalization.ensureInitialized();
  await GetStorage.init();

  runApp(
    MyApp(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
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
      translations: Languages(),
      locale: Locale('en', 'US'),
      fallbackLocale: Locale('en', 'US'),
      getPages: GetRoutes.router,
      defaultTransition: Transition.noTransition,
      builder: EasyLoading.init(),
      // transitionDuration: Duration(seconds: 0),
      // initialRoute: ,
    );
  }
}

//headingRowColor
// user_list_page
// special_policy_list_page
// request_list_page
// release_booking_list_page
// quality_list_page
// history_list_page
// container_stock_page
// booking_list_page
// approval_list_page

