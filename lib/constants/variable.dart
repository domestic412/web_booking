import 'package:flutter/material.dart';
import 'package:web_booking/model/tracking/model_voyage.dart';

import '../model/tracking/model_port.dart';

double deviceHeight(BuildContext context) => MediaQuery.of(context).size.height;
double deviceWidth(BuildContext context) => MediaQuery.of(context).size.width;
// String? code;
int? id_CheckCntr;
String? cntrno_CheckCntr;
String? sizeType_CheckCntr;
String? soLanKetHop_CheckCntr;
String? soLanKetHopNum_CheckCntr;
String? tinhTrang_CheckCntr;
String? ghiChuTinhTrang_CheckCntr;
String? maChatLuong_CheckCntr;
String? ghiChuKetHop_CheckCntr;
String? luuYSuDung_CheckCntr;
String? ketQua_CheckCntr;
String? approval_CheckCntr;
String? shipper_CheckCntr;
String? dateFullOut_CheckCntr;
String? dateEmptyOut_CheckCntr;
String? dateFullArrived_CheckCntr;
String? combineStuffing_CheckCntr;
String? terminal_CheckCntr;
String? remark_CheckCntr;
String? shipVoy_CheckCntr;
String? status_CheckCntr;
String? quanlity_CheckCntr;
String? checkRemark_CheckCntr;
String? checkDetKh_CheckCntr;
String? updateUser_CheckCntr;
String? updateTime_CheckCntr;
// Appbar Leaguage
String dropdownValue = 'EN';

// Login
String? user;
String? tokenLogin;
String? code;
bool? visibi;

// List Request
int? id_ListRequest;
String? cntrno_ListRequest;
String? trangThaiYc_ListRequest;

// List Request Detail
String? id_request;
String savecntr = '';
String? tenYeuCau_ListRequestDetail;
String? noiDung_ListRequestDetail;
String? cntrno_ListRequestDetail;
String? sizeType_ListRequestDetail;
String? trangThaiYc_ListRequestDetail;
String? noteHangTau_ListRequestDetail;
String? updateTime_ListRequestDetail;

// Booking page
String? nameVoyage;
String? dateVoyage;
String? idVoyage;
String? vesselName;
String? polVoyage;
List dataPorts = [];
Ports? selectPort1;
Ports? selectPort2;
String? idPort1;
String? idPort2;
Future<Voyage>? fetchVoyage;

String? nameDepo;
String? idDepo;
int? soluongcontDepo;

bool bool_data_container = false;
String? cntr_no;

// Choose language
bool bool_lang = false;
