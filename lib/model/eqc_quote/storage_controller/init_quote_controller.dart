import 'package:flutter/material.dart';
import 'package:get/get.dart';

final QuoteController quoteController = Get.put(QuoteController());

class QuoteController extends GetxController {
// var port_select = TextEditingController().obs;
var portDepotId = ''.obs;

var quoteNo = TextEditingController().obs;

// var currency_select = TextEditingController().obs;
var currency = ''.obs;

var exRate = TextEditingController().obs;

var chargeTypeId = ''.obs;

var container = TextEditingController().obs;

var gateInDate = TextEditingController().obs;

var componentId = ''.obs;

var detailDamage = TextEditingController().obs;

var errorId = ''.obs;

var quantity = TextEditingController().obs;

var dimension = TextEditingController().obs;

var length = TextEditingController().obs;

var width = TextEditingController().obs;

var location = TextEditingController().obs;

var categoryId = ''.obs;

var laborCost = TextEditingController().obs;

var mrCost = TextEditingController().obs;

var totalCost = TextEditingController().obs;

var payerId = 0.obs;
}