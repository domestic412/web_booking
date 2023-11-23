import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';
import 'package:web_booking/page/booking/booking_page.dart';
import 'package:web_booking/page/booking/select_depo/list_depo.dart';
import 'package:web_booking/page/default/default_page.dart';
import 'package:web_booking/page/signin/signin_page.dart';
import 'package:web_booking/page/signup/signup_page.dart';
import 'package:web_booking/page/tracking/tracking_page.dart';
import 'package:web_booking/screen/check_container/check_container_page.dart';
import 'package:web_booking/screen/container_stock/container_stock_page.dart';
import 'package:web_booking/screen/container_stock/import_file_page.dart';
import 'package:web_booking/screen/home/homepage_screen.dart';
import 'package:web_booking/screen/approval_list/detail_approval/detail_approval_page.dart';
import 'package:web_booking/screen/approval_list/list_approval_page.dart';
import 'package:web_booking/screen/history_list/list_history_page.dart';
import 'package:web_booking/screen/list_quality/CUD_quality/CUD_quality_page.dart';
import 'package:web_booking/screen/list_quality/list_quality_page.dart';
import 'package:web_booking/screen/list_request/detail_request/detail_request_page.dart';
import 'package:web_booking/screen/list_request/list_request_page.dart';
import 'package:web_booking/screen/list_special_policy/CUD_special_policy/CUD_special_policy.dart';
import 'package:web_booking/screen/list_special_policy/list_special_policy_page.dart';
import 'package:web_booking/screen/request/request_page.dart';
import 'package:web_booking/screen/tracking1/tracking_page1.dart';

class AppRoutes {
  static const defaultRoute = "/";
  static const SignUpRoute = "/SignUp";
  static const SignInRoute = "/SignIn";
  static const TrackingRoute = "/Tracking";
  static const TestRoute = "/Test";
  static const BookingRoute = "/Booking";
  static const DepoRoute = "$BookingRoute/Depo";
  static const HomeRoute = "/Home";
  static const ListApproval = "$HomeRoute/ListApproval";
  static const DetailApproval = "$HomeRoute/$ListApproval/DetailApproval";
  static const ListRequest = "$HomeRoute/ListRequest";
  static const DetailRequest = "$HomeRoute/$ListRequest/DetailRequest";
  static const SendRequest = "$HomeRoute/Request";
  static const CheckContainer = "$HomeRoute/Check";
  static const Tracking = "$HomeRoute/Tracking";
  static const ListQuality = "$HomeRoute/Quality";
  static const CUDQuality = "$HomeRoute/$ListQuality/DUC";
  static const ListSpecialPolicy = "$HomeRoute/Policy";
  static const CUDPolicy = "$HomeRoute/$ListSpecialPolicy/DUC";
  static const ListHistory = "$HomeRoute/History";
  static const ContainerStock = "$HomeRoute/Stock";
  static const ImportStock = "$HomeRoute/$ContainerStock/Import";

  // static const MemberRoute = "/MemberDashboard";

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
      path: DepoRoute,
      builder: (BuildContext context, state) => DepoPage(),
    ),
    GoRoute(
      path: TrackingRoute,
      builder: (BuildContext context, state) => TrackingPage(),
    ),
    GoRoute(
      path: HomeRoute,
      builder: (BuildContext context, state) => HomePage(),
    ),
    GoRoute(
      path: ListApproval,
      builder: (BuildContext context, state) => ListApprovalPage(),
    ),
    GoRoute(
      path: DetailApproval,
      builder: (BuildContext context, state) => DetailApprovalPage(),
    ),
    GoRoute(
      path: ListRequest,
      builder: (BuildContext context, state) => ListRequestPage(),
    ),
    GoRoute(
      path: DetailRequest,
      builder: (BuildContext context, state) => DetailRequestPage(),
    ),
    GoRoute(
      path: SendRequest,
      builder: (BuildContext context, state) => SendRequestPage(),
    ),
    GoRoute(
      path: CheckContainer,
      builder: (BuildContext context, state) => CheckContainerPage(),
    ),
    GoRoute(
      path: Tracking,
      builder: (BuildContext context, state) => Tracking1Page(),
    ),
    GoRoute(
      path: ListQuality,
      builder: (BuildContext context, state) => ListQualityPage(),
    ),
    GoRoute(
      path: CUDQuality,
      builder: (BuildContext context, state) => CUD_QualityPage(),
    ),
    GoRoute(
      path: ListSpecialPolicy,
      builder: (BuildContext context, state) => ListSpecialPolicyPage(),
    ),
    GoRoute(
      path: CUDPolicy,
      builder: (BuildContext context, state) => CUD_SpecialPolicyPage(),
    ),
    GoRoute(
      path: ListHistory,
      builder: (BuildContext context, state) => ListHistoryPage(),
    ),
    GoRoute(
      path: ContainerStock,
      builder: (BuildContext context, state) => ContainerStockPage(),
    ),
    GoRoute(
      path: ImportStock,
      builder: (BuildContext context, state) => ImportStockPage(),
    ),
    // GoRoute(
    //   path: MemberRoute,
    //   builder: (BuildContext context, state) => MemberPage(),
    // ),
  ]);
}
