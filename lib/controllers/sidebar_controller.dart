import 'package:flutter/rendering.dart';
import 'package:get/get.dart';
import 'package:web_booking/screen/container_stock/container_stock_page.dart';
import 'package:web_booking/screen/container_stock/import_file_page.dart';
import 'package:web_booking/screen/list_approval/list_approval_page.dart';
import 'package:web_booking/screen/list_approval/detail_approval/detail_approval_page.dart';
import 'package:web_booking/screen/list_history/list_history_page.dart';
import 'package:web_booking/screen/list_quality/CUD_quality/CUD_quality_page.dart';
import 'package:web_booking/screen/list_quality/list_quality_page.dart';
import 'package:web_booking/screen/list_request/detail_request/detail_request.dart';
import 'package:web_booking/screen/list_special_policy/CUD_special_policy/CUD_special_policy.dart';
import 'package:web_booking/screen/list_special_policy/list_special_policy_page.dart';
import 'package:web_booking/screen/request/request_page.dart';
import 'package:web_booking/screen/check_container/check_container_page.dart';
import 'package:web_booking/screen/list_request/list_request_page.dart';
import 'package:web_booking/screen/member/member_screen.dart';
import 'package:web_booking/screen/testpage/testpage.dart';
import 'package:web_booking/screen/testpage/testpage2.dart';
import 'package:web_booking/screen/tracking1/tracking_page1.dart';

class SideBarController extends GetxController {
  Rx<int> index = 0.obs;

  var pages = [
    MemberPage(), // 0
    ListApprovalPage(), // 1
    ListRequestPage(), // 2
    RequestPage(), // 3
    CheckContainerPage(), // 4
    Tracking1Page(), // 5
    ListQualityPage(), // 6
    CUD_QualityPage(), // 7
    ListSpecialPolicyPage(), //8
    CUD_SpecialPolicyPage(), //9
    ListHistoryPage(), //10
    ContainerStockPage(), //11
    ImportFileStock(), //12
    DetailApprovalPage(), //13
    DetailRequestPage(), //14
  ];
}
