import 'package:get/get.dart';
import 'package:web_booking/utils/getx_route.dart';

final SideBarController controller = SideBarController();

class SideBarController extends GetxController {
  var selectPage = 'dashboard'.obs;
  static const dashboard = 'dashboard'.obs;
  static const userList = 'userlist';
  static const cudUser = 'cudUser';
  static const changePass = 'changePass';
  static const approvalList = 'approvalList';
  static const detailApproval = 'detailApproval';
  static const requestList = 'requestList';
  static const detailRequest = 'detailRequest';
  static const sendRequest = 'sendRequest';
  static const checkingCombine = 'checkingCombine';
  static const tracking1 = 'tracking1';
  static const qualityList = 'qualityList';
  static const cudQuality = 'cudQuality';
  static const specialPolicyList = 'specialPolicyList';
  static const cudPolicy = 'cudPolicy';
  static const historyList = 'historyList';
  static const containerStock = 'containerStock';
  static const importStock = 'importStock';

  changePage(page) {
    selectPage.value = page;
    switch (page) {
      case dashboard:
        Get.toNamed(GetRoutes.Dashboard);
        break;
      case userList:
        Get.toNamed(GetRoutes.UserList);
        break;
      case cudUser:
        Get.toNamed(GetRoutes.CUDUser);
        break;
      case changePass:
        Get.toNamed(GetRoutes.ChangePassword);
        break;
      case approvalList:
        Get.toNamed(GetRoutes.ApprovalList);
        break;
      case detailApproval:
        Get.toNamed(GetRoutes.DetailApproval);
        break;
      case requestList:
        Get.toNamed(GetRoutes.RequestList);
        break;
      case detailRequest:
        Get.toNamed(GetRoutes.DetailRequest);
        break;
      case sendRequest:
        Get.toNamed(GetRoutes.SendRequest);
        break;
      case checkingCombine:
        Get.toNamed(GetRoutes.CheckingCombine);
        break;
      case tracking1:
        Get.toNamed(GetRoutes.Tracking1);
        break;
      case qualityList:
        Get.toNamed(GetRoutes.QualityList);
        break;
      case cudQuality:
        Get.toNamed(GetRoutes.CUDQuality);
        break;
      case specialPolicyList:
        Get.toNamed(GetRoutes.SpecialPolicyList);
        break;
      case cudPolicy:
        Get.toNamed(GetRoutes.CUDPolicy);
        break;
      case historyList:
        Get.toNamed(GetRoutes.HistoryList);
        break;
      case containerStock:
        Get.toNamed(GetRoutes.ContainerStock);
        break;
      case importStock:
        Get.toNamed(GetRoutes.ImportStock);
        break;
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
