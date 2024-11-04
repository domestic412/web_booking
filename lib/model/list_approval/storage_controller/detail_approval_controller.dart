import 'package:flutter/material.dart';
import 'package:get/get.dart';

final DetailApprovalController detailApprovalController =
    Get.put(DetailApprovalController());

class DetailApprovalController extends GetxController {
  var note_controller = TextEditingController();
  var id = ''.obs;
  var tenYeuCau = ''.obs;
  var shipperName = ''.obs;
  var shipperNote = ''.obs;
  var noiDung = ''.obs;
  var cntrno = ''.obs;
  var sizeType = ''.obs;
  var combineStuffing = ''.obs;
  var trangThaiYc = ''.obs;
  var noteHangTau = ''.obs;
  var updateTime = ''.obs;
  var checkRemark = ''.obs;

  updateDetailApproval({
    required id,
    required shipperName,
    required shipperNote,
    required tenYeuCau,
    required noiDung,
    required cntrno,
    required sizeType,
    required combineStuffing,
    required trangThaiYc,
    required noteHangTau,
    required updateTime,
    required checkRemark,
  }) {
    this.id = id;
    this.shipperName = shipperName;
    this.shipperNote = shipperNote;
    this.tenYeuCau = tenYeuCau;
    this.noiDung = noiDung;
    this.cntrno = cntrno;
    this.sizeType = sizeType;
    this.combineStuffing = combineStuffing;
    this.trangThaiYc = trangThaiYc;
    this.noteHangTau = noteHangTau;
    this.updateTime = updateTime;
    this.checkRemark = checkRemark;
  }

  // inputNoteDetailApproval({@required note_controller}) {
  //   this.note_controller = note_controller;
  // }
}
