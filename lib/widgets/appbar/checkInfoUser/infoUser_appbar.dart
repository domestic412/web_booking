import 'package:web_booking/constants/variable.dart';
import 'package:web_booking/page/signin/controller_signin.dart/info_signin_controller.dart';

void checkInfoUser() {
  switch (box.read(shipperName_signin)) {
    case null:
      print('null');
      break;
    default:
      {
        switch (inforUserController.shipperName.value) {
          case '':
            {
              switch (box.read(is_staff_signin)) {
                case 0:
                  {
                    print('0');
                    inforUserController.updateInfoShipperController(
                      isStaff: 0,
                      shipperId: box.read(shipperId_signin),
                      shipperName: box.read(shipperName_signin),
                      managingOfficeId: box.read(managingOfficeId_signin),
                      consigneeList: box.read(consigneeList_signin),
                      termList: box.read(termList_signin),
                    );
                  }
                  break;
                case 1:
                  {
                    print('1');
                    inforUserController.updateInfoStaffController(
                      isStaff: 1,
                      shipperId: box.read(shipperId_signin),
                      shipperName: box.read(shipperName_signin),
                      managingOfficeId: box.read(managingOfficeId_signin),
                    );
                    break;
                  }
              }
              break;
            }
          default:
            break;
        }
      }
  }
}

void checkDataLogin(dataLogin) {
  if (dataLogin is List) {
    box.write(is_staff_signin, 1);
    // print('data type list');
  } else if (dataLogin is Map<dynamic, dynamic>) {
    box.write(is_staff_signin, 0);
    // print('data type Map');
  } else {
    // print(dataLogin);
  }
}
