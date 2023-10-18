import 'package:get/get.dart';
import 'package:web_booking/page/page_test/test_page.dart';
import 'package:web_booking/screen/list_request/list_request_page.dart';
import 'package:web_booking/screen/member/member_screen.dart';
import 'package:web_booking/widgets/sidebar/sider_bar.dart';

class SideBarController extends GetxController {
  RxInt index = 0.obs;

  var pages = [
    // SideBar(),
    MemberPage(),
    ListRequestPage(),
  ];
}
