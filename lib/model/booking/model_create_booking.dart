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
