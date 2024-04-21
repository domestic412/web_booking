import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:web_booking/model/booking_confirm/model_loading_booking_detail.dart';

LoadingBookingDetail loadingBookingDetail = Get.put(LoadingBookingDetail());

class LoadingBookingDetail extends GetxController {
  //list booking confirm
  var bookingId = ''.obs;

  //data send
  var bkno_controller = TextEditingController().obs;
  var confirmDepotId = ''.obs;
  var lstBKDetail = ''.obs;

//load booking detail
  //infoDetail
  RxList<InforDetail> inforDetail = <InforDetail>[].obs;

  //commoditieDetail
  RxList<CommoditieDetail> commoditieDetail = <CommoditieDetail>[].obs;

  //refDetails
  RxList<RefDetails> refDetails = <RefDetails>[].obs;

  //depAvaModel
  RxList<DepAvaModel> depAvaModel = <DepAvaModel>[].obs;

  //depAvaModel
  RxList<DepOnOfficeModel> depOnOfficeModel = <DepOnOfficeModel>[].obs;
}
