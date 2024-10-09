import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:intl/intl.dart';
import 'package:web_booking/model/booking/model_booking_list.dart';
import 'package:web_booking/model/tracking/model_tracking.dart';
import 'package:web_booking/model/schedule/model_voyage.dart';

double deviceHeight(BuildContext context) => MediaQuery.of(context).size.height;
double deviceWidth(BuildContext context) => MediaQuery.of(context).size.width;

double? fullSizeHeight;
double? fullSizeWidth;

String eqcQuoteId_new = '00000000-0000-0000-0000-000000000000';

//format currency
final formatCurrency = NumberFormat('#,##0');

//format date
changeDatetoShow({required DateTime date}) {
  return DateFormat('dd/MM/yyyy').format(date);
}

changeDatetoSend({required DateTime date}) {
  return DateFormat('MM/dd/yyyy').format(date);
}

DateFormat dateFormat = DateFormat('dd/MM/yyyy');

// Login
var box = GetStorage();
String login = 'signIn';
String is_staff_signin = 'IsStaff';
String maNV_signin = 'maNV';
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

Future<Voyage>? fetchVoyage;
TextEditingController soluongcntr = TextEditingController();

Future<List<BookingList>>? fetchBookingList;

// Select depo - size
String? nameDepo;
String? idDepo;
int? soluongContDepo;
String? sizeContDepo;

List<Depots> listPickDepo = <Depots>[];

// Tracking page
Future<ContainerTracking>? containerTracking;
List? list_filter; //Need fix here
String cntr_no_tracking = '';

// Container Details page
Color? color_time;

// Quality
String? title_CUD_quality;

// Policy
String? title_CUD_special_policy;

// User
String? title_user;

// CUD Quality-Policy-User
String? text_button_CUD;
Color? color_button_CUD;
int? CUD;
String? tittle_change_pw;

String? cntr_no;

// Choose language
bool bool_lang = false;
