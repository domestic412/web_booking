import 'package:flutter/material.dart';
import 'package:get/get.dart';

final CheckContainerController checkContainerController =
    Get.put(CheckContainerController());

class CheckContainerController extends GetxController {
  var pathImg = ''.obs;
  var cntrno = ''.obs;
  var sizeType = ''.obs;
  var quality = ''.obs;
  var soLanKetHop = ''.obs;
  var ghiChuTinhTrang = ''.obs;
  var luuYSuDung = ''.obs;
  var ketQua = ''.obs;
  var approval = ''.obs;
  var shipper = ''.obs;
  var remark = ''.obs;
  // var updateTime = ''.obs;

  void updateCheckContainerController({
    @required cntrno,
    @required sizeType,
    @required quality,
    @required soLanKetHop,
    @required ghiChuTinhTrang,
    @required luuYSuDung,
    @required ketQua,
    @required approval,
    @required shipper,
    @required remark,
    // @required updateTime,
  }) {
    this.cntrno.value = cntrno;
    this.sizeType.value = sizeType;
    this.quality.value = quality;
    this.soLanKetHop.value = soLanKetHop;
    this.ghiChuTinhTrang.value = ghiChuTinhTrang;
    this.luuYSuDung.value = luuYSuDung;
    this.ketQua.value = ketQua;
    this.approval.value = approval;
    this.shipper.value = shipper;
    this.remark.value = remark;
    // this.updateTime.value = updateTime;
  }
}
