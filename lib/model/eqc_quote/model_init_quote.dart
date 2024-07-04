class InitEQCQuote {
  List<ChargeTypeQuotes>? chargeTypeQuotes;
  List<ComponentQuotes>? componentQuotes;
  List<CategoryQuotes>? categoryQuotes;
  List<ErrorQuotes>? errorQuotes;
  List<PayerQuotes>? payerQuotes;
  List<PortQuotes>? portQuotes;
  List<CurrencyQuotes>? currencyQuotes;

  InitEQCQuote(
      {this.chargeTypeQuotes,
      this.componentQuotes,
      this.categoryQuotes,
      this.errorQuotes,
      this.payerQuotes,
      this.portQuotes,
      this.currencyQuotes});

  InitEQCQuote.fromJson(Map<String, dynamic> json) {
    if (json['chargeTypeQuotes'] != null) {
      chargeTypeQuotes = <ChargeTypeQuotes>[];
      json['chargeTypeQuotes'].forEach((v) {
        chargeTypeQuotes!.add(new ChargeTypeQuotes.fromJson(v));
      });
    }
    if (json['componentQuotes'] != null) {
      componentQuotes = <ComponentQuotes>[];
      json['componentQuotes'].forEach((v) {
        componentQuotes!.add(new ComponentQuotes.fromJson(v));
      });
    }
    if (json['categoryQuotes'] != null) {
      categoryQuotes = <CategoryQuotes>[];
      json['categoryQuotes'].forEach((v) {
        categoryQuotes!.add(new CategoryQuotes.fromJson(v));
      });
    }
    if (json['errorQuotes'] != null) {
      errorQuotes = <ErrorQuotes>[];
      json['errorQuotes'].forEach((v) {
        errorQuotes!.add(new ErrorQuotes.fromJson(v));
      });
    }
    if (json['payerQuotes'] != null) {
      payerQuotes = <PayerQuotes>[];
      json['payerQuotes'].forEach((v) {
        payerQuotes!.add(new PayerQuotes.fromJson(v));
      });
    }
    if (json['portQuotes'] != null) {
      portQuotes = <PortQuotes>[];
      json['portQuotes'].forEach((v) {
        portQuotes!.add(new PortQuotes.fromJson(v));
      });
    }
    if (json['currencyQuotes'] != null) {
      currencyQuotes = <CurrencyQuotes>[];
      json['currencyQuotes'].forEach((v) {
        currencyQuotes!.add(new CurrencyQuotes.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.chargeTypeQuotes != null) {
      data['chargeTypeQuotes'] =
          this.chargeTypeQuotes!.map((v) => v.toJson()).toList();
    }
    if (this.componentQuotes != null) {
      data['componentQuotes'] =
          this.componentQuotes!.map((v) => v.toJson()).toList();
    }
    if (this.categoryQuotes != null) {
      data['categoryQuotes'] =
          this.categoryQuotes!.map((v) => v.toJson()).toList();
    }
    if (this.errorQuotes != null) {
      data['errorQuotes'] = this.errorQuotes!.map((v) => v.toJson()).toList();
    }
    if (this.payerQuotes != null) {
      data['payerQuotes'] = this.payerQuotes!.map((v) => v.toJson()).toList();
    }
    if (this.portQuotes != null) {
      data['portQuotes'] = this.portQuotes!.map((v) => v.toJson()).toList();
    }
    if (this.currencyQuotes != null) {
      data['currencyQuotes'] =
          this.currencyQuotes!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class ChargeTypeQuotes {
  String? chargeTypeId;
  String? chargeType;

  ChargeTypeQuotes({this.chargeTypeId, this.chargeType});

  ChargeTypeQuotes.fromJson(Map<String, dynamic> json) {
    chargeTypeId = json['chargeTypeId'];
    chargeType = json['chargeType'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['chargeTypeId'] = this.chargeTypeId;
    data['chargeType'] = this.chargeType;
    return data;
  }
}

class ComponentQuotes {
  String? componentId;
  String? component;

  ComponentQuotes({this.componentId, this.component});

  ComponentQuotes.fromJson(Map<String, dynamic> json) {
    componentId = json['componentId'];
    component = json['component'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['componentId'] = this.componentId;
    data['component'] = this.component;
    return data;
  }
}

class CategoryQuotes {
  String? categoryId;
  String? category;

  CategoryQuotes({this.categoryId, this.category});

  CategoryQuotes.fromJson(Map<String, dynamic> json) {
    categoryId = json['categoryId'];
    category = json['category'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['categoryId'] = this.categoryId;
    data['category'] = this.category;
    return data;
  }
}

class ErrorQuotes {
  String? errorId;
  String? error;

  ErrorQuotes({this.errorId, this.error});

  ErrorQuotes.fromJson(Map<String, dynamic> json) {
    errorId = json['errorId'];
    error = json['error'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['errorId'] = this.errorId;
    data['error'] = this.error;
    return data;
  }
}

class PayerQuotes {
  int? payerId;
  String? payer;

  PayerQuotes({this.payerId, this.payer});

  PayerQuotes.fromJson(Map<String, dynamic> json) {
    payerId = json['payerId'];
    payer = json['payer'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['payerId'] = this.payerId;
    data['payer'] = this.payer;
    return data;
  }
}

class PortQuotes {
  String? portDepotId;
  String? code;

  PortQuotes({this.portDepotId, this.code});

  PortQuotes.fromJson(Map<String, dynamic> json) {
    portDepotId = json['portDepotId'];
    code = json['code'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['portDepotId'] = this.portDepotId;
    data['code'] = this.code;
    return data;
  }
}

class CurrencyQuotes {
  String? currency;
  String? currencyName;

  CurrencyQuotes({this.currency, this.currencyName});

  CurrencyQuotes.fromJson(Map<String, dynamic> json) {
    currency = json['currency'];
    currencyName = json['currencyName'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['currency'] = this.currency;
    data['currencyName'] = this.currencyName;
    return data;
  }
}