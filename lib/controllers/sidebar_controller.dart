import 'package:get/get.dart';
import 'package:web_booking/screen/container_stock/container_stock_page.dart';
import 'package:web_booking/screen/container_stock/import_file_page.dart';
import 'package:web_booking/screen/approval_list/approval_list_page.dart';
import 'package:web_booking/screen/approval_list/detail_approval/detail_approval_page.dart';
import 'package:web_booking/screen/dashboard/dashboard_page.dart';
import 'package:web_booking/screen/history_list/history_list_page.dart';
import 'package:web_booking/screen/quality_list/CUD_quality/CUD_quality_page.dart';
import 'package:web_booking/screen/quality_list/list_quality_page.dart';
import 'package:web_booking/screen/request_list/detail_request/detail_request_page.dart';
import 'package:web_booking/screen/special_policy_list/CUD_special_policy/CUD_special_policy.dart';
import 'package:web_booking/screen/special_policy_list/special_policy_list_page.dart';
import 'package:web_booking/screen/user_list/CUD_user/CUD_user_page.dart';
import 'package:web_booking/screen/user_list/CUD_user/change_pw/change_pw.page.dart';
import 'package:web_booking/screen/request/request_page.dart';
import 'package:web_booking/screen/checking_combine/checking_combine_page.dart';
import 'package:web_booking/screen/request_list/request_list_page.dart';
import 'package:web_booking/screen/tracking1/tracking_page1.dart';
import 'package:web_booking/screen/user_list/user_list_page.dart';

class SideBarController extends GetxController {
  Rx<int> index = 0.obs;

  var pages = [
    DashboardPage(), // 0
    ApprovalListPage(), // 1
    RequestListPage(), // 2
    SendRequestPage(), // 3
    CheckingCombinePage(), // 4
    Tracking1Page(), // 5
    QualityListPage(), // 6
    CUD_QualityPage(), // 7
    SpecialPolicyListPage(), //8
    CUD_SpecialPolicyPage(), //9
    HistoryListPage(), //10
    ContainerStockPage(), //11
    ImportStockPage(), //12
    DetailApprovalPage(), //13
    DetailRequestPage(), //14
    UserListPage(), //15
    CUD_UserPage(), //16
    ChangePassword_UserPage(), //17
  ];
}
