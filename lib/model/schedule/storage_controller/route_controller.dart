import 'package:flutter/material.dart';
import 'package:get/get.dart';

final RouteController routeController = Get.put(RouteController());

class RouteController extends GetxController {
  var vessel = ''.obs;
  var voy = ''.obs;
  var date = ''.obs;
  var pol = ''.obs;
  var pod = ''.obs;

  void updateRouteController({
    @required vessel,
    @required voy,
    @required date,
    @required pol,
    @required pod,
  }) {
    this.vessel.value = vessel;
    this.voy.value = voy;
    this.date.value = date;
    this.pol.value = pol;
    this.pod.value = pod;
  }
}
