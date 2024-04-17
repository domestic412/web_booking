import 'dart:convert';
import 'package:http/http.dart' as http;

import 'package:web_booking/constants/global.dart';

class ListBookingConfirm {
  String? bookingId;
  String? bookingNo;

  ListBookingConfirm({this.bookingId, this.bookingNo});

  ListBookingConfirm.fromJson(Map<String, dynamic> json) {
    bookingId = json['bookingId'];
    bookingNo = json['bookingNo'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['bookingId'] = this.bookingId;
    data['bookingNo'] = this.bookingNo;
    return data;
  }

  Future<List<ListBookingConfirm>> fetchDataListBookingConfirm(
      {required String officeId}) async {
    try {
      var url = URL_GET_BOOKING_CONFIRM;
      Map<String, String> data = {
        'officeId': officeId,
        'globalRight': '',
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
          print('Data List Booking Confirm');
          List dataListBookingConfirm = json.decode(body);
          return dataListBookingConfirm
              .map((data) => ListBookingConfirm.fromJson(data))
              .toList();
        default:
          throw Exception(response.reasonPhrase);
      }
    } on Exception catch (e) {
      throw Exception(e);
    }
  }
}
