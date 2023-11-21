import 'dart:convert';
import 'package:http/http.dart' as http;

import 'package:web_booking/constants/global.dart';

class Voyage {
  List<ListBookingVoys>? listBookingVoys;
  List<Depots>? depots;

  Voyage({this.listBookingVoys, this.depots});

  Voyage.fromJson(Map<String, dynamic> json) {
    if (json['listBookingVoys'] != null) {
      listBookingVoys = <ListBookingVoys>[];
      json['listBookingVoys'].forEach((v) {
        listBookingVoys!.add(new ListBookingVoys.fromJson(v));
      });
    }
    if (json['depots'] != null) {
      depots = <Depots>[];
      json['depots'].forEach((v) {
        depots!.add(new Depots.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.listBookingVoys != null) {
      data['listBookingVoys'] =
          this.listBookingVoys!.map((v) => v.toJson()).toList();
    }
    if (this.depots != null) {
      data['depots'] = this.depots!.map((v) => v.toJson()).toList();
    }
    return data;
  }

  Future<Voyage> fetchDataVoyage(String pol, String pod, String etd) async {
    var url = '$SERVER/Booking?POLId=$pol&PODId=$pod&ETD=$etd';
    var data = {'POLId': pol, 'PODId': pod, 'ETD': etd};
    var body = json.encode(data);
    if (pol.isNotEmpty & pod.isNotEmpty & etd.isNotEmpty) {
      final response = await http.post(Uri.parse(url),
          headers: {"Content-Type": "application/json"}, body: body);
      if (response.statusCode == 200) {
        var body = response.body;
        print('Data Voyage');
        // // convert json to list and return function
        // List dataVoyage = json.decode(body);
        // return dataVoyage.map((data) => Voyage.fromJson(data)).toList();
        final dataVoyage = json.decode(body);
        return Voyage.fromJson(dataVoyage);
      } else
        throw Exception('Error');
    } else {
      throw Exception('Error');
    }
  }
}

class ListBookingVoys {
  String? voyDetail;
  String? etd;
  String? voyId;
  String? vesselName;
  String? pol;

  ListBookingVoys(
      {this.voyDetail, this.etd, this.voyId, this.vesselName, this.pol});

  ListBookingVoys.fromJson(Map<String, dynamic> json) {
    voyDetail = json['voyDetail'];
    etd = json['etd'];
    voyId = json['voyId'];
    vesselName = json['vesselName'];
    pol = json['pol'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['voyDetail'] = this.voyDetail;
    data['etd'] = this.etd;
    data['voyId'] = this.voyId;
    data['vesselName'] = this.vesselName;
    data['pol'] = this.pol;
    return data;
  }
}

class Depots {
  String? depotId;
  String? depotName;
  int? soluong;
  String? size;

  Depots({this.depotId, this.depotName, this.soluong, this.size});

  Depots.fromJson(Map<String, dynamic> json) {
    depotId = json['depotId'];
    depotName = json['depotName'];
    soluong = json['soluong'];
    size = json['size'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['depotId'] = this.depotId;
    data['depotName'] = this.depotName;
    data['soluong'] = this.soluong;
    data['size'] = this.size;
    return data;
  }
}
