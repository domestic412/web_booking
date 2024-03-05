import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:web_booking/model/booking/model_create_booking.dart';

final CreateBookingController createBookingController =
    Get.put(CreateBookingController());

class CreateBookingController extends GetxController {
  var listConsignee = ['Consignee 1', 'Consignee 2', 'Consignee 3'].obs;
  var currentConsignee = 'Consignee 1'.obs;
  var boolNewConsignee = false.obs;
  var inputNewConsignee = TextEditingController().obs;

  var listServiceTerm =
      ['CY/CY', 'CY/DR', 'CY/FO', 'DR/CY', 'DR/DR', 'FI/CY', 'FI/FO'].obs;
  var currentServiceTerm = 'CY/CY'.obs;

  var listPaymentTerm = ['PREPAID', 'COLLECT'].obs;
  var currentPaymentTerm = 'PREPAID'.obs;

  var optionsContainer = ['COC', 'SOC'].obs;
  var currentOptionsContainer = 'COC'.obs;

  var inputCommodity = TextEditingController().obs;

  var listSizeContainer = ['20', '40', '45', '53'].obs;
  var currentSizeContainer = '20'.obs;

  var listTypeContainer = ['DRY', 'REEFER'].obs;
  var currentTypeContainer = 'DRY'.obs;

  var realSizeContainer = '20DC'.obs;

  var listStatusContainer = ['F', 'E'].obs;
  var currentStatusContainer = 'F'.obs;

  var inputVolume = TextEditingController().obs;
  var inputWeight = TextEditingController().obs;
  var inputTemp = TextEditingController().obs;

  var boolContDangerous = false.obs;
  var inputDGunNo = TextEditingController().obs;
  var inputDGClass = TextEditingController().obs;
  var inputNoteRequest = TextEditingController().obs;

  var boolErrorAdd = false.obs;
  var boolErrorBookingRequest = true.obs;

  var statusBookingRequest = 'N'.obs;
  var countRowContainer = 0.obs;

  RxList<Volumes> listInfoContainer = <Volumes>[].obs;

  RxList<Depots> listInfoDepo = <Depots>[
    Depots(
      depotId: '',
      depotName: '',
      sizeConts: '',
      volumeConts: '',
    )
  ].obs;

  void clearDataCreateBooking() {
    this.currentConsignee = 'Consignee 1'.obs;
    this.boolNewConsignee = false.obs;
    this.currentServiceTerm = 'CY/CY'.obs;
    this.currentOptionsContainer = 'COC'.obs;
    this.currentPaymentTerm = 'PREPAID'.obs;
    this.inputCommodity.value.clear();
    this.currentSizeContainer = '20'.obs;
    this.currentTypeContainer = 'DRY'.obs;
    this.currentStatusContainer = 'F'.obs;
    this.inputVolume.value.clear();
    this.inputWeight.value.clear();
    this.inputTemp.value.clear();
    this.boolContDangerous = false.obs;
    this.inputDGunNo.value.clear();
    this.inputDGClass.value.clear();
    this.inputNoteRequest.value.clear();
    this.boolErrorAdd = false.obs;
    this.boolErrorBookingRequest = true.obs;
    this.countRowContainer = 0.obs;
    this.listInfoContainer = <Volumes>[].obs;
    this.listInfoDepo = <Depots>[
      Depots(
        depotId: '',
        depotName: '',
        sizeConts: '',
        volumeConts: '',
      )
    ].obs;
  }
}
