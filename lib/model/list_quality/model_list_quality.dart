import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:web_booking/constants/global.dart';
import 'package:web_booking/constants/variable.dart';

class ListQuality {
  int? id;
  String? maChatLuong;
  String? tenChatLuong;
  String? ghiChu;
  String? updateTime;
  String? updateUser;

  ListQuality(
      {this.id,
      this.maChatLuong,
      this.tenChatLuong,
      this.ghiChu,
      this.updateTime,
      this.updateUser});

  ListQuality.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    maChatLuong = json['maChatLuong'];
    tenChatLuong = json['tenChatLuong'];
    ghiChu = json['ghiChu'];
    updateTime = json['updateTime'];
    updateUser = json['updateUser'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['maChatLuong'] = this.maChatLuong;
    data['tenChatLuong'] = this.tenChatLuong;
    data['ghiChu'] = this.ghiChu;
    data['updateTime'] = this.updateTime;
    data['updateUser'] = this.updateUser;
    return data;
  }

  Future<List<ListQuality>> fetchListQuality() async {
    var url = '$SERVER/QualityList/GetAll';
    final response = await http.get(Uri.parse(url), headers: {
      "Access-Control-Allow-Origin": "*",
      "Access-Control-Allow-Methods": "GET", //use fot http, not use https
      "Authorization": "Bearer $tokenAuthorize",
    });
    // print(tokenAuthorize);
    if (response.statusCode == 200) {
      var body = response.body;
      print('Data List Quality');
      List dataListQuality = json.decode(body);
      return dataListQuality.map((data) => ListQuality.fromJson(data)).toList();
    } else {
      throw Exception('Error');
    }
  }
}
