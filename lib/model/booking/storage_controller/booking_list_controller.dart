import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/state_manager.dart';

BookingListController bookingListController = Get.put(BookingListController());

class BookingListController extends GetxController {
  var fromDate_select = TextEditingController().obs;
  var fromDate = ''.obs;

  var toDate_select = TextEditingController().obs;
  var toDate = ''.obs;
}
