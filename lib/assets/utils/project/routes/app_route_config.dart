import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';
import 'package:web_booking/page/default/default_page.dart';
import 'package:web_booking/page/login/signin_page.dart';
import 'package:web_booking/page/signup/signup_page.dart';


class AppRoutes {
  static const defaultRoute = "/";
  static const SignUpRoute = "/SignUp";
  static const SignInRoute = "/SignIn";
  static const TrackingRoute = "/Tracking";

  static final GoRouter router = GoRouter(routes: <GoRoute>[
    GoRoute(
      path: defaultRoute,
      builder: (BuildContext context, state) => DefaultPage(),
    ),
    GoRoute(
      path: SignUpRoute,
      builder: (BuildContext context, state) => SignUpPage(),
    ),
    GoRoute(
      path: SignInRoute,
      builder: (BuildContext context, state) => SignInPage(),
    ),
    // GoRoute(
    //   path: TrackingRoute,
    //   builder: (BuildContext context, state) => TrackingPage(),
    // ),
  ]);
  // static String? _redirect(BuildContext context) {
  //   return null;
  // }
}
