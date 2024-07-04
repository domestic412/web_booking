

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/state_manager.dart';

final ExportHistoryController exportHistoryController = Get.put(ExportHistoryController());

class ExportHistoryController extends GetxController{
  var fromDate = TextEditingController().obs;
  var toDate = TextEditingController().obs;

  var fromDate_send = ''.obs;
  var toDate_send = ''.obs;
}