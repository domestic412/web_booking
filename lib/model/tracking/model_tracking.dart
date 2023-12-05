import 'dart:convert';

import 'package:web_booking/constants/global.dart';
import 'package:web_booking/page/tracking/widgets/dropdownbox.dart';
import 'package:http/http.dart' as http;

class ContainerTracking {
  List<TrackingContainers>? trackingContainers;
  List<TrackingZimsEN>? trackingZimsEN;
  List<TrackingZimsVN>? trackingZimsVN;

  ContainerTracking(
      {this.trackingContainers, this.trackingZimsEN, this.trackingZimsVN});

  ContainerTracking.fromJson(Map<String, dynamic> json) {
    if (json['trackingContainers'] != null) {
      trackingContainers = <TrackingContainers>[];
      json['trackingContainers'].forEach((v) {
        trackingContainers!.add(new TrackingContainers.fromJson(v));
      });
    }
    if (json['trackingZimsEN'] != null) {
      trackingZimsEN = <TrackingZimsEN>[];
      json['trackingZimsEN'].forEach((v) {
        trackingZimsEN!.add(new TrackingZimsEN.fromJson(v));
      });
    }
    if (json['trackingZimsVN'] != null) {
      trackingZimsVN = <TrackingZimsVN>[];
      json['trackingZimsVN'].forEach((v) {
        trackingZimsVN!.add(new TrackingZimsVN.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.trackingContainers != null) {
      data['trackingContainers'] =
          this.trackingContainers!.map((v) => v.toJson()).toList();
    }
    if (this.trackingZimsEN != null) {
      data['trackingZimsEN'] =
          this.trackingZimsEN!.map((v) => v.toJson()).toList();
    }
    if (this.trackingZimsVN != null) {
      data['trackingZimsVN'] =
          this.trackingZimsVN!.map((v) => v.toJson()).toList();
    }
    return data;
  }

  Future<ContainerTracking> fetchContainerTracking(String inputt) async {
    try {
      final url_bk_en = '$SERVER/Tracking?BookingNo=$inputt&CntrNo=';
      final url_cntr_en = '$SERVER/Tracking?BookingNo=&CntrNo=$inputt';
      String? url;
      selectedValue == 'bk' ? url = url_bk_en : url = url_cntr_en;
      final response = await http.get(
        Uri.parse(url),
        headers: {
          "Access-Control-Allow-Origin": "*",
          "Access-Control-Allow-Methods": "GET", //use fot http, not use https
        },
      );
      switch (response.statusCode) {
        case 200:
          var body = response.body;
          if (body == '[]') {
            return throw Exception();
          }
          var dataCntrTracking = jsonDecode(body);
          return ContainerTracking.fromJson(dataCntrTracking);
        default:
          throw Exception(response.reasonPhrase);
      }
    } on Exception catch (e) {
      throw Exception('Error fetch Tracking - $e');
    }
  }
}

class TrackingContainers {
  String? bookingNo;
  String? container;
  String? size;

  TrackingContainers({this.bookingNo, this.container, this.size});

  TrackingContainers.fromJson(Map<String, dynamic> json) {
    bookingNo = json['bookingNo'];
    container = json['container'];
    size = json['size'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['bookingNo'] = this.bookingNo;
    data['container'] = this.container;
    data['size'] = this.size;
    return data;
  }
}

class TrackingZimsEN {
  String? container;
  String? status;
  String? location;
  String? eventDate;

  TrackingZimsEN({this.container, this.status, this.location, this.eventDate});

  TrackingZimsEN.fromJson(Map<String, dynamic> json) {
    container = json['container'];
    status = json['status'];
    location = json['location'];
    eventDate = json['eventDate'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['container'] = this.container;
    data['status'] = this.status;
    data['location'] = this.location;
    data['eventDate'] = this.eventDate;
    return data;
  }
}

class TrackingZimsVN {
  String? container;
  String? status;
  String? location;
  String? eventDate;

  TrackingZimsVN({this.container, this.status, this.location, this.eventDate});

  TrackingZimsVN.fromJson(Map<String, dynamic> json) {
    container = json['container'];
    status = json['status'];
    location = json['location'];
    eventDate = json['eventDate'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['container'] = this.container;
    data['status'] = this.status;
    data['location'] = this.location;
    data['eventDate'] = this.eventDate;
    return data;
  }
}
