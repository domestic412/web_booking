import 'dart:convert';

import 'package:get/get.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';
import 'package:web_booking/constants/global.dart';
import 'package:web_booking/page/menu/tracking/widgets/dropdownbox.dart';
import 'package:http/http.dart' as http;

class ContainerTracking {
  List<TrackingContainers>? trackingContainers;
  List<TrackingZims>? trackingZimsEN;
  List<TrackingZims>? trackingZimsVN;

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
      trackingZimsEN = <TrackingZims>[];
      json['trackingZimsEN'].forEach((v) {
        trackingZimsEN!.add(new TrackingZims.fromJson(v));
      });
    }
    if (json['trackingZimsVN'] != null) {
      trackingZimsVN = <TrackingZims>[];
      json['trackingZimsVN'].forEach((v) {
        trackingZimsVN!.add(new TrackingZims.fromJson(v));
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

  DataGridRow getDataGridRow_TrackingContainers() {
    return DataGridRow(cells: [
      DataGridCell<String>(columnName: 'container'.tr, value: container),
      DataGridCell<String>(columnName: 'size'.tr, value: size),
    ]);
  }
}

class TrackingZims {
  String? container;
  String? status;
  String? location;
  String? eventDate;

  TrackingZims({this.container, this.status, this.location, this.eventDate});

  TrackingZims.fromJson(Map<String, dynamic> json) {
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

  DataGridRow getDataGridRow_TrackingZims() {
    return DataGridRow(cells: [
      DataGridCell<String>(columnName: 'container'.tr, value: container),
      DataGridCell<String>(columnName: 'status'.tr, value: status),
      DataGridCell<String>(columnName: 'location'.tr, value: location),
      DataGridCell<String>(columnName: 'eventDate'.tr, value: eventDate),
    ]);
  }
}

// class TrackingZimsVN {
//   String? container;
//   String? status;
//   String? location;
//   String? eventDate;

//   TrackingZimsVN({this.container, this.status, this.location, this.eventDate});

//   TrackingZimsVN.fromJson(Map<String, dynamic> json) {
//     container = json['container'];
//     status = json['status'];
//     location = json['location'];
//     eventDate = json['eventDate'];
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['container'] = this.container;
//     data['status'] = this.status;
//     data['location'] = this.location;
//     data['eventDate'] = this.eventDate;
//     return data;
//   }
// }
