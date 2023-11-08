import 'package:get/get.dart';
import 'package:web_booking/screen/list_approval/list_approval_page.dart';
import 'package:web_booking/screen/list_quality/create_quality/create_quality_page.dart';
import 'package:web_booking/screen/list_quality/list_quality_page.dart';
import 'package:web_booking/screen/list_quality/update_quality/update_quality.dart';
import 'package:web_booking/screen/list_special_policy/list_special_policy_page.dart';
import 'package:web_booking/screen/request/request_page.dart';
import 'package:web_booking/screen/checkcontainer/check_container_page.dart';
import 'package:web_booking/screen/list_request/list_request_page.dart';
import 'package:web_booking/screen/member/member_screen.dart';
import 'package:web_booking/screen/tracking1/tracking_page1.dart';

class SideBarController extends GetxController {
  RxInt index = 0.obs;

  var pages = [
    MemberPage(), // 0
    ListApprovalPage(), // 1
    ListRequestPage(), // 2
    RequestPage(), // 3
    CheckContainerPage(), // 4
    Tracking1Page(), // 5
    ListQualityPage(), // 6
    CreateQualityPage(), // 7
    UpdateQualityPage(), // 8
    ListSpecialPolicyPage() // 9
    // SpecialPolicyPage()
  ];
}
