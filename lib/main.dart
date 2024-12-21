import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:web_booking/constants/variable.dart';
import 'package:web_booking/resources/localization_service.dart';
import 'package:web_booking/widgets/horizontal_scroll.dart';
import 'dart:html';

import 'utils/getx_route.dart';

final navigatorKey = GlobalKey<NavigatorState>();

// function to lisen to background changes
// Future _firebaseBackgroundMessage(RemoteMessage message) async {
//   if (message.notification != null) {
//     print("Some notification Received");
//   }
// }

// to handle notification on foreground on web platform
// void showNotification({required String title, required String body}) {
//   showDialog(
//     context: navigatorKey.currentContext!,
//     builder: (context) => AlertDialog(
//       title: Text(title),
//       content: Text(body),
//       actions: [
//         TextButton(
//             onPressed: () {
//               Navigator.pop(context);
//             },
//             child: Text("Ok"))
//       ],
//     ),
//   );
// }

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
  // await Firebase.initializeApp(
  //   options: DefaultFirebaseOptions.currentPlatform,
  // );
  await GetStorage.init();
  box.write(hostName, getWebHostname());
  // // on background notification tapped
  // FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
  //   if (message.notification != null) {
  //     print("Background Notification Tapped");
  //     navigatorKey.currentState!.pushNamed("/message", arguments: message);
  //   }
  // });
  // PushNotifications.init();
  // if (!kIsWeb) {
  //   PushNotifications.localNotiInit();
  // }
  // // Listen to background notifications
  // FirebaseMessaging.onBackgroundMessage(_firebaseBackgroundMessage);

  // // to handle foreground notifications
  // FirebaseMessaging.onMessage.listen((RemoteMessage message) {
  //   String payloadData = jsonEncode(message.data);
  //   print("Got a message in foreground");
  //   if (message.notification != null) {
  //     if (kIsWeb) {
  //       showNotification(
  //           title: message.notification!.title!,
  //           body: message.notification!.body!);
  //     } else {
  //       PushNotifications.showSimpleNotification(
  //           title: message.notification!.title!,
  //           body: message.notification!.body!,
  //           payload: payloadData);
  //     }
  //   }
  // });

  // // for handling in terminated state
  // final RemoteMessage? message =
  //     await FirebaseMessaging.instance.getInitialMessage();

  // if (message != null) {
  //   print("Launched from terminated state");
  //   Future.delayed(Duration(seconds: 1), () {
  //     navigatorKey.currentState!.pushNamed("/message", arguments: message);
  //   });
  // }

  runApp(
    const MyApp(),
  );
}

String getWebHostname() {
  return window.location.hostname!;
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  Widget build(BuildContext context) {
    // printHostname();
    return GetMaterialApp(
      theme: ThemeData(
        useMaterial3: false,
      ),
      title: 'HAI AN Service',
      debugShowCheckedModeBanner: false,
      scrollBehavior: CustomHorizontalScroll(),
      translations: Languages(),
      locale: Locale('en', 'US'),
      fallbackLocale: Locale('en', 'US'),
      getPages: GetRoutes.router,
      defaultTransition: Transition.noTransition,
      builder: EasyLoading.init(),
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

