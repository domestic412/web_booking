import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:web_booking/model/tracking/model_tracking.dart';
import 'package:web_booking/model/schedule/model_voyage.dart';

import '../model/schedule/model_port.dart';

double deviceHeight(BuildContext context) => MediaQuery.of(context).size.height;
double deviceWidth(BuildContext context) => MediaQuery.of(context).size.width;

// Login
var box = GetStorage();
String authorize_signin = 'authorize';
String maNV_signin = 'maNV';
String tenNV_signin = 'tenNV';
String author_signin = 'author';
String code_signin = 'code';

//id_ApprovalDetail = dataDetail['id'];
// TextEditingController note_detail_approval = TextEditingController();
// int? id_DetailApproval;
// String? tenYeuCau_DetailApproval;
// String? noiDung_DetailApproval;
// String? cntrno_DetailApproval;
// String? sizeType_DetailApproval;
// String? trangThaiYc_DetailApproval;
// String? noteHangTau_DetailApproval;
// String? updateTime_DetailApproval;

// List Request                         // miss
// int? id_ListRequest;
// String? cntrno_ListRequest;
// String? trangThaiYc_ListRequest;

// List Request Detail
// int? id_request_for_image;
String savecntr = '';
// String? tenYeuCau_DetailRequest;
// String? noiDung_DetailRequest;
// String? cntrno_DetailRequest;
// String? sizeType_DetailRequest;
// String? trangThaiYc_DetailRequest;
// String? noteHangTau_DetailRequest;
// String? updateTime_DetailRequest;

// //Check container
// String? cntrno_CheckCntr;
// String? sizeType_CheckCntr;
// String? soLanKetHop_CheckCntr;
// String? ghiChuTinhTrang_CheckCntr;
// String? luuYSuDung_CheckCntr;
// String? ketQua_CheckCntr;
// String? approval_CheckCntr;
// String? shipper_CheckCntr;
// String? remark_CheckCntr;
// String? updateTime_CheckCntr;

//List History
// String? id_history_Detail;
// String? cntrno_history_Detail;
// String? size_history_Detail;
// String? shipper_history_Detail;
// String? soLanKetHop_history_Detail;
// String? numKH_history_Detail;
// String? numCP_history_Detail;
// String? chatLuong_history_Detail;
// String? ketQua_history_Detail;
// String? updateTime_history_Detail;
// String? acc_history_Detail;

// Booking page
String? nameVoyage;
String? dateVoyage;
String? sizeVoyage;
String? idVoyage;
String? vesselName;
String? polVoyage;
List dataPorts = [];
Ports? selectPort1;
Ports? selectPort2;
String? idPort1;
String? namePort1;
String? idPort2;
String? namePort2;
Future<Voyage>? fetchVoyage;
TextEditingController soluongcntr = TextEditingController();

// Select depo - size
String? nameDepo;
String? idDepo;
int? soluongContDepo;
String? sizeContDepo;

// Port select in Booking page and Schedule
String? dateSelect;
String port1 = '';
String port2 = '';
TextEditingController port_select1 = TextEditingController();
TextEditingController port_select2 = TextEditingController();
TextEditingController date_select = TextEditingController();
// final List<DropdownMenuEntry<Ports>> portEntries = <DropdownMenuEntry<Ports>>[];

// Tracking page
Future<ContainerTracking>? containerTracking;
List? list_filter; //Need fix here
String cntr_no_tracking = '';

// Container Details page
Color? color_time;

// Quality
String? title_CUD_quality;
// int? id_quality;
// String? maChatLuong_quality;
// String? tenChatLuong_quality;
// String? ghiChu_quality;

// Policy
String? title_CUD_special_policy;
// int? id_policy;
// String? code_policy;
// String? shipper_policy;
// String? times_policy;

// User
String? title_user;
// int? id_user;
// String? maNV_user;
// String? tenNv_user;
// String? matKhau_user;
// String? dienthoai_user;
// String? email_user;
// String? author_user;

// CUD Quality-Policy-User
String? text_button_CUD;
Color? color_button_CUD;
int? CUD;
String? tittle_change_pw;
// List dataCode = [];
// String? codeValue;

String? cntr_no;

// Choose language
bool bool_lang = false;
