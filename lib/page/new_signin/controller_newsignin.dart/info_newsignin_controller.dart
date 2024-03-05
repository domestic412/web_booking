import 'package:flutter/material.dart';
import 'package:get/get.dart';

// final inforController = Get.put(InformationSignInController());
// final InformationSignInController informationController =
//     Get.put(InformationSignInController());

class InformationNewSignInController extends GetxController {
  var authorize = ''.obs;
  var maNV = ''.obs;
  var tenNV = ''.obs;
  var author = ''.obs;
  var code = ''.obs;

  updateInfomationSignIn(
      {@required authorize,
      @required maNV,
      @required tenNV,
      @required author,
      @required code}) {
    this.authorize = authorize;
    this.maNV = maNV;
    this.tenNV = tenNV;
    this.author = author;
    this.code = code;
  }

  void resetInfomationSignInController() {
    authorize = ''.obs;
    maNV = ''.obs;
    tenNV = ''.obs;
    author = ''.obs;
    code = ''.obs;
  }
}

class InfoAccountSignInController extends GetxController {
  var user = ''.obs;
  var password = ''.obs;
  updateAccountSignIn({@required user, @required password}) {
    this.user = user;
    this.password = password;
  }
}
