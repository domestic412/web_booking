import 'dart:convert';

import 'package:web_booking/constants/global.dart';
import 'package:web_booking/page/signin/controller_signin.dart/info_signin_controller.dart';
import 'package:http/http.dart' as http;

import 'storage_controller/detail_booking_request_controller.dart';

class BookingRequest {
  int? id;
  String? date;
  String? vessel;
  String? voyage;
  String? payer;
  String? consignee;
  String? serviceTerm;
  String? term;
  String? paymentTerm;
  String? statusBooking;
  String? processUser;
  String? updateTime;
  String? noteRequestByUser;
  List<Volumes>? volumes;
  List<Depots>? depots;

  BookingRequest(
      {this.id,
      this.date,
      this.vessel,
      this.voyage,
      this.payer,
      this.consignee,
      this.serviceTerm,
      this.term,
      this.paymentTerm,
      this.statusBooking,
      this.processUser,
      this.updateTime,
      this.noteRequestByUser,
      this.volumes,
      this.depots});

  BookingRequest.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    date = json['date'];
    vessel = json['vessel'];
    voyage = json['voyage'];
    payer = json['payer'];
    consignee = json['consignee'];
    serviceTerm = json['serviceTerm'];
    term = json['term'];
    paymentTerm = json['paymentTerm'];
    statusBooking = json['statusBooking'];
    processUser = json['processUser'];
    updateTime = json['updateTime'];
    noteRequestByUser = json['noteRequestByUser'];
    if (json['volumes'] != null) {
      volumes = <Volumes>[];
      json['volumes'].forEach((v) {
        volumes!.add(new Volumes.fromJson(v));
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
    data['id'] = this.id;
    data['date'] = this.date;
    data['vessel'] = this.vessel;
    data['voyage'] = this.voyage;
    data['payer'] = this.payer;
    data['consignee'] = this.consignee;
    data['serviceTerm'] = this.serviceTerm;
    data['term'] = this.term;
    data['paymentTerm'] = this.paymentTerm;
    data['statusBooking'] = this.statusBooking;
    data['processUser'] = this.processUser;
    data['updateTime'] = this.updateTime;
    data['noteRequestByUser'] = this.noteRequestByUser;
    if (this.volumes != null) {
      data['volumes'] = this.volumes!.map((v) => v.toJson()).toList();
    }
    if (this.depots != null) {
      data['depots'] = this.depots!.map((v) => v.toJson()).toList();
    }
    return data;
  }

  Future<List<BookingRequest>> fetchBookingRequestList() async {
    try {
      var url =
          '$SERVER/NewBooking/GetByUser?user=${informationController.tenNV.value}';
      final response = await http.get(Uri.parse(url), headers: {
        "Access-Control-Allow-Origin": "*",
        "Access-Control-Allow-Methods": "GET", //use fot http, not use https
        // "Authorization": "Bearer ${informationController.authorize.value}",
      });
      switch (response.statusCode) {
        case 200:
          var body = response.body;
          print('Data List Request');
          List dataBookingRequestList = json.decode(body);
          return dataBookingRequestList
              .map((data) => BookingRequest.fromJson(data))
              .toList();
        default:
          throw Exception(response.reasonPhrase);
      }
    } on Exception catch (e) {
      return throw Exception(e);
    }
  }

  Future<List<BookingRequest>> fetchBookingRequestListAll() async {
    try {
      var url = '$SERVER/NewBooking/GetAll';
      final response = await http.get(Uri.parse(url), headers: {
        "Access-Control-Allow-Origin": "*",
        "Access-Control-Allow-Methods": "GET", //use fot http, not use https
        // "Authorization": "Bearer ${informationController.authorize.value}",
      });
      switch (response.statusCode) {
        case 200:
          var body = response.body;
          print('Data List Request');
          List dataBookingRequestList = json.decode(body);
          return dataBookingRequestList
              .map((data) => BookingRequest.fromJson(data))
              .toList();
        default:
          throw Exception(response.reasonPhrase);
      }
    } on Exception catch (e) {
      return throw Exception(e);
    }
  }
}

class Volumes {
  String? commodityConts;
  String? sizeConts;
  String? statusConts;
  String? volumeConts;
  String? weightConts;
  String? temperatureConts;
  String? dg;
  String? dgUnNo;
  String? dgClass;

  Volumes(
      {this.commodityConts,
      this.sizeConts,
      this.statusConts,
      this.volumeConts,
      this.weightConts,
      this.temperatureConts,
      this.dg,
      this.dgUnNo,
      this.dgClass});

  Volumes.fromJson(Map<String, dynamic> json) {
    commodityConts = json['commodityConts'];
    sizeConts = json['sizeConts'];
    statusConts = json['statusConts'];
    volumeConts = json['volumeConts'];
    weightConts = json['weightConts'];
    temperatureConts = json['temperatureConts'];
    dg = json['dg'];
    dgUnNo = json['dgUnNo'];
    dgClass = json['dgClass'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['commodityConts'] = this.commodityConts;
    data['sizeConts'] = this.sizeConts;
    data['statusConts'] = this.statusConts;
    data['volumeConts'] = this.volumeConts;
    data['weightConts'] = this.weightConts;
    data['temperatureConts'] = this.temperatureConts;
    data['dg'] = this.dg;
    data['dgUnNo'] = this.dgUnNo;
    data['dgClass'] = this.dgClass;
    return data;
  }

  Future<void> fetchDetailBookingVolume(int bk) async {
    try {
      var url = '$SERVER/NewBooking/GetVolumeById?id=$bk';
      final response = await http.get(Uri.parse(url), headers: {
        "Content-Type": "application/json",
        // "Authorization": "Bearer ${informationController.authorize.value}",
      });
      switch (response.statusCode) {
        case 200:
          var body = response.body;
          print('Data List Request Detail');
          List dataDetail = jsonDecode(body);
          try {
            dataDetailBookingRequestController.detailListInfoContainer.value =
                dataDetail;
          } catch (e) {
            print('Error data fetch Detail Request have null - $e');
          }
        default:
          throw Exception(response.reasonPhrase);
      }
    } on Exception catch (e) {
      throw Exception('Error fetch Detail Request - $e');
    }
  }
}

class Depots {
  String? depotId;
  String? depotName;
  String? sizeConts;
  String? volumeConts;

  Depots({this.depotId, this.depotName, this.sizeConts, this.volumeConts});

  Depots.fromJson(Map<String, dynamic> json) {
    depotId = json['depotId'];
    depotName = json['depotName'];
    sizeConts = json['sizeConts'];
    volumeConts = json['volumeConts'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['depotId'] = this.depotId;
    data['depotName'] = this.depotName;
    data['sizeConts'] = this.sizeConts;
    data['volumeConts'] = this.volumeConts;
    return data;
  }

  Future<void> fetchDetailBookingDepots(int bk) async {
    try {
      var url = '$SERVER/NewBooking/GetDepotById?id=$bk';
      final response = await http.get(Uri.parse(url), headers: {
        "Content-Type": "application/json",
        // "Authorization": "Bearer ${informationController.authorize.value}",
      });
      switch (response.statusCode) {
        case 200:
          var body = response.body;
          print('Data List Request Detail');
          List dataDetail = jsonDecode(body);
          try {
            dataDetailBookingRequestController.detailListDepots.value =
                dataDetail;
          } catch (e) {
            print('Error data fetch Detail Request have null - $e');
          }
        default:
          throw Exception(response.reasonPhrase);
      }
    } on Exception catch (e) {
      throw Exception('Error fetch Detail Request - $e');
    }
  }
}
