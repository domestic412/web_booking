import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';
import 'package:web_booking/screen/default/default_screen.dart';
import 'package:web_booking/screen/home/homepage_screen.dart';
import 'package:web_booking/screen/signup/view.dart';

class AppRoutes {
  static const defaultRoute = "/";
  static const SignInRoute = "/SignIn";
  static const AdminRoute = "/AdminDashboard";
  static const CheckContainer = "/CheckContainer";
  static final GoRouter router = GoRouter(routes: <GoRoute>[
    GoRoute(
      path: defaultRoute,
      builder: (BuildContext context, state) => DefaultScreen(),
    ),
    GoRoute(
      path: SignInRoute,
      builder: (BuildContext context, state) => const SignInPage(),
    ),
    GoRoute(
      path: AdminRoute,
      builder: (BuildContext context, state) => const HomePage(),
    ),
  ]);
  static String? _redirect(BuildContext context) {}
}
