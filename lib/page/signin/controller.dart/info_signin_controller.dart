import 'package:flutter/material.dart';
import 'package:get/get.dart';

final inforController = Get.put(InformationSignInController());
final InformationSignInController informationController =
    Get.put(InformationSignInController());

class InformationSignInController extends GetxController {
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
}

class InfoAccountSignInController extends GetxController {
  var user = ''.obs;
  var password = ''.obs;
  updateAccountSignIn({@required user, @required password}) {
    this.user = user;
    this.password = password;
  }
}
