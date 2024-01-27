class CreateBooking {
  String? date;
  String? vessel;
  String? voyage;
  String? payer;
  String? consignee;
  String? serviceTerm;
  String? term;
  String? paymentTerm;
  List<Volumes>? volumes;

  CreateBooking(
      {this.date,
      this.vessel,
      this.voyage,
      this.payer,
      this.consignee,
      this.serviceTerm,
      this.term,
      this.paymentTerm,
      this.volumes});

  CreateBooking.fromJson(Map<String, dynamic> json) {
    date = json['date'];
    vessel = json['vessel'];
    voyage = json['voyage'];
    payer = json['payer'];
    consignee = json['consignee'];
    serviceTerm = json['serviceTerm'];
    term = json['term'];
    paymentTerm = json['paymentTerm'];
    if (json['volumes'] != null) {
      volumes = <Volumes>[];
      json['volumes'].forEach((v) {
        volumes!.add(new Volumes.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['date'] = this.date;
    data['vessel'] = this.vessel;
    data['voyage'] = this.voyage;
    data['payer'] = this.payer;
    data['consignee'] = this.consignee;
    data['serviceTerm'] = this.serviceTerm;
    data['term'] = this.term;
    data['paymentTerm'] = this.paymentTerm;
    if (this.volumes != null) {
      data['volumes'] = this.volumes!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Volumes {
  String? commodityConts;
  String? typeConts;
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
      this.typeConts,
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
    typeConts = json['typeConts'];
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
    data['typeConts'] = this.typeConts;
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
}
