import 'package:get/get.dart';
import 'package:web_booking/page/booking/booking_list/booking_list_page.dart';
// import 'package:web_booking/page/booking/bookingNote/bookingNote_page.dart';
import 'package:web_booking/page/booking/booking/booking_page.dart';
import 'package:web_booking/page/booking/booking/create_info_booking/create_booking_page.dart';
import 'package:web_booking/page/default/default_page.dart';
import 'package:web_booking/page/new_signin/newsignin_page.dart';
import 'package:web_booking/page/signin/signin_page.dart';
import 'package:web_booking/page/signup/signup_page.dart';
import 'package:web_booking/page/tracking/tracking_page.dart';
import 'package:web_booking/screen/home/homepage_screen.dart';

class GetRoutes {
  static const defaultRoute = "/";
  static const NewSignIn = "/NewSignIn";
  static const SignIn = "/SignIn";
  static const Tracking = "/Tracking";
  static const Test = "/Test";
  static const Booking = "/Booking";
  static const BookingList = "/BookingList";
  static const Home = "/Home";
  static const Depo = "$Booking/Depo";
  static const BookingRequest = "$Booking/Create";
  // static const Dashboard = "/$Home/Dashboard";
  // static const UserList = "$Home/UserList";
  // static const CUDUser = "$UserList/CUD";
  // static const ChangePassword = "$UserList/ChangePassword";
  // static const ApprovalList = "$Home/ApprovalList";
  // static const DetailApproval = "$ApprovalList/DetailApproval";
  // static const RequestList = "$Home/RequesList";
  // static const DetailRequest = "$RequestList/DetailRequest";
  // static const SendRequest = "$Home/Request";
  // static const CheckingCombine = "$Home/CheckingCombine";
  // static const Tracking1 = "$Home/Tracking";
  // static const QualityList = "$Home/QualityList";
  // static const CUDQuality = "$QualityList/CUD";
  // static const SpecialPolicyList = "$Home/PolicyList";
  // static const CUDPolicy = "$SpecialPolicyList/CUD";
  // static const HistoryList = "$Home/HistoryList";
  // static const ContainerStock = "$Home/Stock";
  // static const ImportStock = "$ContainerStock/Import";

  // static const MemberRoute = "/MemberDashboard";

  static final List<GetPage> router = <GetPage>[
    GetPage(
      name: defaultRoute,
      page: () => DefaultPage(),
    ),
    GetPage(
      name: NewSignIn,
      page: () => NewSignInPage(),
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
      name: BookingRequest,
      page: () => BookingRequestPage(),
    ),
    GetPage(
      name: BookingList,
      page: () => BookingListPage(),
    ),
    GetPage(
      name: Tracking,
      page: () => TrackingPage(),
    ),
    GetPage(
      name: Home,
      page: () => HomePage(),
    ),

    // GetPage(
    //   name: Dashboard,
    //   page: () => HomePage(),
    // ),
    // GetPage(
    //   name: UserList,
    //   page: () => HomePage(),
    // ),
    // GetPage(
    //   name: CUDUser,
    //   page: () => HomePage(),
    // ),
    // GetPage(
    //   name: ChangePassword,
    //   page: () => HomePage(),
    // ),
    // GetPage(
    //   name: ApprovalList,
    //   page: () => HomePage(),
    // ),
    // GetPage(
    //   name: DetailApproval,
    //   page: () => HomePage(),
    // ),
    // GetPage(
    //   name: RequestList,
    //   page: () => HomePage(),
    // ),
    // GetPage(
    //   name: DetailRequest,
    //   page: () => HomePage(),
    // ),
    // GetPage(
    //   name: SendRequest,
    //   page: () => HomePage(),
    // ),
    // GetPage(
    //   name: CheckingCombine,
    //   page: () => HomePage(),
    // ),
    // GetPage(
    //   name: Tracking1,
    //   page: () => HomePage(),
    // ),
    // GetPage(
    //   name: QualityList,
    //   page: () => HomePage(),
    // ),
    // GetPage(
    //   name: CUDQuality,
    //   page: () => HomePage(),
    // ),
    // GetPage(
    //   name: SpecialPolicyList,
    //   page: () => HomePage(),
    // ),
    // GetPage(
    //   name: CUDPolicy,
    //   page: () => HomePage(),
    // ),
    // GetPage(
    //   name: HistoryList,
    //   page: () => HomePage(),
    // ),
    // GetPage(
    //   name: ContainerStock,
    //   page: () => HomePage(),
    // ),
    // GetPage(
    //   name: ImportStock,
    //   page: () => HomePage(),
    // ),
    // // GetPage(
    // //   name: MemberRoute,
    // //   page: () => MemberPage(),
    // // ),
  ];
}

final CurrentRouteController currentRouteController =
    Get.put(CurrentRouteController());

class CurrentRouteController extends GetxController {
  var route = ''.obs;
}
