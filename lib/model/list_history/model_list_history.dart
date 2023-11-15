import 'dart:convert';

import 'package:web_booking/constants/global.dart';
import 'package:http/http.dart' as http;
import 'package:web_booking/constants/variable.dart';

class History {
  int? id;
  String? cntrno;
  String? size;
  String? soLanKetHop;
  String? numKh;
  String? numCp;
  String? chatLuong;
  String? status;
  String? shipper;
  String? ketQua;
  String? updateTime;
  String? acc;

  History(
      {this.id,
      this.cntrno,
      this.size,
      this.soLanKetHop,
      this.numKh,
      this.numCp,
      this.chatLuong,
      this.status,
      this.shipper,
      this.ketQua,
      this.updateTime,
      this.acc});

  History.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    cntrno = json['cntrno'];
    size = json['size'];
    soLanKetHop = json['soLanKetHop'];
    numKh = json['numKh'];
    numCp = json['numCp'];
    chatLuong = json['chatLuong'];
    status = json['status'];
    shipper = json['shipper'];
    ketQua = json['ketQua'];
    updateTime = json['updateTime'];
    acc = json['acc'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['cntrno'] = this.cntrno;
    data['size'] = this.size;
    data['soLanKetHop'] = this.soLanKetHop;
    data['numKh'] = this.numKh;
    data['numCp'] = this.numCp;
    data['chatLuong'] = this.chatLuong;
    data['status'] = this.status;
    data['shipper'] = this.shipper;
    data['ketQua'] = this.ketQua;
    data['updateTime'] = this.updateTime;
    data['acc'] = this.acc;
    return data;
  }

  Future<List<History>> fetchListHistory() async {
    var url = URL_HISTORY;
    final response = await http.get(Uri.parse(url), headers: {
      "Access-Control-Allow-Origin": "*",
      "Authorization": "Bearer $tokenAuthorize",
    });
    if (response.statusCode == 200) {
      var body = response.body;
      print('Data List History');
      List dataListHistory = json.decode(body);
      return dataListHistory.map((data) => History.fromJson(data)).toList();
    } else {
      throw Exception('Error');
    }
  }
}
