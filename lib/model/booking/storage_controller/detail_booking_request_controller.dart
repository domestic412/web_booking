import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/state_manager.dart';

final DataDetailBookingRequestController dataDetailBookingRequestController =
    Get.put(DataDetailBookingRequestController());

class DataDetailBookingRequestController extends GetxController {
  RxInt id = 0.obs;
  RxInt bookingId = 0.obs;
  var vessel = ''.obs;
  var voyage = ''.obs;
  var date = ''.obs;
  var payer = ''.obs;
  var consignee = ''.obs;
  var serviceTerm = ''.obs;
  var term = ''.obs;
  var paymentTerm = ''.obs;
  var statusBooking = ''.obs;
  var noteRequestByUser = ''.obs;
  var processUser = ''.obs;
  var updateTime = ''.obs;

  RxList detailListInfoContainer = [].obs;
  RxList detailListDepots = [].obs;

  void updateDetailBookingRequest(
      {@required id,
      @required vessel,
      @required voyage,
      @required date,
      @required payer,
      @required consignee,
      @required serviceTerm,
      @required term,
      @required paymentTerm,
      @required statusBooking,
      @required noteRequestByUser,
      @required processUser,
      @required updateTime}) {
    this.id.value = id;
    this.vessel.value = vessel;
    this.voyage.value = voyage;
    this.date.value = date;
    this.payer.value = payer;
    this.consignee.value = consignee;
    this.serviceTerm.value = serviceTerm;
    this.term.value = term;
    this.paymentTerm.value = paymentTerm;
    this.statusBooking.value = statusBooking;
    this.noteRequestByUser.value = noteRequestByUser;
    this.processUser.value = processUser;
    this.updateTime.value = updateTime;
  }
}
