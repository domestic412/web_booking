import 'package:flutter/material.dart';
import 'package:get/get.dart';

final ImageController imageController = Get.put(ImageController());

class ImageController extends GetxController {
  RxInt id = 0.obs;

  void updateIdImageController({@required id}) {
    this.id = id;
  }
}
