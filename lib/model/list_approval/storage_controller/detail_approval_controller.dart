import 'package:flutter/material.dart';
import 'package:get/get.dart';

final DetailApprovalController detailApprovalController =
    Get.put(DetailApprovalController());

class DetailApprovalController extends GetxController {
  var note_controller = TextEditingController();
  RxInt id = 0.obs;
  var tenYeuCau = ''.obs;
  var noiDung = ''.obs;
  var cntrno = ''.obs;
  var sizeType = ''.obs;
  var trangThaiYc = ''.obs;
  var noteHangTau = ''.obs;
  var updateTime = ''.obs;

  updateDetailApproval({
    @required id,
    @required tenYeuCau,
    @required noiDung,
    @required cntrno,
    @required sizeType,
    @required trangThaiYc,
    @required noteHangTau,
    @required updateTime,
  }) {
    this.id = id;
    this.tenYeuCau = tenYeuCau;
    this.noiDung = noiDung;
    this.cntrno = cntrno;
    this.sizeType = sizeType;
    this.trangThaiYc = trangThaiYc;
    this.noteHangTau = noteHangTau;
    this.updateTime = updateTime;
  }

  // inputNoteDetailApproval({@required note_controller}) {
  //   this.note_controller = note_controller;
  // }
}
