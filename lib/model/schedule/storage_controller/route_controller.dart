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

  //data location
  var pol = ''.obs;
  var polID = ''.obs;
  var pod = ''.obs;
  var podID = ''.obs;

  //data pol pod
  var pol_final = ''.obs;
  var polId_final = ''.obs;
  // var pod_final = ''.obs;
  var podId_final = ''.obs;

  void updateRouteController({
    @required vessel,
    @required voy,
    @required date,
    @required pol_final,
    @required polId_final,
    @required podId_final,
  }) {
    this.vessel.value = vessel;
    this.voy.value = voy;
    this.date.value = date;
    this.pol_final.value = pol_final;
    this.polId_final.value = polId_final;
    this.podId_final.value = podId_final;
  }
}
