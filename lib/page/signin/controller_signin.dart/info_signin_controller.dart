import 'package:flutter/material.dart';
import 'package:get/get.dart';

// final inforController = Get.put(InformationSignInController());
final InformationSignInController inforUserController =
    Get.put(InformationSignInController());

class InformationSignInController extends GetxController {
  var OLD_NEW = 0.obs;
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

  //new     info consignee, term
  var consigneeList = [].obs;
  var termList = [].obs;

  updateInforSignInController(
      {@required OLD_NEW,
      @required authorize,
      @required maNV,
      @required tenNV,
      @required author,
      @required code}) {
    this.OLD_NEW.value = OLD_NEW;
    this.authorize.value = authorize;
    this.maNV.value = maNV;
    this.tenNV.value = tenNV;
    this.author.value = author;
    this.code.value = code;
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
    @required OLD_NEW,
    @required shipperId,
    @required shipperName,
    @required managingOfficeId,
    @required consigneeList,
    @required termList,
  }) {
    this.OLD_NEW.value = OLD_NEW;
    this.shipperId.value = shipperId;
    this.tenNV.value = shipperName;
    this.managingOfficeId.value = managingOfficeId;
    this.consigneeList.value = consigneeList;
    this.termList.value = termList;
  }

  resetNewInforUserController() {
    username.value.clear();
    password.value.clear();
    shipperId = ''.obs;
    tenNV = ''.obs;
    managingOfficeId = ''.obs;
    consigneeList = [].obs;
    termList = [].obs;
  }
}
