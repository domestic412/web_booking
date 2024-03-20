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
  var pOLLoc = ''.obs;
  var pOLLocId = ''.obs;
  var pODLoc = ''.obs;
  var pODLocId = ''.obs;

  //data pol pod
  var pol_final = ''.obs;
  var polId_final = ''.obs;
  var pod_final = ''.obs;
  var podId_final = ''.obs;

  var voyDetail = ''.obs;

  var depot_controller = TextEditingController().obs;
  var depotId = ''.obs;

  void updateRouteController({
    @required voyDetail,
    @required vessel,
    @required voy,
    @required date,
    @required pol_final,
    @required polId_final,
    @required pod_final,
    @required podId_final,
  }) {
    this.voyDetail.value = voyDetail;
    this.vessel.value = vessel;
    this.voy.value = voy;
    this.date.value = date;
    this.pol_final.value = pol_final;
    this.polId_final.value = polId_final;
    this.pod_final.value = pod_final;
    this.podId_final.value = podId_final;
  }
}
