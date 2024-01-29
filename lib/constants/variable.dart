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

String savecntr = '';

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
