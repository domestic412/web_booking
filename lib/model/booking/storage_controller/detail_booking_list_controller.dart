// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:get/state_manager.dart';

// final DataDetailBookingRequestController dataDetailBookingRequestController =
//     Get.put(DataDetailBookingRequestController());

// class DataDetailBookingRequestController extends GetxController {
//   RxInt id = 0.obs;
//   RxInt bookingId = 0.obs;
//   var vessel = ''.obs;
//   var voyage = ''.obs;
//   var date = ''.obs;
//   var payer = ''.obs;
//   var consignee = ''.obs;
//   var serviceTerm = ''.obs;
//   var term = ''.obs;
//   var paymentTerm = ''.obs;
//   var statusBooking = ''.obs;
//   var noteRequestByUser = ''.obs;
//   var processUser = ''.obs;
//   var updateTime = ''.obs;

//   RxList detailListInfoContainer = [].obs;
//   RxList detailListDepots = [].obs;

//   void updateDetailBookingRequest(
//       {@required id,
//       @required vessel,
//       @required voyage,
//       @required date,
//       @required payer,
//       @required consignee,
//       @required serviceTerm,
//       @required term,
//       @required paymentTerm,
//       @required statusBooking,
//       @required noteRequestByUser,
//       @required processUser,
//       @required updateTime}) {
//     this.id.value = id;
//     this.vessel.value = vessel;
//     this.voyage.value = voyage;
//     this.date.value = date;
//     this.payer.value = payer;
//     this.consignee.value = consignee;
//     this.serviceTerm.value = serviceTerm;
//     this.term.value = term;
//     this.paymentTerm.value = paymentTerm;
//     this.statusBooking.value = statusBooking;
//     this.noteRequestByUser.value = noteRequestByUser;
//     this.processUser.value = processUser;
//     this.updateTime.value = updateTime;
//   }
// }

import 'package:get/get.dart';
import 'package:get/state_manager.dart';

DetailBookingListController detailBookingListController = Get.put(DetailBookingListController());

class DetailBookingListController extends GetxController{
  var payer = ''.obs;
  var shipperName = ''.obs;
  var shipper = ''.obs;
  var consignee = ''.obs;
  var notifyParty= ''.obs;
  var shipName = ''.obs;
  var voyId= ''.obs;
  var fromDate = ''.obs;
  var toDate = ''.obs;
  var bookingNo = ''.obs;
  var bookingDate = ''.obs;
  var finalDest= ''.obs;
  var coc = ''.obs;
  var portLoad= ''.obs;
  var confirmed = false.obs;
  var blNo = ''.obs;
  var commodity = ''.obs;
  var cont20 = 0.obs;
  var cont40 = 0.obs;
  var cont45= 0.obs;

  void updateDetailBookingList({
    required String payer,
    required String shipperName,
    required String shipper,
    required String consignee,
    required String notifyParty,
    required String shipName,
    required String voyId,
    required String fromDate,
    required String toDate,
    required String bookingNo,
    required String bookingDate,
    required String finalDest,
    required String coc,
    required String portLoad,
    required bool confirmed,
    required String blNo,
    required String commodity,
    required int cont20,
    required int cont40,
    required int cont45,
  }) {
    this.payer.value = payer;
    this.shipperName.value = shipperName;
    this.shipper.value =  shipper;
    this.consignee.value = consignee;
    this.notifyParty.value = notifyParty;
    this.shipName.value = shipName;
    this.voyId.value = voyId;
    this.fromDate.value = fromDate;
    this.toDate.value = toDate;
    this.bookingNo.value = bookingNo;
    this.bookingDate.value = bookingDate;
    this.finalDest.value = finalDest;
    this.coc.value = coc;
    this.portLoad.value = portLoad;
    this.confirmed.value = confirmed;
    this.blNo.value = blNo;
    this.commodity.value = commodity;
    this.cont20.value = cont20;
    this.cont40.value = cont40;
    this.cont45.value = cont45;
    }
}