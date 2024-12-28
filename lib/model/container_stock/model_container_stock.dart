import 'dart:convert';

import 'package:get/get.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';
import 'package:web_booking/constants/global.dart';
import 'package:http/http.dart' as http;
import 'package:web_booking/utils/getx_route.dart';

class ContainerStock {
  int? id;
  String? seq;
  String? cntrno;
  String? sizeType;
  String? shipper;
  String? dateFullOut;
  String? dateEmptyOut;
  String? dateFullArrived;
  String? terminal;
  String? combineStuffing;
  String? remark;
  String? shipVoy;
  String? status;
  String? quality;
  String? checkRemark;
  bool? checkDetKh;
  String? updateTime;
  String? updateUser;

  ContainerStock(
      {this.id,
      this.seq,
      this.cntrno,
      this.sizeType,
      this.shipper,
      this.dateFullOut,
      this.dateEmptyOut,
      this.dateFullArrived,
      this.terminal,
      this.combineStuffing,
      this.remark,
      this.shipVoy,
      this.status,
      this.quality,
      this.checkRemark,
      this.checkDetKh,
      this.updateTime,
      this.updateUser});

  ContainerStock.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    seq = json['seq'];
    cntrno = json['cntrno'];
    sizeType = json['sizeType'];
    shipper = json['shipper'];
    dateFullOut = json['dateFullOut'];
    dateEmptyOut = json['dateEmptyOut'];
    dateFullArrived = json['dateFullArrived'];
    terminal = json['terminal'];
    combineStuffing = json['combineStuffing'];
    remark = json['remark'];
    shipVoy = json['shipVoy'];
    status = json['status'];
    quality = json['quality'];
    checkRemark = json['checkRemark'];
    checkDetKh = json['checkDetKh'];
    updateTime = json['updateTime'];
    updateUser = json['updateUser'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['seq'] = this.seq;
    data['cntrno'] = this.cntrno;
    data['sizeType'] = this.sizeType;
    data['shipper'] = this.shipper;
    data['dateFullOut'] = this.dateFullOut;
    data['dateEmptyOut'] = this.dateEmptyOut;
    data['dateFullArrived'] = this.dateFullArrived;
    data['terminal'] = this.terminal;
    data['combineStuffing'] = this.combineStuffing;
    data['remark'] = this.remark;
    data['shipVoy'] = this.shipVoy;
    data['status'] = this.status;
    data['quality'] = this.quality;
    data['checkRemark'] = this.checkRemark;
    data['checkDetKh'] = this.checkDetKh;
    data['updateTime'] = this.updateTime;
    data['updateUser'] = this.updateUser;
    return data;
  }

  DataGridRow getDataGridRow_ContainerStock() {
    return DataGridRow(cells: [
      DataGridCell<String>(columnName: 'cntrno'.tr, value: cntrno),
      DataGridCell<String>(columnName: 'size'.tr, value: sizeType),
      DataGridCell<String>(columnName: 'quality'.tr, value: quality),
      DataGridCell<String>(columnName: 'status'.tr, value: status),
      DataGridCell<String>(columnName: 'shipVoy'.tr, value: shipVoy),
      DataGridCell<String>(columnName: 'dateEmptyOut'.tr, value: dateEmptyOut),
      DataGridCell<String>(
          columnName: 'dateFullArrived'.tr, value: dateFullArrived),
      DataGridCell<String>(columnName: 'dateFullOut'.tr, value: dateFullOut),
      DataGridCell<String>(columnName: 'terminal'.tr, value: terminal),
      DataGridCell<String>(
          columnName: 'combineStuffing'.tr, value: combineStuffing),
      DataGridCell<String>(columnName: 'shipper'.tr, value: shipper),
      DataGridCell<String>(
          columnName: 'checkDetKh'.tr, value: checkDetKh.toString()),
    ]);
  }

  Future<List<ContainerStock>> fetchContainerStock() async {
    try {
      var url = URL_CONTAINER_STOCK;
      final response = await http.get(Uri.parse(url), headers: {
        "Access-Control-Allow-Origin": "*",
      });
      switch (response.statusCode) {
        case 200:
          var body = response.body;
          print('Data Stock');
          List dataContainerStock = json.decode(body);
          return dataContainerStock
              .map((data) => ContainerStock.fromJson(data))
              .toList();
        case 401:
          Get.toNamed(GetRoutes.SignIn);
          throw Exception(response.reasonPhrase);
        default:
          throw Exception(response.reasonPhrase);
      }
    } on Exception catch (e) {
      throw Exception(e);
    }
  }
}
