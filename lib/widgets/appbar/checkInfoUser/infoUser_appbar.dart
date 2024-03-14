import 'package:web_booking/constants/variable.dart';
import 'package:web_booking/page/signin/controller_signin.dart/info_signin_controller.dart';

void checkInfoUser() {
  switch (box.read(shipperName_signin)) {
    case null:
      break;
    default:
      {
        switch (inforUserController.tenNV.value) {
          case '':
            {
              switch (box.read(old_new_signin)) {
                case 0:
                  {
                    inforUserController.updateInforSignInController(
                        OLD_NEW: 0,
                        authorize: box.read(authorize_signin),
                        maNV: box.read(maNV_signin),
                        tenNV: box.read(shipperName_signin),
                        author: box.read(author_signin),
                        code: box.read(code_signin));
                  }
                  break;
                case 1:
                  {
                    inforUserController.updateNewInfoUserController(
                      OLD_NEW: 1,
                      shipperId: box.read(shipperId_signin),
                      shipperName: box.read(shipperName_signin),
                      managingOfficeId: box.read(managingOfficeId_signin),
                      consigneeList: box.read(consigneeList_signin),
                      termList: box.read(termList_signin),
                    );
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
