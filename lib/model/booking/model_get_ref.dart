import 'dart:convert';

import 'package:web_booking/constants/global.dart';
import 'package:http/http.dart' as http;

class GetRef {
  String? refId;
  String? refNo;
  String? portLoadId;
  String? portDischargeId;
  String? startDate;
  String? endDate;
  String? size;
  String? type;
  String? status;
  int? price;
  bool? coc;
  bool? dg;
  String? weightCondition;

  GetRef({
    this.refId,
    this.refNo,
    this.portLoadId,
    this.portDischargeId,
    this.startDate,
    this.endDate,
    this.size,
    this.type,
    this.status,
    this.price,
    this.coc,
    this.dg,
    this.weightCondition,
  });

  GetRef.fromJson(Map<String, dynamic> json) {
    refId = json['refId'];
    refNo = json['refNo'];
    portLoadId = json['portLoadId'];
    portDischargeId = json['portDischargeId'];
    startDate = json['startDate'];
    endDate = json['endDate'];
    size = json['size'];
    type = json['type'];
    status = json['status'];
    price = json['price'];
    coc = json['coc'];
    dg = json['dg'];
    weightCondition = json['weightCondition'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['refId'] = this.refId;
    data['refNo'] = this.refNo;
    data['portLoadId'] = this.portLoadId;
    data['portDischargeId'] = this.portDischargeId;
    data['startDate'] = this.startDate;
    data['endDate'] = this.endDate;
    data['size'] = this.size;
    data['type'] = this.type;
    data['status'] = this.status;
    data['price'] = this.price;
    data['coc'] = this.coc;
    data['dg'] = this.dg;
    data['weightCondition'] = this.weightCondition;
    return data;
  }

  Future<List<GetRef>> fetchGetRef(
      {required String shipperId,
      required String polLocId,
      required String podLocId,
      required String date}) async {
    try {
      var url =
          '$SERVER/NewBooking/GetRef?shipperId=$shipperId&pOLLocId=$polLocId&pODLocId=$podLocId&eTD=$date';
      Map<String, String> data = {
        'shipperId': shipperId,
        'pOLLocId': polLocId,
        'pODLocId': podLocId,
        'eTD': date
      };
      var body = json.encode(data);
      final response = await http.post(Uri.parse(url),
          headers: {
            "Content-Type": "application/json",
          },
          body: body);
      switch (response.statusCode) {
        case 200:
          var body = response.body;
          print(body);
          print('Data Ref Success');
          List dataRef = json.decode(body);
          // box.write(refList_signin_json, dataRef);
          return dataRef.map((data) => GetRef.fromJson(data)).toList();
        default:
          throw Exception(response.reasonPhrase);
      }
    } on Exception catch (e) {
      throw Exception(e);
    }
  }
}
