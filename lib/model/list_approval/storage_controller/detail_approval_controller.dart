import 'package:flutter/material.dart';
import 'package:get/get.dart';

final DetailApprovalController detailApprovalController =
    Get.put(DetailApprovalController());

class DetailApprovalController extends GetxController {
  var note_controller = TextEditingController();
  var id = ''.obs;
  // var tenYeuCau = ''.obs;
  // var shipperName = ''.obs;
  // var shipperNote = ''.obs;
  // var noiDung = ''.obs;
  // var cntrno = ''.obs;
  // var sizeType = ''.obs;
  // var combineStuffing = ''.obs;
  // var trangThaiYc = ''.obs;
  // var noteHangTau = ''.obs;
  // var updateTime = ''.obs;
  // var checkRemark = ''.obs;
  // var quanlity = ''.obs;
  // var combineTimes = 0.obs;
  // var combineTimesA = 0.obs;

  // updateDetailApproval({
  //   required id,
  // required shipperName,
  // required shipperNote,
  // required tenYeuCau,
  // required noiDung,
  // required cntrno,
  // required sizeType,
  // required combineStuffing,
  // required trangThaiYc,
  // required noteHangTau,
  // required updateTime,
  // required checkRemark,
  // required quanlity,
  // required combineTimes,
  // required combineTimesA
  // }) {
  // this.id = id;
  // this.shipperName = shipperName;
  // this.shipperNote = shipperNote;
  // this.tenYeuCau = tenYeuCau;
  // this.noiDung = noiDung;
  // this.cntrno = cntrno;
  // this.sizeType = sizeType;
  // this.combineStuffing = combineStuffing;
  // this.trangThaiYc = trangThaiYc;
  // this.noteHangTau = noteHangTau;
  // this.updateTime = updateTime;
  // this.checkRemark = checkRemark;
  // this.quanlity = quanlity;
  // this.combineTimes = combineTimes;
  // this.combineTimesA = combineTimesA;
  // }
}
