import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';
import 'package:web_booking/page/booking/booking_screen.dart';
import 'package:web_booking/page/default/default_page.dart';
import 'package:web_booking/page/signin/signin_page.dart';
import 'package:web_booking/page/signup/signup_page.dart';
import 'package:web_booking/page/tracking/tracking_page.dart';
import 'package:web_booking/screen/admin/admin_page.dart';
import 'package:web_booking/screen/member/member_screen.dart';
import 'package:web_booking/screen/user/user_page.dart';



class AppRoutes {
  static const defaultRoute = "/";
  static const SignUpRoute = "/SignUp";
  static const SignInRoute = "/SignIn";
  static const TrackingRoute = "/Tracking";
  static const TestRoute = "/Test";
  static const BookingRoute = "/Booking";
  static const AdminRoute = "/Admin";
  static const UserRoute = "/User";
  static const MemberRoute = "/MemberDashboard";

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
    GoRoute(
      path: BookingRoute,
      builder: (BuildContext context, state) => BookingPage(),
    ),
    GoRoute(
      path: TrackingRoute,
      builder: (BuildContext context, state) => TrackingPage(),
    ),
    GoRoute(
      path: AdminRoute,
      builder: (BuildContext context, state) => AdminPage(),
    ),
    GoRoute(
      path: UserRoute,
      builder: (BuildContext context, state) => UserPage(),
    ),
    GoRoute(
      path: MemberRoute,
      builder: (BuildContext context, state) => MemberPage(),
    ),
  ]);
}
