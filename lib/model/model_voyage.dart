class Voyage {
  List<ListBookingVoys>? listBookingVoys;
  List<Depots>? depots;

  Voyage({this.listBookingVoys, this.depots});

  Voyage.fromJson(Map<String, dynamic> json) {
    if (json['listBookingVoys'] != null) {
      listBookingVoys = <ListBookingVoys>[];
      json['listBookingVoys'].forEach((v) {
        listBookingVoys!.add(new ListBookingVoys.fromJson(v));
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
    if (this.listBookingVoys != null) {
      data['listBookingVoys'] =
          this.listBookingVoys!.map((v) => v.toJson()).toList();
    }
    if (this.depots != null) {
      data['depots'] = this.depots!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class ListBookingVoys {
  String? voyDetail;
  String? etd;
  String? voyId;

  ListBookingVoys({this.voyDetail, this.etd, this.voyId});

  ListBookingVoys.fromJson(Map<String, dynamic> json) {
    voyDetail = json['voyDetail'];
    etd = json['etd'];
    voyId = json['voyId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['voyDetail'] = this.voyDetail;
    data['etd'] = this.etd;
    data['voyId'] = this.voyId;
    return data;
  }
}

class Depots {
  String? depotId;
  String? depotName;
  int? soluong;

  Depots({this.depotId, this.depotName, this.soluong});

  Depots.fromJson(Map<String, dynamic> json) {
    depotId = json['depotId'];
    depotName = json['depotName'];
    soluong = json['soluong'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['depotId'] = this.depotId;
    data['depotName'] = this.depotName;
    data['soluong'] = this.soluong;
    return data;
  }
}