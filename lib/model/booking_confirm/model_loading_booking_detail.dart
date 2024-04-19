import 'dart:convert';
import 'package:http/http.dart' as http;

import 'package:web_booking/constants/global.dart';

class LoadBookingDetail {
  List<InforDetail>? inforDetail;
  List<CommoditieDetail>? commoditieDetail;
  List<RefDetails>? refDetails;
  List<DepAvaModel>? depAvaModel;
  List<DepOnOfficeModel>? depOnOfficeModel;

  LoadBookingDetail(
      {this.inforDetail,
      this.commoditieDetail,
      this.refDetails,
      this.depAvaModel,
      this.depOnOfficeModel});

  LoadBookingDetail.fromJson(Map<String, dynamic> json) {
    if (json['inforDetail'] != null) {
      inforDetail = <InforDetail>[];
      json['inforDetail'].forEach((v) {
        inforDetail!.add(InforDetail.fromJson(v));
      });
    }
    if (json['commoditieDetail'] != null) {
      commoditieDetail = <CommoditieDetail>[];
      json['commoditieDetail'].forEach((v) {
        commoditieDetail!.add(CommoditieDetail.fromJson(v));
      });
    }
    if (json['refDetails'] != null) {
      refDetails = <RefDetails>[];
      json['refDetails'].forEach((v) {
        refDetails!.add(RefDetails.fromJson(v));
      });
    }
    if (json['depAvaModel'] != null) {
      depAvaModel = <DepAvaModel>[];
      json['depAvaModel'].forEach((v) {
        depAvaModel!.add(DepAvaModel.fromJson(v));
      });
    }
    if (json['depOnOfficeModel'] != null) {
      depOnOfficeModel = <DepOnOfficeModel>[];
      json['depOnOfficeModel'].forEach((v) {
        depOnOfficeModel!.add(DepOnOfficeModel.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (inforDetail != null) {
      data['inforDetail'] = inforDetail!.map((v) => v.toJson()).toList();
    }
    if (commoditieDetail != null) {
      data['commoditieDetail'] =
          commoditieDetail!.map((v) => v.toJson()).toList();
    }
    if (refDetails != null) {
      data['refDetails'] = refDetails!.map((v) => v.toJson()).toList();
    }
    if (depAvaModel != null) {
      data['depAvaModel'] = depAvaModel!.map((v) => v.toJson()).toList();
    }
    if (depOnOfficeModel != null) {
      data['depOnOfficeModel'] =
          depOnOfficeModel!.map((v) => v.toJson()).toList();
    }
    return data;
  }

  Future<LoadBookingDetail> fetchDataLoadBookingDetail(
      {required String bookingId}) async {
    try {
      var url = URL_LOAD_BOOKING_DETAIL;
      Map<String, String> data = {
        'bookingId': bookingId,
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
          var dataLoadingBookingDetail = json.decode(body);
          return LoadBookingDetail.fromJson(dataLoadingBookingDetail);
        default:
          throw Exception(response.reasonPhrase);
      }
    } on Exception catch (e) {
      throw Exception(e);
    }
  }
}

class InforDetail {
  String? shipper;
  String? consignee;
  String? notifyParty;
  String? shipName;
  String? voyId;
  String? etd;
  String? bookingDate;
  String? bookingNo;
  String? coc;
  String? portLoad;
  String? portDischarge;
  String? depot;
  String? requestDepotId;
  String? remark;

  InforDetail(
      {this.shipper,
      this.consignee,
      this.notifyParty,
      this.shipName,
      this.voyId,
      this.etd,
      this.bookingDate,
      this.bookingNo,
      this.coc,
      this.portLoad,
      this.portDischarge,
      this.depot,
      this.requestDepotId,
      this.remark});

  InforDetail.fromJson(Map<String, dynamic> json) {
    shipper = json['shipper'];
    consignee = json['consignee'];
    notifyParty = json['notifyParty'];
    shipName = json['shipName'];
    voyId = json['voyId'];
    etd = json['etd'];
    bookingDate = json['bookingDate'];
    bookingNo = json['bookingNo'];
    coc = json['coc'];
    portLoad = json['portLoad'];
    portDischarge = json['portDischarge'];
    depot = json['depot'];
    requestDepotId = json['requestDepotId'];
    remark = json['remark'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['shipper'] = shipper;
    data['consignee'] = consignee;
    data['notifyParty'] = notifyParty;
    data['shipName'] = shipName;
    data['voyId'] = voyId;
    data['etd'] = etd;
    data['bookingDate'] = bookingDate;
    data['bookingNo'] = bookingNo;
    data['coc'] = coc;
    data['portLoad'] = portLoad;
    data['portDischarge'] = portDischarge;
    data['depot'] = depot;
    data['requestDepotId'] = requestDepotId;
    data['remark'] = remark;
    return data;
  }
}

class CommoditieDetail {
  int? seq;
  String? bookingDetailId;
  String? bookingId;
  String? commodityId;
  String? sizeId;
  String? type;
  String? status;
  int? volume;
  int? coc;
  int? soc;
  int? weight;
  String? weightUnit;
  String? containerQuality;
  int? requestVol;
  String? commodityName;
  bool? dg;
  String? unno;
  String? Class;
  String? dgRemark;

  CommoditieDetail(
      {this.seq,
      this.bookingDetailId,
      this.bookingId,
      this.commodityId,
      this.sizeId,
      this.type,
      this.status,
      this.volume,
      this.coc,
      this.soc,
      this.weight,
      this.weightUnit,
      this.containerQuality,
      this.requestVol,
      this.commodityName,
      this.dg,
      this.unno,
      this.Class,
      this.dgRemark});

  CommoditieDetail.fromJson(Map<String, dynamic> json) {
    seq = json['seq'];
    bookingDetailId = json['bookingDetailId'];
    bookingId = json['bookingId'];
    commodityId = json['commodityId'];
    sizeId = json['sizeId'];
    type = json['type'];
    status = json['status'];
    volume = json['volume'];
    coc = json['coc'];
    soc = json['soc'];
    weight = json['weight'];
    weightUnit = json['weightUnit'];
    containerQuality = json['containerQuality'];
    requestVol = json['requestVol'];
    commodityName = json['commodityName'];
    dg = json['dg'];
    unno = json['unno'];
    Class = json['class'];
    dgRemark = json['dgRemark'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['seq'] = seq;
    data['bookingDetailId'] = bookingDetailId;
    data['bookingId'] = bookingId;
    data['commodityId'] = commodityId;
    data['sizeId'] = sizeId;
    data['type'] = type;
    data['status'] = status;
    data['volume'] = volume;
    data['coc'] = coc;
    data['soc'] = soc;
    data['weight'] = weight;
    data['weightUnit'] = weightUnit;
    data['containerQuality'] = containerQuality;
    data['requestVol'] = requestVol;
    data['commodityName'] = commodityName;
    data['dg'] = dg;
    data['unno'] = unno;
    data['class'] = Class;
    data['dgRemark'] = dgRemark;
    return data;
  }
}

class RefDetails {
  String? refNo;
  String? chargeType;
  String? perCode;
  String? ccy;
  int? volume;
  int? price;
  int? vat;
  String? kindOfSurCharge;
  String? paymentTem;
  String? payAt;
  int? total;

  RefDetails(
      {this.refNo,
      this.chargeType,
      this.perCode,
      this.ccy,
      this.volume,
      this.price,
      this.vat,
      this.kindOfSurCharge,
      this.paymentTem,
      this.payAt,
      this.total});

  RefDetails.fromJson(Map<String, dynamic> json) {
    refNo = json['refNo'];
    chargeType = json['chargeType'];
    perCode = json['perCode'];
    ccy = json['ccy'];
    volume = json['volume'];
    price = json['price'];
    vat = json['vat'];
    kindOfSurCharge = json['kindOfSurCharge'];
    paymentTem = json['paymentTem'];
    payAt = json['payAt'];
    total = json['total'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['refNo'] = refNo;
    data['chargeType'] = chargeType;
    data['perCode'] = perCode;
    data['ccy'] = ccy;
    data['volume'] = volume;
    data['price'] = price;
    data['vat'] = vat;
    data['kindOfSurCharge'] = kindOfSurCharge;
    data['paymentTem'] = paymentTem;
    data['payAt'] = payAt;
    data['total'] = total;
    return data;
  }
}

class DepAvaModel {
  String? depotName;
  String? size;
  int? fos;
  int? mia;

  DepAvaModel({this.depotName, this.size, this.fos, this.mia});

  DepAvaModel.fromJson(Map<String, dynamic> json) {
    depotName = json['depotName'];
    size = json['size'];
    fos = json['fos'];
    mia = json['mia'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['depotName'] = depotName;
    data['size'] = size;
    data['fos'] = fos;
    data['mia'] = mia;
    return data;
  }
}

class DepOnOfficeModel {
  String? depotId;
  String? depotName;

  DepOnOfficeModel({this.depotId, this.depotName});

  DepOnOfficeModel.fromJson(Map<String, dynamic> json) {
    depotId = json['depotId'];
    depotName = json['depotName'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['depotId'] = depotId;
    data['depotName'] = depotName;
    return data;
  }
}
