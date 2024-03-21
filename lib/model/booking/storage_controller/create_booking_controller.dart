import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:web_booking/model/booking/model_create_booking.dart';

final CreateBookingController createBookingController =
    Get.put(CreateBookingController());

class CreateBookingController extends GetxController {
  var vessel = ''.obs;
  var route = ''.obs;

  var consignee_controller = TextEditingController().obs;
  var consigneeId = ''.obs;

  var ref_controller = TextEditingController().obs;
  var refId = ''.obs;

  var term_controller = TextEditingController().obs;
  var term = ''.obs;

  var listPaymentTerm = ['PREPAID', 'COLLECT', 'COD'].obs;
  var paymentTerm = ''.obs;

  var optionsContainer = [true, false].obs;
  var coc = true.obs;

  var commodity_controller = TextEditingController().obs;
  var commodityId = ''.obs;

  var listSizeContainer = ['20', '40', '45', '53'].obs;
  var size = '20'.obs;

  var listType =
      ['DC', 'HC', 'RF', 'RH', 'HQ', 'GP', 'OT', 'OH', 'TK', 'FR'].obs;
  var type = 'DC'.obs;

  var listTypeContainer = ['DRY', 'REEFER'].obs;
  var currentTypeContainer = ''.obs;
  var reefer = false.obs;
  var temp_controller = TextEditingController().obs;

  var listStatusContainer = ['F', 'E'].obs;
  var status = 'F'.obs;

  var checkPrice = 0.obs;

  var volume_controller = TextEditingController().obs;
  var weight_controller = TextEditingController().obs;

  var dg = false.obs;
  var dgRemark_controller = TextEditingController().obs;

  var remark = TextEditingController().obs;

  var boolErrorAdd = false.obs;
  var boolErrorBookingRequest = true.obs;

  var countRowContainer = 0.obs;

  var edit = 'I'.obs;

  RxList<BookingDetails> listInfoContainer = <BookingDetails>[].obs;
}
