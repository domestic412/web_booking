import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:web_booking/constants/global.dart';
import 'package:web_booking/constants/variable.dart';

class CheckContainer {
  int? id;
  String? cntrno;
  String? sizeType;
  String? soLanKetHop;
  String? soLanKetHopNum;
  String? tinhTrang;
  String? ghiChuTinhTrang;
  String? maChatLuong;
  String? ghiChuKetHop;
  String? luuYSuDung;
  String? ketQua;
  String? approval;
  String? shipper;
  String? dateFullOut;
  String? dateEmptyOut;
  String? dateFullArrived;
  String? combineStuffing;
  String? terminal;
  String? remark;
  String? shipVoy;
  String? status;
  String? quanlity;
  String? checkRemark;
  String? checkDetKH;
  String? updateUser;
  String? updateTime;

  CheckContainer(
      {this.id,
      this.cntrno,
      this.sizeType,
      this.soLanKetHop,
      this.soLanKetHopNum,
      this.tinhTrang,
      this.ghiChuTinhTrang,
      this.maChatLuong,
      this.ghiChuKetHop,
      this.luuYSuDung,
      this.ketQua,
      this.approval,
      this.shipper,
      this.dateFullOut,
      this.dateEmptyOut,
      this.dateFullArrived,
      this.combineStuffing,
      this.terminal,
      this.remark,
      this.shipVoy,
      this.status,
      this.quanlity,
      this.checkRemark,
      this.checkDetKH,
      this.updateUser,
      this.updateTime});

  CheckContainer.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    cntrno = json['cntrno'];
    sizeType = json['sizeType'];
    soLanKetHop = json['soLanKetHop'];
    soLanKetHopNum = json['soLanKetHop_Num'];
    tinhTrang = json['tinhTrang'];
    ghiChuTinhTrang = json['ghiChuTinhTrang'];
    maChatLuong = json['maChatLuong'];
    ghiChuKetHop = json['ghiChuKetHop'];
    luuYSuDung = json['luuYSuDung'];
    ketQua = json['ketQua'];
    approval = json['approval'];
    shipper = json['shipper'];
    dateFullOut = json['dateFullOut'];
    dateEmptyOut = json['dateEmptyOut'];
    dateFullArrived = json['dateFullArrived'];
    combineStuffing = json['combineStuffing'];
    terminal = json['terminal'];
    remark = json['remark'];
    shipVoy = json['shipVoy'];
    status = json['status'];
    quanlity = json['quanlity'];
    checkRemark = json['checkRemark'];
    checkDetKH = json['checkDetKH'];
    updateUser = json['updateUser'];
    updateTime = json['updateTime'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = id;
    data['cntrno'] = cntrno;
    data['sizeType'] = sizeType;
    data['soLanKetHop'] = soLanKetHop;
    data['soLanKetHop_Num'] = soLanKetHopNum;
    data['tinhTrang'] = tinhTrang;
    data['ghiChuTinhTrang'] = ghiChuTinhTrang;
    data['maChatLuong'] = maChatLuong;
    data['ghiChuKetHop'] = ghiChuKetHop;
    data['luuYSuDung'] = luuYSuDung;
    data['ketQua'] = ketQua;
    data['approval'] = approval;
    data['shipper'] = shipper;
    data['dateFullOut'] = dateFullOut;
    data['dateEmptyOut'] = dateEmptyOut;
    data['dateFullArrived'] = dateFullArrived;
    data['combineStuffing'] = combineStuffing;
    data['terminal'] = terminal;
    data['remark'] = remark;
    data['shipVoy'] = shipVoy;
    data['status'] = status;
    data['quanlity'] = quanlity;
    data['checkRemark'] = checkRemark;
    data['checkDetKH'] = checkDetKH;
    data['updateUser'] = updateUser;
    data['updateTime'] = updateTime;
    return data;
  }

  Future<List<CheckContainer>> fetchCheckContainers(String cntr) async {
    var url = '$SERVER/CheckContainer?container=$cntr&code=$code';
    if (cntr.isNotEmpty) {
      final response = await http.post(Uri.parse(url), headers: {
        "Content-Type": "application/json",
        "Authorization": "Bearer $tokenAuthorize",
      });
      if (response.statusCode == 200) {
        var body = response.body;
        List dataCheckCntr = jsonDecode(body);
        return dataCheckCntr
            .map((data) => CheckContainer.fromJson(data))
            .toList();
      } else {
        throw Exception('Error');
      }
    } else {
      throw Exception('Failed to load');
    }
  }
}
