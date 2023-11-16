// import 'package:flutter/widgets.dart';
// import 'package:get/get.dart';
// import 'package:go_router/go_router.dart';
// import 'package:web_booking/page/booking/booking_page.dart';
// import 'package:web_booking/page/default/default_page.dart';
// import 'package:web_booking/page/signin/signin_page.dart';
// import 'package:web_booking/page/signup/signup_page.dart';
// import 'package:web_booking/page/tracking/tracking_page.dart';
// import 'package:web_booking/screen/check_container/check_container_page.dart';
// import 'package:web_booking/screen/container_stock/container_stock_page.dart';
// import 'package:web_booking/screen/container_stock/import_file_page.dart';
// import 'package:web_booking/screen/home/homepage_screen.dart';
// import 'package:web_booking/screen/list_approval/detail_approval/detail_approval_page.dart';
// import 'package:web_booking/screen/list_approval/list_approval_page.dart';
// import 'package:web_booking/screen/list_history/list_history_page.dart';
// import 'package:web_booking/screen/list_quality/CUD_quality/CUD_quality_page.dart';
// import 'package:web_booking/screen/list_quality/list_quality_page.dart';
// import 'package:web_booking/screen/list_request/detail_request/detail_request.dart';
// import 'package:web_booking/screen/list_request/list_request_page.dart';
// import 'package:web_booking/screen/list_special_policy/CUD_special_policy/CUD_special_policy.dart';
// import 'package:web_booking/screen/list_special_policy/list_special_policy_page.dart';
// import 'package:web_booking/screen/request/request_page.dart';
// import 'package:web_booking/screen/tracking1/tracking_page1.dart';

// class GetRoutes {
//   static const defaultRoute = "/";
//   static const SignUpRoute = "/SignUp";
//   static const SignInRoute = "/SignIn";
//   static const TrackingRoute = "/Tracking";
//   static const TestRoute = "/Test";
//   static const BookingRoute = "/Booking";
//   static const HomeRoute = "/Home";
//   static const ListApproval = "$HomeRoute/ListApproval";
//   static const DetailApproval = "$HomeRoute/$ListApproval/DetailApproval";
//   static const ListRequest = "$HomeRoute/ListRequest";
//   static const DetailRequest = "$HomeRoute/$ListRequest/DetailRequest";
//   static const SendRequest = "$HomeRoute/Request";
//   static const CheckContainer = "$HomeRoute/Check";
//   static const Tracking = "$HomeRoute/Tracking";
//   static const ListQuality = "$HomeRoute/Quality";
//   static const CUDQuality = "$HomeRoute/$ListQuality/DUC";
//   static const ListSpecialPolicy = "$HomeRoute/Policy";
//   static const CUDPolicy = "$HomeRoute/$ListSpecialPolicy/DUC";
//   static const ListHistory = "$HomeRoute/History";
//   static const ContainerStock = "$HomeRoute/Stock";
//   static const ImportStock = "$HomeRoute/$ContainerStock/Import";

//   // static const MemberRoute = "/MemberDashboard";

//   static final List<GetPage> router = <GetPage>[
//     GetPage(
//       name: defaultRoute,
//       page: () => DefaultPage(),
//     ),
//     GetPage(
//       name: SignUpRoute,
//       page: () => SignUpPage(),
//     ),
//     GetPage(
//       name: SignInRoute,
//       page: () => SignInPage(),
//     ),
//     GetPage(
//       name: BookingRoute,
//       page: () => BookingPage(),
//     ),
//     GetPage(
//       name: TrackingRoute,
//       page: () => TrackingPage(),
//     ),
//     GetPage(
//       name: HomeRoute,
//       page: () => HomePage(),
//     ),
//     GetPage(
//       name: ListApproval,
//       page: () => ListApprovalPage(),
//     ),
//     GetPage(
//       name: DetailApproval,
//       page: () => DetailApprovalPage(),
//     ),
//     GetPage(
//       name: ListRequest,
//       page: () => ListRequestPage(),
//     ),
//     GetPage(
//       name: DetailRequest,
//       page: () => DetailRequestPage(),
//     ),
//     GetPage(
//       name: SendRequest,
//       page: () => SendRequestPage(),
//     ),
//     GetPage(
//       name: CheckContainer,
//       page: () => CheckContainerPage(),
//     ),
//     GetPage(
//       name: Tracking,
//       page: () => Tracking1Page(),
//     ),
//     GetPage(
//       name: ListQuality,
//       page: () => ListQualityPage(),
//     ),
//     GetPage(
//       name: CUDQuality,
//       page: () => CUD_QualityPage(),
//     ),
//     GetPage(
//       name: ListSpecialPolicy,
//       page: () => ListSpecialPolicyPage(),
//     ),
//     GetPage(
//       name: CUDPolicy,
//       page: () => CUD_SpecialPolicyPage(),
//     ),
//     GetPage(
//       name: ListHistory,
//       page: () => ListHistoryPage(),
//     ),
//     GetPage(
//       name: ContainerStock,
//       page: () => ContainerStockPage(),
//     ),
//     GetPage(
//       name: ImportStock,
//       page: () => ImportStockPage(),
//     ),
//     // GetPage(
//     //   name: MemberRoute,
//     //   page: () => MemberPage(),
//     // ),
//   ];
// }
