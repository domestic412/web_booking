import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:web_booking/model/booking/model_create_booking.dart';

final CreateBookingController createBookingController =
    Get.put(CreateBookingController());

class CreateBookingController extends GetxController {
  // var listConsignee = ['Consignee 1', 'Consignee 2', 'Consignee 3'].obs;
  // var voyDetails = ''.obs;

  var consignee_controller = TextEditingController().obs;
  var consigneeId = ''.obs;

  var ref_controller = TextEditingController().obs;
  var refId = ''.obs;

  var term_controller = TextEditingController().obs;
  var term = ''.obs;

  // var boolNewConsignee = false.obs;
  // var inputNewConsignee = TextEditingController().obs;

  // var listServiceTerm =
  //     ['CY/CY', 'CY/DR', 'CY/FO', 'DR/CY', 'DR/DR', 'FI/CY', 'FI/FO'].obs;
  // var currentServiceTerm = 'CY/CY'.obs;

  var listPaymentTerm = ['PREPAID', 'COLLECT', 'COD'].obs;
  var paymentTerm = ''.obs;

  var optionsContainer = [true, false].obs;
  var coc = true.obs;

  var commodity_controller = TextEditingController().obs;
  var commodityId = ''.obs;

  // var inputCommodity = TextEditingController().obs;

  var listSizeContainer = ['20', '40', '45', '53'].obs;
  var sizeId = ''.obs;

  var listType =
      ['DC', 'HC', 'RF', 'RH', ' HQ', 'GP', 'OT', 'OH', 'TK', 'FR'].obs;
  var type = ''.obs;

  var listTypeContainer = ['DRY', 'REEFER'].obs;
  var currentTypeContainer = ''.obs;
  var reefer = false.obs;
  var temp_controller = TextEditingController().obs;

  // var realSizeContainer = '20DC'.obs;

  var listStatusContainer = ['F', 'E'].obs;
  var status = ''.obs;

  var volume_controller = TextEditingController().obs;
  var weight_controller = TextEditingController().obs;

  var dg = false.obs;
  var dgRemark_controller = TextEditingController().obs;
  // var inputDGClass = TextEditingController().obs;
  // var inputNoteRequest = TextEditingController().obs;

  var remark = TextEditingController().obs;

  var boolErrorAdd = false.obs;
  var boolErrorBookingRequest = true.obs;

  // var statusBookingRequest = 'N'.obs;
  var countRowContainer = 0.obs;

  var edit = 'I'.obs;

  RxList<BookingDetails> listInfoContainer = <BookingDetails>[].obs;

  // RxList<Depots> listInfoDepo = <Depots>[
  //   Depots(
  //     depotId: '',
  //     depotName: '',
  //     sizeConts: '',
  //     volumeConts: '',
  //   )
  // ].obs;

  void clearDataCreateBooking() {
    listInfoContainer.value = <BookingDetails>[];
    // this.consignee_controller.value.text = '';
    // this.boolNewConsignee = false.obs;
    // this.currentServiceTerm = 'CY/CY'.obs;
    // this.currentOptionsContainer = 'COC'.obs;
    // this.currentPaymentTerm = 'PREPAID'.obs;
    // this.inputCommodity.value.clear();
    // this.currentSizeContainer = '20'.obs;
    // this.currentTypeContainer = 'DRY'.obs;
    // this.currentStatusContainer = 'F'.obs;
    // this.inputVolume.value.clear();
    // this.inputWeight.value.clear();
    // this.inputTemp.value.clear();
    // this.boolContDangerous = false.obs;
    // this.inputDGunNo.value.clear();
    // this.inputDGClass.value.clear();
    // this.inputNoteRequest.value.clear();
    // this.boolErrorAdd = false.obs;
    // this.boolErrorBookingRequest = true.obs;
    // this.countRowContainer = 0.obs;
    // this.listInfoContainer = <Volumes>[].obs;
    // this.listInfoDepo = <Depots>[
    //   Depots(
    //     depotId: '',
    //     depotName: '',
    //     sizeConts: '',
    //     volumeConts: '',
    //   )
    // ].obs;
  }
}
