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
import 'package:web_booking/screen/quote_list/detail_quote/detail_quote_page.dart';
import 'package:web_booking/screen/quote_list/quote_list_page.dart';
import 'package:web_booking/screen/request/request_page.dart';
import 'package:web_booking/screen/request_list/detail_request/detail_request_page.dart';
import 'package:web_booking/screen/request_list/request_list_page.dart';
import 'package:web_booking/screen/tracking1/tracking_page1.dart';

final SideBarController controller = SideBarController();
const service = 'service';
const dashboard = 'dashboard';
// const userList = 'userlist';
// const cudUser = 'cudUser';
// const changePass = 'changePass';
const booking = 'booking';
// const releaseBookingList = 'releaseBookingList';
// const detailReleaseBookingList = 'detailReleaseBookingList';
const approvalList = 'approvalList';
const detailApproval = 'detailApproval';
const quoteList = 'quoteList';
const quoteDetails = 'quoteDetails';
// const bookingRequestList = 'bookingRequestList';
// const detailBookingRequest = 'detailBookingRequest';
const requestList = 'requestList';
const detailRequest = 'detailRequest';
const sendRequest = 'sendRequest';
const checkingCombine = 'checkingCombine';
const tracking1 = 'tracking1';
const qualityList = 'qualityList';
const cudQuality = 'cudQuality';
// const specialPolicyList = 'specialPolicyList';
// const cudPolicy = 'cudPolicy';
const historyList = 'historyList';
const containerStock = 'containerStock';
const importStock = 'importStock';

class SideBarController extends GetxController {
  var selectWidget = dashboard.obs;

  changeWidget(String widget) {
    switch (widget) {
      case dashboard:
        return DashboardPage();
      // case userList:
      //   return UserListPage();
      // case cudUser:
      //   return CUD_UserPage();
      // case changePass:
      //   return ChangePassword_UserPage();
      // case releaseBookingList:
      //   return ReleaseBookingListPage();
      // case detailReleaseBookingList:
      //   return DetailReleaseBookingRequestPage();
      case approvalList:
        return ApprovalListPage();
      case detailApproval:
        // Get.toNamed(GetRoutes.DetailApproval);
        return DetailApprovalPage();
      case quoteList:
      return QuoteListPage();
      case quoteDetails:
      return QuoteDetailsPage();
      // case bookingRequestList:
      //   // Get.toNamed(GetRoutes.RequestList);
      //   return BookingListPage();
      // case detailBookingRequest:
      //   // Get.toNamed(GetRoutes.RequestList);
      //   return DetailBookingRequestPage();
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
      // case specialPolicyList:
      //   // Get.toNamed(GetRoutes.SpecialPolicyList);
      //   return SpecialPolicyListPage();
      // case cudPolicy:
      //   // Get.toNamed(GetRoutes.CUDPolicy);
      //   return CUD_SpecialPolicyPage();
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
