import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:web_booking/constants/global.dart';
import 'package:web_booking/constants/variable.dart';

class Ports {
  String? portId;
  String? portName;

  Ports({this.portId, this.portName});

  Ports.fromJson(Map<String, dynamic> json) {
    portId = json['portId'];
    portName = json['portName'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['portId'] = this.portId;
    data['portName'] = this.portName;
    return data;
  }

  Future<List<Ports>> fetchPorts() async {
    try {
      var url = ServerPorts;
      final response = await http
          .get(Uri.parse(url), headers: {"Content-Type": "application/json"});
      switch (response.statusCode) {
        case 200:
          var body = response.body;
          dataPorts = json.decode(body);
          return dataPorts.map((data) => Ports.fromJson(data)).toList();
        default:
          throw Exception(response.reasonPhrase);
      }
    } on Exception catch (e) {
      throw Exception('Error fetch Ports - $e');
    }
  }
}
