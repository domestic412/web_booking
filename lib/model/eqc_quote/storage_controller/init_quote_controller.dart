import 'package:flutter/material.dart';
import 'package:get/get.dart';

final QuoteController quoteController = Get.put(QuoteController());

class QuoteController extends GetxController {
var port_select = TextEditingController().obs;
var portDepotId = ''.obs;

var quoteNo = TextEditingController().obs;

var currency_select = TextEditingController().obs;
var currency = ''.obs;

var exRate = TextEditingController().obs;
}