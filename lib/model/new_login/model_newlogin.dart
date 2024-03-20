class ModelNewLogin {
  List<DataTable1s>? dataTable1s;
  List<DataTable2s>? dataTable2s;
  List<DataTable4s>? dataTable4s;
  List<DataTable5s>? dataTable5s;

  ModelNewLogin(
      {this.dataTable1s, this.dataTable2s, this.dataTable4s, this.dataTable5s});

  ModelNewLogin.fromJson(Map<String, dynamic> json) {
    if (json['dataTable1s'] != null) {
      dataTable1s = <DataTable1s>[];
      json['dataTable1s'].forEach((v) {
        dataTable1s!.add(new DataTable1s.fromJson(v));
      });
    }
    if (json['dataTable2s'] != null) {
      dataTable2s = <DataTable2s>[];
      json['dataTable2s'].forEach((v) {
        dataTable2s!.add(new DataTable2s.fromJson(v));
      });
    }
    if (json['dataTable4s'] != null) {
      dataTable4s = <DataTable4s>[];
      json['dataTable4s'].forEach((v) {
        dataTable4s!.add(new DataTable4s.fromJson(v));
      });
    }
    if (json['dataTable5s'] != null) {
      dataTable5s = <DataTable5s>[];
      json['dataTable5s'].forEach((v) {
        dataTable5s!.add(new DataTable5s.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.dataTable1s != null) {
      data['dataTable1s'] = this.dataTable1s!.map((v) => v.toJson()).toList();
    }
    if (this.dataTable2s != null) {
      data['dataTable2s'] = this.dataTable2s!.map((v) => v.toJson()).toList();
    }
    if (this.dataTable4s != null) {
      data['dataTable4s'] = this.dataTable4s!.map((v) => v.toJson()).toList();
    }
    if (this.dataTable5s != null) {
      data['dataTable5s'] = this.dataTable5s!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class DataTable1s {
  String? shipperId;
  String? shipperName;
  String? managingOfficeId;

  DataTable1s({this.shipperId, this.shipperName, this.managingOfficeId});

  DataTable1s.fromJson(Map<String, dynamic> json) {
    shipperId = json['shipperId'];
    shipperName = json['shipperName'];
    managingOfficeId = json['managingOfficeId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['shipperId'] = this.shipperId;
    data['shipperName'] = this.shipperName;
    data['managingOfficeId'] = this.managingOfficeId;
    return data;
  }
}

class DataTable2s {
  String? consigneeId;
  String? shipperName;

  DataTable2s({this.consigneeId, this.shipperName});

  DataTable2s.fromJson(Map<String, dynamic> json) {
    consigneeId = json['consigneeId'];
    shipperName = json['shipperName'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['consigneeId'] = this.consigneeId;
    data['shipperName'] = this.shipperName;
    return data;
  }
}

class DataTable4s {
  String? term;

  DataTable4s({this.term});

  DataTable4s.fromJson(Map<String, dynamic> json) {
    term = json['term'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['term'] = this.term;
    return data;
  }
}

class DataTable5s {
  String? commodityId;
  String? commodityName;

  DataTable5s({this.commodityId, this.commodityName});

  DataTable5s.fromJson(Map<String, dynamic> json) {
    commodityId = json['commodityId'];
    commodityName = json['commodityName'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['commodityId'] = this.commodityId;
    data['commodityName'] = this.commodityName;
    return data;
  }
}
