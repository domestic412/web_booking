// import 'dart:convert';

// import 'package:get/get.dart';
// import 'package:web_booking/constants/global.dart';
// import 'package:web_booking/page/signin/controller_signin.dart/info_signin_controller.dart';
// import 'package:http/http.dart' as http;
// import 'package:web_booking/utils/getx_route.dart';

// import 'storage_controller/detail_booking_request_controller.dart';

// class BookingRequest {
//   int? id;
//   String? date;
//   String? vessel;
//   String? voyage;
//   String? payer;
//   String? consignee;
//   String? serviceTerm;
//   String? term;
//   String? paymentTerm;
//   String? statusBooking;
//   String? processUser;
//   String? updateTime;
//   String? noteRequestByUser;
//   List<Volumes>? volumes;
//   List<Depots>? depots;

//   BookingRequest(
//       {this.id,
//       this.date,
//       this.vessel,
//       this.voyage,
//       this.payer,
//       this.consignee,
//       this.serviceTerm,
//       this.term,
//       this.paymentTerm,
//       this.statusBooking,
//       this.processUser,
//       this.updateTime,
//       this.noteRequestByUser,
//       this.volumes,
//       this.depots});

//   BookingRequest.fromJson(Map<String, dynamic> json) {
//     id = json['id'];
//     date = json['date'];
//     vessel = json['vessel'];
//     voyage = json['voyage'];
//     payer = json['payer'];
//     consignee = json['consignee'];
//     serviceTerm = json['serviceTerm'];
//     term = json['term'];
//     paymentTerm = json['paymentTerm'];
//     statusBooking = json['statusBooking'];
//     processUser = json['processUser'];
//     updateTime = json['updateTime'];
//     noteRequestByUser = json['noteRequestByUser'];
//     if (json['volumes'] != null) {
//       volumes = <Volumes>[];
//       json['volumes'].forEach((v) {
//         volumes!.add(new Volumes.fromJson(v));
//       });
//     }
//     if (json['depots'] != null) {
//       depots = <Depots>[];
//       json['depots'].forEach((v) {
//         depots!.add(new Depots.fromJson(v));
//       });
//     }
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['id'] = this.id;
//     data['date'] = this.date;
//     data['vessel'] = this.vessel;
//     data['voyage'] = this.voyage;
//     data['payer'] = this.payer;
//     data['consignee'] = this.consignee;
//     data['serviceTerm'] = this.serviceTerm;
//     data['term'] = this.term;
//     data['paymentTerm'] = this.paymentTerm;
//     data['statusBooking'] = this.statusBooking;
//     data['processUser'] = this.processUser;
//     data['updateTime'] = this.updateTime;
//     data['noteRequestByUser'] = this.noteRequestByUser;
//     if (this.volumes != null) {
//       data['volumes'] = this.volumes!.map((v) => v.toJson()).toList();
//     }
//     if (this.depots != null) {
//       data['depots'] = this.depots!.map((v) => v.toJson()).toList();
//     }
//     return data;
//   }

//   Future<List<BookingRequest>> fetchBookingRequestList() async {
//     try {
//       var url =
//           '$SERVER/NewBooking/GetByUser?user=${inforUserController.tenNV.value}';
//       final response = await http.get(Uri.parse(url), headers: {
//         "Access-Control-Allow-Origin": "*",
//         "Access-Control-Allow-Methods": "GET", //use fot http, not use https
//         // "Authorization": "Bearer ${inforUserController.authorize.value}",
//       });
//       switch (response.statusCode) {
//         case 200:
//           var body = response.body;
//           print('Data List Request');
//           List dataBookingRequestList = json.decode(body);
//           return dataBookingRequestList
//               .map((data) => BookingRequest.fromJson(data))
//               .toList();
//         case 401:
//           Get.toNamed(GetRoutes.SignIn);
//           throw Exception(response.reasonPhrase);
//         default:
//           throw Exception(response.reasonPhrase);
//       }
//     } on Exception catch (e) {
//       return throw Exception(e);
//     }
//   }

