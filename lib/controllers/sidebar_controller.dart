import 'package:get/get.dart';
import 'package:web_booking/page/request/request_page.dart';
import 'package:web_booking/screen/list_request/list_request_page.dart';
import 'package:web_booking/screen/member/member_screen.dart';

class SideBarController extends GetxController {
  RxInt index = 0.obs;

  var pages = [
    const MemberPage(),
    ListRequestPage(),
    RequestPage(),
  ];
}
