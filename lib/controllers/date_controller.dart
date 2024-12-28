import 'package:get/get.dart';
import 'package:get/state_manager.dart';

final DateController dateController = Get.put(DateController());

class DateController extends GetxController {
  var fromDate_show = ''.obs;
  var toDate_show = ''.obs;

  var fromDate_send = ''.obs;
  var toDate_send = ''.obs;

  RxMap fileImageCombine = Map<dynamic, dynamic>().obs;
}
