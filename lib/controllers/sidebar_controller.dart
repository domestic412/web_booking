import 'package:get/get.dart';
import 'package:web_booking/screen/member/member_screen.dart';
import 'package:web_booking/widgets/sidebar/sider_bar.dart';

class SideBarController extends GetxController {
  RxInt index = 0.obs;

  var pages = [
    // SideBar(),
    MemberPage(),
  ];
}
