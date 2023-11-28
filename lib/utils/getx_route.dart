import 'package:get/get.dart';
import 'package:web_booking/page/booking/booking_page.dart';
import 'package:web_booking/page/default/default_page.dart';
import 'package:web_booking/page/signin/signin_page.dart';
import 'package:web_booking/page/signup/signup_page.dart';
import 'package:web_booking/page/tracking/tracking_page.dart';
import 'package:web_booking/screen/approval_list/approval_list_page.dart';
import 'package:web_booking/screen/approval_list/detail_approval/detail_approval_page.dart';
import 'package:web_booking/screen/checking_combine/checking_combine_page.dart';
import 'package:web_booking/screen/container_stock/container_stock_page.dart';
import 'package:web_booking/screen/container_stock/import_file_page.dart';
import 'package:web_booking/screen/history_list/history_list_page.dart';
import 'package:web_booking/screen/home/homepage_screen.dart';
import 'package:web_booking/screen/quality_list/CUD_quality/CUD_quality_page.dart';
import 'package:web_booking/screen/quality_list/quality_list_page.dart';
import 'package:web_booking/screen/request/request_page.dart';
import 'package:web_booking/screen/request_list/detail_request/detail_request_page.dart';
import 'package:web_booking/screen/request_list/request_list_page.dart';
import 'package:web_booking/screen/special_policy_list/CUD_special_policy/CUD_special_policy.dart';
import 'package:web_booking/screen/special_policy_list/special_policy_list_page.dart';
import 'package:web_booking/screen/tracking1/tracking_page1.dart';
import 'package:web_booking/screen/user_list/user_list_page.dart';

class GetRoutes {
  static const defaultRoute = "/";
  static const SignUp = "/SignUp";
  static const SignIn = "/SignIn";
  static const Tracking = "/Tracking";
  static const Test = "/Test";
  static const Booking = "/Booking";
  static const Home = "/Home";
  static const UserList = "$Home/UserList";
  static const ApprovalList = "$Home/ApprovalList";
  static const DetailApproval = "$Home/$ApprovalList/DetailApproval";
  static const RequestList = "$Home/RequesList";
  static const DetailRequest = "$Home/$RequestList/DetailRequest";
  static const SendRequest = "$Home/Request";
  static const CheckingCombine = "$Home/CheckingCombine";
  static const Tracking1 = "$Home/Tracking";
  static const QualityList = "$Home/QualityList";
  static const CUDQuality = "$Home/$QualityList/CUD";
  static const SpecialPolicyList = "$Home/PolicyList";
  static const CUDPolicy = "$Home/$SpecialPolicyList/CUD";
  static const HistoryList = "$Home/HistoryList";
  static const ContainerStock = "$Home/Stock";
  static const ImportStock = "$Home/$ContainerStock/Import";

  // static const MemberRoute = "/MemberDashboard";

  static final List<GetPage> router = <GetPage>[
    GetPage(
      name: defaultRoute,
      page: () => DefaultPage(),
    ),
    GetPage(
      name: SignUp,
      page: () => SignUpPage(),
    ),
    GetPage(
      name: SignIn,
      page: () => SignInPage(),
    ),
    GetPage(
      name: Booking,
      page: () => BookingPage(),
    ),
    GetPage(
      name: Tracking,
      page: () => TrackingPage(),
    ),
    GetPage(
      name: Home,
      page: () => HomePage(),
    ),
    GetPage(
      name: UserList,
      page: () => UserListPage(),
    ),
    GetPage(
      name: ApprovalList,
      page: () => ApprovalListPage(),
    ),
    GetPage(
      name: DetailApproval,
      page: () => DetailApprovalPage(),
    ),
    GetPage(
      name: RequestList,
      page: () => RequestListPage(),
    ),
    GetPage(
      name: DetailRequest,
      page: () => DetailRequestPage(),
    ),
    GetPage(
      name: SendRequest,
      page: () => SendRequestPage(),
    ),
    GetPage(
      name: CheckingCombine,
      page: () => CheckingCombinePage(),
    ),
    GetPage(
      name: Tracking1,
      page: () => Tracking1Page(),
    ),
    GetPage(
      name: QualityList,
      page: () => QualityListPage(),
    ),
    GetPage(
      name: CUDQuality,
      page: () => CUD_QualityPage(),
    ),
    GetPage(
      name: SpecialPolicyList,
      page: () => SpecialPolicyListPage(),
    ),
    GetPage(
      name: CUDPolicy,
      page: () => CUD_SpecialPolicyPage(),
    ),
    GetPage(
      name: HistoryList,
      page: () => HistoryListPage(),
    ),
    GetPage(
      name: ContainerStock,
      page: () => ContainerStockPage(),
    ),
    GetPage(
      name: ImportStock,
      page: () => ImportStockPage(),
    ),
    // GetPage(
    //   name: MemberRoute,
    //   page: () => MemberPage(),
    // ),
  ];
}
