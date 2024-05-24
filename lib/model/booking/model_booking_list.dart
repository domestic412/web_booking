import 'dart:convert';
import 'package:web_booking/constants/global.dart';
import 'package:http/http.dart' as http;

class BookingList {
  int? seq;
  String? payer;
  String? shipperName;
  String? shipper;
  String? consignee;
  String? notifyParty;
  String? shipName;
  String? voyId;
  String? fromDate;
  String? toDate;
  String? bookingNo;
  String? bookingDate;
  String? lineCode;
  String? bookingId;
  String? fromLo1;
  String? toLo1;
  String? finalDest;
  String? agent;
  String? coc;
  String? portLoad;
  String? vessel1St;
  String? voyage1St;
  String? etD1St;
  String? userName;
  bool? confirmed;
  String? blNo;
  String? depotName;
  String? commodity;
  int? cont20;
  int? cont40;
  int? cont45;

  BookingList(
      {this.seq,
      this.payer,
      this.shipperName,
      this.shipper,
      this.consignee,
      this.notifyParty,
      this.shipName,
      this.voyId,
      this.fromDate,
      this.toDate,
      this.bookingNo,
      this.bookingDate,
      this.lineCode,
      this.bookingId,
      this.fromLo1,
      this.toLo1,
      this.finalDest,
      this.agent,
      this.coc,
      this.portLoad,
      this.vessel1St,
      this.voyage1St,
      this.etD1St,
      this.userName,
      this.confirmed,
      this.blNo,
      this.depotName,
      this.commodity,
      this.cont20,
      this.cont40,
      this.cont45});

  BookingList.fromJson(Map<String, dynamic> json) {
    seq = json['seq'];
    payer = json['payer'];
    shipperName = json['shipperName'];
    shipper = json['shipper'];
    consignee = json['consignee'];
    notifyParty = json['notifyParty'];
    shipName = json['shipName'];
    voyId = json['voyId'];
    fromDate = json['fromDate'];
    toDate = json['toDate'];
    bookingNo = json['bookingNo'];
    bookingDate = json['bookingDate'];
    lineCode = json['lineCode'];
    bookingId = json['bookingId'];
    fromLo1 = json['fromLo1'];
    toLo1 = json['toLo1'];
    finalDest = json['finalDest'];
    agent = json['agent'];
    coc = json['coc'];
    portLoad = json['portLoad'];
    vessel1St = json['vessel1St'];
    voyage1St = json['voyage1St'];
    etD1St = json['etD1St'];
    userName = json['userName'];
    confirmed = json['confirmed'];
    blNo = json['blNo'];
    depotName = json['depotName'];
    commodity = json['commodity'];
    cont20 = json['cont20'];
    cont40 = json['cont40'];
    cont45 = json['cont45'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['seq'] = this.seq;
    data['payer'] = this.payer;
    data['shipperName'] = this.shipperName;
    data['shipper'] = this.shipper;
    data['consignee'] = this.consignee;
    data['notifyParty'] = this.notifyParty;
    data['shipName'] = this.shipName;
    data['voyId'] = this.voyId;
    data['fromDate'] = this.fromDate;
    data['toDate'] = this.toDate;
    data['bookingNo'] = this.bookingNo;
    data['bookingDate'] = this.bookingDate;
    data['lineCode'] = this.lineCode;
    data['bookingId'] = this.bookingId;
    data['fromLo1'] = this.fromLo1;
    data['toLo1'] = this.toLo1;
    data['finalDest'] = this.finalDest;
    data['agent'] = this.agent;
    data['coc'] = this.coc;
    data['portLoad'] = this.portLoad;
    data['vessel1St'] = this.vessel1St;
    data['voyage1St'] = this.voyage1St;
    data['etD1St'] = this.etD1St;
    data['userName'] = this.userName;
    data['confirmed'] = this.confirmed;
    data['blNo'] = this.blNo;
    data['depotName'] = this.depotName;
    data['commodity'] = this.commodity;
    data['cont20'] = this.cont20;
    data['cont40'] = this.cont40;
    data['cont45'] = this.cont45;
    return data;
  }

  Future<List<BookingList>> fetchDataBookingList({
    required String shipperId,
    required String fromDate,
    required String toDate,
  }) async {
    try {
      var url =
          '$SERVER/NewBooking/GetBookingByUser?shipperId=$shipperId&fromDate=$fromDate&toDate=$toDate';
      Map<String, String> data = {
        'shipperId': shipperId,
        'fromDate': fromDate,
        'toDate': toDate,
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
          print('Data Booking List');
          List dataBookingList = json.decode(body);
          return dataBookingList
              .map((data) => BookingList.fromJson(data))
              .toList();
        default:
          throw Exception(response.reasonPhrase);
      }
    } on Exception catch (e) {
      throw Exception(e);
    }
  }
}
