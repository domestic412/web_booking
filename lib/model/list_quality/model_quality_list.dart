import 'dart:convert';
import 'dart:math';

import 'package:http/http.dart' as http;
import 'package:web_booking/constants/global.dart';
import 'package:web_booking/constants/variable.dart';
import 'package:web_booking/page/signin/controller.dart/info_signin_controller.dart';

class QualityList {
  int? id;
  String? maChatLuong;
  String? tenChatLuong;
  String? ghiChu;
  String? updateTime;
  String? updateUser;

  QualityList(
      {this.id,
      this.maChatLuong,
      this.tenChatLuong,
      this.ghiChu,
      this.updateTime,
      this.updateUser});

  QualityList.fromJson(Map<String, dynamic> json) {
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

  Future<List<QualityList>> fetchQualityList() async {
    try {
      var url = '$SERVER/QualityList/GetAll';
      final response = await http.get(Uri.parse(url), headers: {
        "Access-Control-Allow-Origin": "*",
        "Access-Control-Allow-Methods": "GET", //use fot http, not use https
        "Authorization": "Bearer ${informationController.authorize.value}",
      });
      if (response.statusCode == 200) {
        var body = response.body;
        print('Data List Quality');
        List dataQualityList = json.decode(body);
        return dataQualityList
            .map((data) => QualityList.fromJson(data))
            .toList();
      } else {
        throw Exception('Error');
      }
    } on Exception catch (e) {
      throw Exception('Error fetch Quality - $e');
    }
  }
}
