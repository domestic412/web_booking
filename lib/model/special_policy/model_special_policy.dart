import 'dart:convert';

import 'package:web_booking/constants/global.dart';
import 'package:web_booking/constants/variable.dart';
import 'package:http/http.dart' as http;

class ListSpecialPolicy {
  int? id;
  String? code;
  String? shipper;
  String? times;
  String? updateTime;
  String? updateUser;

  ListSpecialPolicy(
      {this.id,
      this.code,
      this.shipper,
      this.times,
      this.updateTime,
      this.updateUser});

  ListSpecialPolicy.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    code = json['code'];
    shipper = json['shipper'];
    times = json['times'];
    updateTime = json['updateTime'];
    updateUser = json['updateUser'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['code'] = this.code;
    data['shipper'] = this.shipper;
    data['times'] = this.times;
    data['updateTime'] = this.updateTime;
    data['updateUser'] = this.updateUser;
    return data;
  }

  Future<List<ListSpecialPolicy>> fetchListSpecialPolicy() async {
    var url = '$SERVER/SpecialPolicy/GetAll';
    final response = await http.get(Uri.parse(url), headers: {
      "Access-Control-Allow-Origin": "*",
      "Access-Control-Allow-Methods": "GET", //use fot http, not use https
      "Authorization": "Bearer $tokenAuthorize",
    });
    // print(tokenAuthorize);
    if (response.statusCode == 200) {
      var body = response.body;
      print('Data List Quality');
      List dataListSpecialPolicy = json.decode(body);
      return dataListSpecialPolicy
          .map((data) => ListSpecialPolicy.fromJson(data))
          .toList();
    } else {
      throw Exception('Error');
    }
  }
}
