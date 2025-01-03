import 'dart:convert';
// import 'package:excel/excel.dart';
import 'package:get/get.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';
import 'package:web_booking/constants/global.dart';
import 'package:http/http.dart' as http;
import 'package:web_booking/utils/getx_route.dart';

class HistoryList {
  String? historyCheckContsId;
  String? cntrno;
  String? size;
  String? soLanKetHop;
  String? numKh;
  int? numCp;
  String? chatLuong;
  String? status;
  String? shipper;
  String? ketQua;
  String? remark;
  String? updateTime;
  String? acc;
  bool? isImgUpload;

  HistoryList(
      {this.historyCheckContsId,
      this.cntrno,
      this.size,
      this.soLanKetHop,
      this.numKh,
      this.numCp,
      this.chatLuong,
      this.status,
      this.shipper,
      this.ketQua,
      this.remark,
      this.updateTime,
      this.acc,
      this.isImgUpload});

  HistoryList.fromJson(Map<String, dynamic> json) {
    historyCheckContsId = json['historyCheckContsId'];
    cntrno = json['cntrno'];
    size = json['size'];
    soLanKetHop = json['soLanKetHop'];
    numKh = json['numKh'];
    numCp = json['numCp'];
    chatLuong = json['chatLuong'];
    status = json['status'];
    shipper = json['shipper'];
    ketQua = json['ketQua'];
    remark = json['remark'];
    updateTime = json['updateTime'];
    acc = json['acc'];
    isImgUpload = json['isImgUpload'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['historyCheckContsId'] = this.historyCheckContsId;
    data['cntrno'] = this.cntrno;
    data['size'] = this.size;
    data['soLanKetHop'] = this.soLanKetHop;
    data['numKh'] = this.numKh;
    data['numCp'] = this.numCp;
    data['chatLuong'] = this.chatLuong;
    data['status'] = this.status;
    data['shipper'] = this.shipper;
    data['ketQua'] = this.ketQua;
    data['remark'] = this.remark;
    data['updateTime'] = this.updateTime;
    data['acc'] = this.acc;
    data['isImgUpload'] = this.isImgUpload;
    return data;
  }

  DataGridRow getDataGridRow_History() {
    return DataGridRow(cells: [
      DataGridCell<String>(
          columnName: 'isImgUpload'.tr, value: isImgUpload.toString()),
      DataGridCell<String>(columnName: 'cntrno'.tr, value: cntrno),
      DataGridCell<String>(columnName: 'size'.tr, value: size),
      DataGridCell<String>(columnName: 'chatLuong'.tr, value: chatLuong),
      DataGridCell<String>(columnName: 'soLanKetHop'.tr, value: soLanKetHop),
      DataGridCell<String>(columnName: 'numCp'.tr, value: numCp.toString()),
      DataGridCell<String>(columnName: 'status'.tr, value: status),
      DataGridCell<String>(columnName: 'shipper'.tr, value: shipper),
      DataGridCell<String>(columnName: 'remark'.tr, value: remark),
      DataGridCell<String>(columnName: 'ketQua'.tr, value: ketQua),
      DataGridCell<String>(columnName: 'sender'.tr, value: acc),
      DataGridCell<String>(columnName: 'updateTime'.tr, value: updateTime),
    ]);
  }

  Future<List<HistoryList>> fetchHistoryList(
      {required String fromDate, required String toDate}) async {
    try {
      var url = '$SERVER/History/GetHistory?fromDay=$fromDate&toDay=$toDate';
      final response = await http.get(Uri.parse(url), headers: {
        "Access-Control-Allow-Origin": "*",
      });
      switch (response.statusCode) {
        case 200:
          var body = response.body;
          // print(body);
          print('Data List History');
          List dataHistoryList = json.decode(body);
          return dataHistoryList
              .map((data) => HistoryList.fromJson(data))
              .toList();
        case 401:
          Get.toNamed(GetRoutes.SignIn);
          throw Exception(response.reasonPhrase! + ' Data History');
        default:
          throw Exception(response.reasonPhrase! + ' Data History');
      }
    } on Exception catch (e) {
      throw Exception('Error fetch History - $e');
    }
  }

  Future<List<HistoryList>> fetchHistoryShipperList(
      {required String shipperId,
      required String fromDate,
      required String toDate}) async {
    try {
      var url =
          '$SERVER/History/GetByUser?id=$shipperId&fromDay=$fromDate&toDay=$toDate';
      final response = await http.get(Uri.parse(url), headers: {
        "Access-Control-Allow-Origin": "*",
      });
      switch (response.statusCode) {
        case 200:
          var body = response.body;
          // print(body);
          print('Data List Shipper History');
          List dataHistoryList = json.decode(body);
          return dataHistoryList
              .map((data) => HistoryList.fromJson(data))
              .toList();
        case 401:
          Get.toNamed(GetRoutes.SignIn);
          throw Exception(response.reasonPhrase! + ' Data History Shipper');
        default:
          throw Exception(response.reasonPhrase! + ' Data History Shipper');
      }
    } on Exception catch (e) {
      throw Exception('Error fetch History - $e');
    }
  }
}
