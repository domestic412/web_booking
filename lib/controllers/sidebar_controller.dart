import 'package:get/get.dart';
import 'package:web_booking/screen/approval_list/approval_list_page.dart';
import 'package:web_booking/screen/approval_list/detail_approval/detail_approval_page.dart';
import 'package:web_booking/screen/checking_combine/checking_combine_page.dart';
import 'package:web_booking/screen/container_stock/container_stock_page.dart';
import 'package:web_booking/screen/container_stock/import_file_page.dart';
import 'package:web_booking/screen/dashboard/dashboard_page.dart';
import 'package:web_booking/screen/history_list/history_list_page.dart';
import 'package:web_booking/screen/quality_list/CUD_quality/CUD_quality_page.dart';
import 'package:web_booking/screen/quality_list/quality_list_page.dart';
import 'package:web_booking/screen/request/request_page.dart';
import 'package:web_booking/screen/request_list/detail_request/detail_request_page.dart';
import 'package:web_booking/screen/request_list/request_list_page.dart';
import 'package:web_booking/screen/special_policy_list/CUD_special_policy/CUD_special_policy.dart';
import 'package:web_booking/screen/special_policy_list/special_policy_list_page.dart';
import 'package:web_booking/screen/tracking1/tracking_page1.dart';
import 'package:web_booking/screen/user_list/CUD_user/CUD_user_page.dart';
import 'package:web_booking/screen/user_list/CUD_user/change_pw/change_pw.page.dart';
import 'package:web_booking/screen/user_list/user_list_page.dart';

final SideBarController controller = SideBarController();
const dashboard = 'dashboard';
const userList = 'userlist';
const cudUser = 'cudUser';
const changePass = 'changePass';
const approvalList = 'approvalList';
const detailApproval = 'detailApproval';
const requestList = 'requestList';
const detailRequest = 'detailRequest';
const sendRequest = 'sendRequest';
const checkingCombine = 'checkingCombine';
const tracking1 = 'tracking1';
const qualityList = 'qualityList';
const cudQuality = 'cudQuality';
const specialPolicyList = 'specialPolicyList';
const cudPolicy = 'cudPolicy';
const historyList = 'historyList';
const containerStock = 'containerStock';
const importStock = 'importStock';

class SideBarController extends GetxController {
  var selectWidget = dashboard.obs;

  changeWidget(String widget) {
    switch (widget) {
      case dashboard:
        return DashboardPage();
      case userList:
        return UserListPage();
      case cudUser:
        return CUD_UserPage();
      case changePass:
        return ChangePassword_UserPage();
      case approvalList:
        return ApprovalListPage();
      case detailApproval:
        // Get.toNamed(GetRoutes.DetailApproval);
        return DetailApprovalPage();
      case requestList:
        // Get.toNamed(GetRoutes.RequestList);
        return RequestListPage();
      case detailRequest:
        // Get.toNamed(GetRoutes.DetailRequest);
        return DetailRequestPage();
      case sendRequest:
        // Get.toNamed(GetRoutes.SendRequest);
        return SendRequestPage();
      case checkingCombine:
        // Get.toNamed(GetRoutes.CheckingCombine);
        return CheckingCombinePage();
      case tracking1:
        // Get.toNamed(GetRoutes.Tracking1);
        return Tracking1Page();
      case qualityList:
        // Get.toNamed(GetRoutes.QualityList);
        return QualityListPage();
      case cudQuality:
        // Get.toNamed(GetRoutes.CUDQuality);
        return CUD_QualityPage();
      case specialPolicyList:
        // Get.toNamed(GetRoutes.SpecialPolicyList);
        return SpecialPolicyListPage();
      case cudPolicy:
        // Get.toNamed(GetRoutes.CUDPolicy);
        return CUD_SpecialPolicyPage();
      case historyList:
        // Get.toNamed(GetRoutes.HistoryList);
        return HistoryListPage();
      case containerStock:
        // Get.toNamed(GetRoutes.ContainerStock);
        return ContainerStockPage();
      case importStock:
        // Get.toNamed(GetRoutes.ImportStock);
        return ImportStockPage();
    }
  }
}
  // = [
  //   DashboardPage(), // 0
  //   ApprovalListPage(), // 1
  //   RequestListPage(), // 2
  //   SendRequestPage(), // 3
  //   CheckingCombinePage(), // 4
  //   Tracking1Page(), // 5
  //   QualityListPage(), // 6
  //   CUD_QualityPage(), // 7
  //   SpecialPolicyListPage(), //8
  //   CUD_SpecialPolicyPage(), //9
  //   HistoryListPage(), //10
  //   ContainerStockPage(), //11
  //   ImportStockPage(), //12
  //   DetailApprovalPage(), //13
  //   DetailRequestPage(), //14
  //   UserListPage(), //15
  //   CUD_UserPage(), //16
  //   ChangePassword_UserPage(), //17
  // ];
