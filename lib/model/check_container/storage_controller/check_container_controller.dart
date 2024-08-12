import 'package:flutter/material.dart';
import 'package:get/get.dart';

final CheckContainerController checkContainerController =
    Get.put(CheckContainerController());

class CheckContainerController extends GetxController {
  var pathImg = ''.obs;
  var cntrno = ''.obs;
  var sizeType = ''.obs;
  var soLanKetHop = ''.obs;
  var ghiChuTinhTrang = ''.obs;
  var luuYSuDung = ''.obs;
  var ketQua = ''.obs;
  var approval = ''.obs;
  var shipper = ''.obs;
  var remark = ''.obs;
  var updateTime = ''.obs;

  void updateCheckContainerController({
    @required cntrno,
    @required sizeType,
    @required soLanKetHop,
    @required ghiChuTinhTrang,
    @required luuYSuDung,
    @required ketQua,
    @required approval,
    @required shipper,
    @required remark,
    @required updateTime,
  }) {
    this.cntrno = cntrno;
    this.sizeType = sizeType;
    this.soLanKetHop = soLanKetHop;
    this.ghiChuTinhTrang = ghiChuTinhTrang;
    this.luuYSuDung = luuYSuDung;
    this.ketQua = ketQua;
    this.approval = approval;
    this.shipper = shipper;
    this.remark = remark;
    this.updateTime = updateTime;
  }
}
