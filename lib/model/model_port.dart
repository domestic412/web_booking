import 'dart:convert';

import '../assets/constants/global.dart';
import 'package:http/http.dart' as http;

import '../assets/constants/variable.dart';

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
  var url = ServerPorts;
  final response = await http.get(Uri.parse(url), headers:{"Content-Type": "application/json"});
  if (response.statusCode == 200) {
    var body = response.body;
    print(body);
      dataPorts = json.decode(body);
    return dataPorts.map((data) => Ports.fromJson(data)).toList();
  } else {
    throw Exception('Error ');
  }
}
}

