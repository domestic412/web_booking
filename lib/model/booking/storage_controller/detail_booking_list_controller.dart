import 'package:get/get.dart';
import 'package:get/state_manager.dart';

DetailBookingListController detailBookingListController =
    Get.put(DetailBookingListController());

class DetailBookingListController extends GetxController {
  var payer = ''.obs;
  var shipperName = ''.obs;
  var shipper = ''.obs;
  var consignee = ''.obs;
  var notifyParty = ''.obs;
  var shipName = ''.obs;
  var voyId = ''.obs;
  var fromDate = ''.obs;
  var toDate = ''.obs;
  var bookingNo = ''.obs;
  var bookingDate = ''.obs;
  var finalDest = ''.obs;
  var coc = ''.obs;
  var portLoad = ''.obs;
  var confirmed = false.obs;
  var blNo = ''.obs;
  var commodity = ''.obs;
  var cont20 = 0.obs;
  var cont40 = 0.obs;
  var cont45 = 0.obs;

  void updateDetailBookingList({
    required String payer,
    required String shipperName,
    required String shipper,
    required String consignee,
    required String notifyParty,
    required String shipName,
    required String voyId,
    required String fromDate,
    required String toDate,
    required String bookingNo,
    required String bookingDate,
    required String finalDest,
    required String coc,
    required String portLoad,
    required bool confirmed,
    required String blNo,
    required String commodity,
    required int cont20,
    required int cont40,
    required int cont45,
  }) {
    this.payer.value = payer;
    this.shipperName.value = shipperName;
    this.shipper.value = shipper;
    this.consignee.value = consignee;
    this.notifyParty.value = notifyParty;
    this.shipName.value = shipName;
    this.voyId.value = voyId;
    this.fromDate.value = fromDate;
    this.toDate.value = toDate;
    this.bookingNo.value = bookingNo;
    this.bookingDate.value = bookingDate;
    this.finalDest.value = finalDest;
    this.coc.value = coc;
    this.portLoad.value = portLoad;
    this.confirmed.value = confirmed;
    this.blNo.value = blNo;
    this.commodity.value = commodity;
    this.cont20.value = cont20;
    this.cont40.value = cont40;
    this.cont45.value = cont45;
  }
}
