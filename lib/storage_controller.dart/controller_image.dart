import 'package:get/get.dart';
import 'package:web_booking/constants/color.dart';

final ImageController imageController = Get.put(ImageController());

class ImageController extends GetxController {
  var id = ''.obs;
  var color = grey.obs;
  RxInt i = 0.obs;
}
