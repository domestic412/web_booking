import 'package:flutter/material.dart';
import 'package:get/get.dart';

final ImageController imageController = Get.put(ImageController());

class ImageController extends GetxController {
  var id = ''.obs;

  void updateIdImageController({@required id}) {
    this.id = id;
  }
}
