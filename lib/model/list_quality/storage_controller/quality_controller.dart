import 'package:flutter/material.dart';
import 'package:get/get.dart';

final QualityController qualityController = Get.put(QualityController());

class QualityController extends GetxController {
  RxInt id = 0.obs;
  var maChatLuong = ''.obs;
  var tenChatLuong = ''.obs;
  var ghiChu = ''.obs;
  var updateUser = ''.obs;

  void updateQualityController({
    @required id,
    @required maChatLuong,
    @required tenChatLuong,
    @required ghiChu,
    @required updateUser,
  }) {
    this.id = id;
    this.maChatLuong = maChatLuong;
    this.tenChatLuong = tenChatLuong;
    this.ghiChu = ghiChu;
    this.updateUser = updateUser;
  }
}
