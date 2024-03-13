import 'package:flutter/material.dart';
import 'package:get/get.dart';

// final inforController = Get.put(InformationSignInController());
final InformationSignInController inforUserController =
    Get.put(InformationSignInController());

class InformationSignInController extends GetxController {
  //old
  var user = TextEditingController().obs;
  var pass = TextEditingController().obs;
  var authorize = ''.obs;
  var maNV = ''.obs;
  // shipper name
  var tenNV = ''.obs;
  var author = ''.obs;
  var code = ''.obs;

  //new     information shipper
  var username = TextEditingController().obs;
  var password = TextEditingController().obs;
  var shipperId = ''.obs;
  // var shipperName = ''.obs;
  var managingOfficeId = ''.obs;

  updateInforSignInController(
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

  resetInforSignInController() {
    user.value.clear();
    pass.value.clear();
    authorize = ''.obs;
    maNV = ''.obs;
    tenNV = ''.obs;
    author = ''.obs;
    code = ''.obs;
  }

  updateNewInfoUserController({
    @required shipperId,
    @required shipperName,
    @required managingOfficeId,
  }) {
    this.shipperId.value = shipperId;
    this.tenNV.value = shipperName;
    this.managingOfficeId.value = managingOfficeId;
  }

  resetNewInforUserController() {
    username.value.clear();
    password.value.clear();
    shipperId = ''.obs;
    tenNV = ''.obs;
    managingOfficeId = ''.obs;
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