//   Future<List<BookingRequest>> fetchBookingRequestListAll() async {
//     try {
//       var url = '$SERVER/NewBooking/GetAll';
//       final response = await http.get(Uri.parse(url), headers: {
//         "Access-Control-Allow-Origin": "*",
//         "Access-Control-Allow-Methods": "GET", //use fot http, not use https
//         // "Authorization": "Bearer ${inforUserController.authorize.value}",
//       });
//       switch (response.statusCode) {
//         case 200:
//           var body = response.body;
//           print('Data List Request');
//           List dataBookingRequestList = json.decode(body);
//           return dataBookingRequestList
//               .map((data) => BookingRequest.fromJson(data))
//               .toList();
//         case 401:
//           Get.toNamed(GetRoutes.SignIn);
//           throw Exception(response.reasonPhrase);
//         default:
//           throw Exception(response.reasonPhrase);
//       }
//     } on Exception catch (e) {
//       return throw Exception(e);
//     }
//   }
// }

// class Volumes {
//   String? commodityConts;
//   String? sizeConts;
//   String? statusConts;
//   String? volumeConts;
//   String? weightConts;
//   String? temperatureConts;
//   String? dg;
//   String? dgUnNo;
//   String? dgClass;

//   Volumes(
//       {this.commodityConts,
//       this.sizeConts,
//       this.statusConts,
//       this.volumeConts,
//       this.weightConts,
//       this.temperatureConts,
//       this.dg,
//       this.dgUnNo,
//       this.dgClass});

//   Volumes.fromJson(Map<String, dynamic> json) {
//     commodityConts = json['commodityConts'];
//     sizeConts = json['sizeConts'];
//     statusConts = json['statusConts'];
//     volumeConts = json['volumeConts'];
//     weightConts = json['weightConts'];
//     temperatureConts = json['temperatureConts'];
//     dg = json['dg'];
//     dgUnNo = json['dgUnNo'];
//     dgClass = json['dgClass'];
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['commodityConts'] = this.commodityConts;
//     data['sizeConts'] = this.sizeConts;
//     data['statusConts'] = this.statusConts;
//     data['volumeConts'] = this.volumeConts;
//     data['weightConts'] = this.weightConts;
//     data['temperatureConts'] = this.temperatureConts;
//     data['dg'] = this.dg;
//     data['dgUnNo'] = this.dgUnNo;
//     data['dgClass'] = this.dgClass;
//     return data;
//   }

//   Future<void> fetchDetailBookingVolume(int bk) async {
//     try {
//       var url = '$SERVER/NewBooking/GetVolumeById?id=$bk';
//       final response = await http.get(Uri.parse(url), headers: {
//         "Content-Type": "application/json",
//         // "Authorization": "Bearer ${inforUserController.authorize.value}",
//       });
//       switch (response.statusCode) {
//         case 200:
//           var body = response.body;
//           print('Data List Request Detail');
//           List dataDetail = jsonDecode(body);
//           try {
//             dataDetailBookingRequestController.detailListInfoContainer.value =
//                 dataDetail;
//           } catch (e) {
//             print('Error data fetch Detail Request have null - $e');
//           }
//         case 401:
//           Get.toNamed(GetRoutes.SignIn);
//           throw Exception(response.reasonPhrase);
//         default:
//           throw Exception(response.reasonPhrase);
//       }
//     } on Exception catch (e) {
//       throw Exception('Error fetch Detail Request - $e');
//     }
//   }
// }

// class Depots {
//   String? depotId;
//   String? depotName;
//   String? sizeConts;
//   String? volumeConts;

//   Depots({this.depotId, this.depotName, this.sizeConts, this.volumeConts});

//   Depots.fromJson(Map<String, dynamic> json) {
//     depotId = json['depotId'];
//     depotName = json['depotName'];
//     sizeConts = json['sizeConts'];
//     volumeConts = json['volumeConts'];
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['depotId'] = this.depotId;
//     data['depotName'] = this.depotName;
//     data['sizeConts'] = this.sizeConts;
//     data['volumeConts'] = this.volumeConts;
//     return data;
//   }

//   Future<void> fetchDetailBookingDepots(int bk) async {
//     try {
//       var url = '$SERVER/NewBooking/GetDepotById?id=$bk';
//       final response = await http.get(Uri.parse(url), headers: {
//         "Content-Type": "application/json",
//         // "Authorization": "Bearer ${inforUserController.authorize.value}",
//       });
//       switch (response.statusCode) {
//         case 200:
//           var body = response.body;
//           print('Data List Request Detail');
//           List dataDetail = jsonDecode(body);
//           try {
//             dataDetailBookingRequestController.detailListDepots.value =
//                 dataDetail;
//           } catch (e) {
//             print('Error data fetch Detail Request have null - $e');
//           }
//         case 401:
//           Get.toNamed(GetRoutes.SignIn);
//           throw Exception(response.reasonPhrase);
//         default:
//           throw Exception(response.reasonPhrase);
//       }
//     } on Exception catch (e) {
//       throw Exception('Error fetch Detail Request - $e');
//     }
//   }
// }

