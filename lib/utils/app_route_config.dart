import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';
import 'package:web_booking/page/booking/booking_page.dart';
import 'package:web_booking/page/booking/select_depo/depo_list.dart';
import 'package:web_booking/page/default/default_page.dart';
import 'package:web_booking/page/signin/signin_page.dart';
import 'package:web_booking/page/signup/signup_page.dart';
import 'package:web_booking/page/tracking/tracking_page.dart';
import 'package:web_booking/screen/checking_combine/checking_combine_page.dart';
import 'package:web_booking/screen/container_stock/container_stock_page.dart';
import 'package:web_booking/screen/container_stock/import_file_page.dart';
import 'package:web_booking/screen/home/homepage_screen.dart';
import 'package:web_booking/screen/approval_list/detail_approval/detail_approval_page.dart';
import 'package:web_booking/screen/approval_list/approval_list_page.dart';
import 'package:web_booking/screen/history_list/history_list_page.dart';
import 'package:web_booking/screen/quality_list/CUD_quality/CUD_quality_page.dart';
import 'package:web_booking/screen/quality_list/quality_list_page.dart';
import 'package:web_booking/screen/request_list/detail_request/detail_request_page.dart';
import 'package:web_booking/screen/request_list/request_list_page.dart';
import 'package:web_booking/screen/special_policy_list/CUD_special_policy/CUD_special_policy.dart';
import 'package:web_booking/screen/special_policy_list/special_policy_list_page.dart';
import 'package:web_booking/screen/request/request_page.dart';
import 'package:web_booking/screen/tracking1/tracking_page1.dart';

class AppRoutes {
  static const defaultRoute = "/";
  static const signUpRoute = "/signUp";
  static const signInRoute = "/signIn";
  static const trackingRoute = "/tracking";
  static const testRoute = "/est";
  static const bookingRoute = "/booking";
  static const depoRoute = "$bookingRoute/depo";
  static const homeRoute = "/home";
  static const approvalList = "$homeRoute/approvalList";
  static const detailApproval = "$homeRoute/$approvalList/detailApproval";
  static const requestList = "$homeRoute/requestList";
  static const detailRequest = "$homeRoute/$requestList/detailRequest";
  static const sendRequest = "$homeRoute/request";
  static const checkingCombine = "$homeRoute/checkingCombine";
  static const tracking = "$homeRoute/tracking";
  static const qualityList = "$homeRoute/quality";
  static const CUDQuality = "$homeRoute/$qualityList/CUD";
  static const specialPolicyList = "$homeRoute/policy";
  static const CUDPolicy = "$homeRoute/$specialPolicyList/CUD";
  static const historyList = "$homeRoute/history";
  static const containerStock = "$homeRoute/stock";
  static const importStock = "$homeRoute/$containerStock/import";

  // static const MemberRoute = "/MemberDashboard";

  static final GoRouter router = GoRouter(routes: <GoRoute>[
    GoRoute(
      path: defaultRoute,
      builder: (BuildContext context, state) => DefaultPage(),
    ),
    GoRoute(
      path: signUpRoute,
      builder: (BuildContext context, state) => SignUpPage(),
    ),
    GoRoute(
      path: signInRoute,
      builder: (BuildContext context, state) => SignInPage(),
    ),
    GoRoute(
      path: bookingRoute,
      builder: (BuildContext context, state) => BookingPage(),
    ),
    GoRoute(
      path: depoRoute,
      builder: (BuildContext context, state) => DepoPage(),
    ),
    GoRoute(
      path: trackingRoute,
      builder: (BuildContext context, state) => TrackingPage(),
    ),
    GoRoute(
      path: homeRoute,
      builder: (BuildContext context, state) => HomePage(),
    ),
    GoRoute(
      path: approvalList,
      builder: (BuildContext context, state) => ApprovalListPage(),
    ),
    GoRoute(
      path: detailApproval,
      builder: (BuildContext context, state) => DetailApprovalPage(),
    ),
    GoRoute(
      path: requestList,
      builder: (BuildContext context, state) => RequestListPage(),
    ),
    GoRoute(
      path: detailRequest,
      builder: (BuildContext context, state) => DetailRequestPage(),
    ),
    GoRoute(
      path: sendRequest,
      builder: (BuildContext context, state) => SendRequestPage(),
    ),
    GoRoute(
      path: checkingCombine,
      builder: (BuildContext context, state) => CheckingCombinePage(),
    ),
    GoRoute(
      path: tracking,
      builder: (BuildContext context, state) => Tracking1Page(),
    ),
    GoRoute(
      path: qualityList,
      builder: (BuildContext context, state) => QualityListPage(),
    ),
    GoRoute(
      path: CUDQuality,
      builder: (BuildContext context, state) => CUD_QualityPage(),
    ),
    GoRoute(
      path: specialPolicyList,
      builder: (BuildContext context, state) => SpecialPolicyListPage(),
    ),
    GoRoute(
      path: CUDPolicy,
      builder: (BuildContext context, state) => CUD_SpecialPolicyPage(),
    ),
    GoRoute(
      path: historyList,
      builder: (BuildContext context, state) => HistoryListPage(),
    ),
    GoRoute(
      path: containerStock,
      builder: (BuildContext context, state) => ContainerStockPage(),
    ),
    GoRoute(
      path: importStock,
      builder: (BuildContext context, state) => ImportStockPage(),
    ),
    // GoRoute(
    //   path: MemberRoute,
    //   builder: (BuildContext context, state) => MemberPage(),
    // ),
  ]);
}
