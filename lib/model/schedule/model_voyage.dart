import 'dart:convert';
import 'package:http/http.dart' as http;

import 'package:web_booking/constants/global.dart';
import 'package:web_booking/constants/variable.dart';

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
    try {
      var url = '$SERVER/Booking?pOLLocId=$pol&pODLocId=$pod&eTD=$etd';
      var data = {'pOLLocId': pol, 'pODLocId': pod, 'eTD': etd};
      var body = json.encode(data);
      if (pol.isNotEmpty & pod.isNotEmpty & etd.isNotEmpty) {
        final response = await http.post(Uri.parse(url),
            headers: {"Content-Type": "application/json"}, body: body);
        switch (response.statusCode) {
          case 200:
            var body = response.body;
            // print(body);
            // print('Data Voyage');
            // // convert json to list and return function
            // List dataVoyage = json.decode(body);
            // return dataVoyage.map((data) => Voyage.fromJson(data)).toList();
            final dataVoyage = json.decode(body);
            // print(dataVoyage);
            box.write(depotsList_booking, dataVoyage['depots']);

            return Voyage.fromJson(dataVoyage);
          default:
            throw Exception(response.reasonPhrase);
        }
      } else {
        throw Exception('Error');
      }
    } on Exception catch (e) {
      throw Exception('Error fetch Data Voyage - $e');
    }
  }
}

class ListBookingVoys {
  String? voyDetail;
  String? etd;
  String? voyId;
  String? vesselName;
  String? pol;
  String? pod;
  String? polId;
  String? podId;

  ListBookingVoys(
      {this.voyDetail,
      this.etd,
      this.voyId,
      this.vesselName,
      this.pol,
      this.pod,
      this.polId,
      this.podId});

  ListBookingVoys.fromJson(Map<String, dynamic> json) {
    voyDetail = json['voyDetail'];
    etd = json['etd'];
    voyId = json['voyId'];
    vesselName = json['vesselName'];
    pol = json['pol'];
    pod = json['pod'];
    polId = json['polId'];
    podId = json['podId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['voyDetail'] = this.voyDetail;
    data['etd'] = this.etd;
    data['voyId'] = this.voyId;
    data['vesselName'] = this.vesselName;
    data['pol'] = this.pol;
    data['pod'] = this.pod;
    data['polId'] = this.polId;
    data['podId'] = this.podId;
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
