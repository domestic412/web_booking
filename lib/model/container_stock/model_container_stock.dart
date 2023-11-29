import 'dart:convert';

import 'package:web_booking/constants/global.dart';
import 'package:http/http.dart' as http;
import 'package:web_booking/page/signin/controller.dart/info_signin_controller.dart';

class ContainerStock {
  int? id;
  Null? seq;
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
  String? quanlity;
  String? checkRemark;
  Null? checkDetKh;
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
      this.quanlity,
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
    quanlity = json['quanlity'];
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
    data['quanlity'] = this.quanlity;
    data['checkRemark'] = this.checkRemark;
    data['checkDetKh'] = this.checkDetKh;
    data['updateTime'] = this.updateTime;
    data['updateUser'] = this.updateUser;
    return data;
  }

  Future<List<ContainerStock>> fetchContainerStock() async {
    try {
      var url = URL_CONTAINER_STOCK;
      final response = await http.get(Uri.parse(url), headers: {
        "Access-Control-Allow-Origin": "*",
        "Authorization": "Bearer ${informationController.authorize.value}",
      });
      switch (response.statusCode) {
        case 200:
          var body = response.body;
          print('Data Stock');
          List dataContainerStock = json.decode(body);
          return dataContainerStock
              .map((data) => ContainerStock.fromJson(data))
              .toList();
        default:
          throw Exception(response.reasonPhrase);
      }
    } on Exception catch (e) {
      throw Exception(e);
    }
  }
}
