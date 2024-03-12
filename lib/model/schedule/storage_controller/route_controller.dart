import 'package:flutter/material.dart';
import 'package:get/get.dart';

final RouteController routeController = Get.put(RouteController());

class RouteController extends GetxController {
  var dateSelect = ''.obs;
  var port1 = ''.obs;
  var port2 = ''.obs;
  var port_select1 = TextEditingController().obs;
  var port_select2 = TextEditingController().obs;
  var date_select = TextEditingController().obs;

  var vessel = ''.obs;
  var voy = ''.obs;
  var date = ''.obs;
  var pol = ''.obs;
  var polID = ''.obs;
  var pod = ''.obs;
  var podID = ''.obs;

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
