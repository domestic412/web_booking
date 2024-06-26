import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:intl/intl.dart';
import 'package:web_booking/model/booking/model_booking_list.dart';
import 'package:web_booking/model/tracking/model_tracking.dart';
import 'package:web_booking/model/schedule/model_voyage.dart';


double deviceHeight(BuildContext context) => MediaQuery.of(context).size.height;
double deviceWidth(BuildContext context) => MediaQuery.of(context).size.width;

//format currency
final formatCurrency = NumberFormat('#,##0');

// Login
var box = GetStorage();
String login = 'signIn';
String is_staff_signin = 'IsStaff';
// String authorize_signin = 'authorize';
String maNV_signin = 'maNV';
// String tenNV_signin = 'tenNV';
String author_signin = 'author';
String code_signin = 'code';

String shipperId_signin = 'shipperid';
String shipperName_signin = 'shippername';
String managingOfficeId_signin = 'managingOfficeId';
String consigneeList_signin = 'consigneeList';
String refList_signin_json = 'refList';
String termList_signin = 'termList';
String commodityList_signin = 'commodityList';
String depotsList_booking = 'depoList';
String vessel_booking = 'vessel';
String voy_booking = 'voy';

String voyDetailId_booking = 'voyDetailId';

String polLocId_booking = 'polLocId';
String polId_final_booking = 'polId_final';
String pol_final_booking = 'pol_final';

String podLocId_booking = 'podLocId';
String podId_final_booking = 'podId_final';
String pod_final_booking = 'pod_final';

String date_booking = 'date';
String ref_booking = 'ref';

String savecntr = '';

// Booking page
// String? nameVoyage;
// String? dateVoyage;
// String? sizeVoyage;
// String? idVoyage;
// String? vesselName;
// String? polVoyage;
// List dataPorts = [];
// Ports? selectPort1;
// Ports? selectPort2;
// String? idPort1;
// String? namePort1;
// String? idPort2;
// String? namePort2;
Future<Voyage>? fetchVoyage;
TextEditingController soluongcntr = TextEditingController();

Future<List<BookingList>>? fetchBookingList;

// Select depo - size
String? nameDepo;
String? idDepo;
int? soluongContDepo;
String? sizeContDepo;

List<Depots> listPickDepo = <Depots>[];

// Port select in Booking page and Schedule
// String? dateSelect;
// String port1 = '';
// String port2 = '';
// TextEditingController port_select1 = TextEditingController();
// TextEditingController port_select2 = TextEditingController();
// TextEditingController date_select = TextEditingController();
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
