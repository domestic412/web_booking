import 'package:get/get.dart';
import 'package:web_booking/screen/request/request_page.dart';
import 'package:web_booking/screen/checkcontainer/check_container_page.dart';
import 'package:web_booking/screen/list_request/list_request_page.dart';
import 'package:web_booking/screen/member/member_screen.dart';
import 'package:web_booking/screen/tracking1/tracking_page1.dart';

class SideBarController extends GetxController {
  RxInt index = 0.obs;

  var pages = [
    MemberPage(),
    ListRequestPage(),
    RequestPage(),
    CheckContainerPage(),
    Tracking1Page()
  ];
}