class BookingRequest {
  String? voyDetail;
  String? portLoadId;
  String? portDischargeId;
  String? refId;
  String? officeId;
  String? paymentTerm;
  String? term;
  String? specialRequest;
  String? payerId;
  String? shipperId;
  String? consigneeId;
  String? liftOnDepotId;
  bool? coc;
  bool? dg;
  String? dgRemark;
  bool? reefer;
  String? temperature;
  String? remark;
  String? userName;
  String? edit;
  List<BookingDetails>? bookingDetails;

  BookingRequest(
      {this.voyDetail,
      this.portLoadId,
      this.portDischargeId,
      this.refId,
      this.officeId,
      this.paymentTerm,
      this.term,
      this.specialRequest,
      this.payerId,
      this.shipperId,
      this.consigneeId,
      this.liftOnDepotId,
      this.coc,
      this.dg,
      this.dgRemark,
      this.reefer,
      this.temperature,
      this.remark,
      this.userName,
      this.edit,
      this.bookingDetails});

  BookingRequest.fromJson(Map<String, dynamic> json) {
    voyDetail = json['voyDetail'];
    portLoadId = json['portLoadId'];
    portDischargeId = json['portDischargeId'];
    refId = json['refId'];
    officeId = json['officeId'];
    paymentTerm = json['paymentTerm'];
    term = json['term'];
    specialRequest = json['specialRequest'];
    payerId = json['payerId'];
    shipperId = json['shipperId'];
    consigneeId = json['consigneeId'];
    liftOnDepotId = json['liftOnDepotId'];
    coc = json['coc'];
    dg = json['dg'];
    dgRemark = json['dgRemark'];
    reefer = json['reefer'];
    temperature = json['temperature'];
    remark = json['remark'];
    userName = json['userName'];
    edit = json['edit'];
    if (json['bookingDetails'] != null) {
      bookingDetails = <BookingDetails>[];
      json['bookingDetails'].forEach((v) {
        bookingDetails!.add(new BookingDetails.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['voyDetail'] = this.voyDetail;
    data['portLoadId'] = this.portLoadId;
    data['portDischargeId'] = this.portDischargeId;
    data['refId'] = this.refId;
    data['officeId'] = this.officeId;
    data['paymentTerm'] = this.paymentTerm;
    data['term'] = this.term;
    data['specialRequest'] = this.specialRequest;
    data['payerId'] = this.payerId;
    data['shipperId'] = this.shipperId;
    data['consigneeId'] = this.consigneeId;
    data['liftOnDepotId'] = this.liftOnDepotId;
    data['coc'] = this.coc;
    data['dg'] = this.dg;
    data['dgRemark'] = this.dgRemark;
    data['reefer'] = this.reefer;
    data['temperature'] = this.temperature;
    data['remark'] = this.remark;
    data['userName'] = this.userName;
    data['edit'] = this.edit;
    if (this.bookingDetails != null) {
      data['bookingDetails'] =
          this.bookingDetails!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class BookingDetails {
  String? commodityId;
  String? sizeId;
  String? type;
  int? volume;
  String? status;
  int? weight;
  String? edit;

  BookingDetails(
      {this.commodityId,
      this.sizeId,
      this.type,
      this.volume,
      this.status,
      this.weight,
      this.edit});

  BookingDetails.fromJson(Map<String, dynamic> json) {
    commodityId = json['commodityId'];
    sizeId = json['sizeId'];
    type = json['type'];
    volume = json['volume'];
    status = json['status'];
    weight = json['weight'];
    edit = json['edit'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['commodityId'] = this.commodityId;
    data['sizeId'] = this.sizeId;
    data['type'] = this.type;
    data['volume'] = this.volume;
    data['status'] = this.status;
    data['weight'] = this.weight;
    data['edit'] = this.edit;
    return data;
  }
}