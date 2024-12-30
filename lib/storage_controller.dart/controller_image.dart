import 'package:get/get.dart';

final ImageController imageController = Get.put(ImageController());

class ImageController extends GetxController {
  var id = ''.obs;
  RxInt i = 0.obs;
}
