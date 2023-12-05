import 'package:flutter/material.dart';
import 'package:get/get.dart';

final PolicyController policyController = Get.put(PolicyController());

class PolicyController extends GetxController {
  RxInt id = 0.obs;
  var shipper = ''.obs;
  var code = ''.obs;
  var times = ''.obs;
  var updateUser = ''.obs;

  void updatePolicyController({
    @required id,
    @required shipper,
    @required code,
    @required times,
    @required updateUser,
  }) {
    this.id = id;
    this.shipper = shipper;
    this.code = code;
    this.times = times;
    this.updateUser = updateUser;
  }
}
