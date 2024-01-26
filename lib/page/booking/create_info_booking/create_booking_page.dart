import 'package:flutter/material.dart';
import 'package:web_booking/constants/color.dart';
import 'package:web_booking/constants/style.dart';
import 'package:web_booking/page/booking/create_info_booking/widget/service.dart';
import 'package:web_booking/widgets/appbar/appbar.dart';

import 'widget/add_information_cont.dart';
import 'widget/cargo_information.dart';
import 'widget/consignee.dart';
import 'widget/route_information.dart';

List<String> listConsginee = ['Consignee 1', 'Consignee 2', 'Consignee 3'];
String dropdownValue = listConsginee[0];
bool bool_new_consignee = false;
TextEditingController input_consignee = TextEditingController();

const List<String> listServiceTerm = <String>[
  'CY/CY',
  'CY/DR',
  'CY/FO',
  'DR/CY',
  'DR/DR',
  'FI/CY',
  'FI/FO'
];
String dropdownValueTerm = listServiceTerm.first;
const List<String> listPaymentTerm = <String>[
  'PREPAID',
  'COLLECT',
];
String dropdownPayment = listPaymentTerm.first;

List<int> optionsRoute = [0, 1];
int currentOptionsRoute = optionsRoute[0];

TextEditingController input_commodity = TextEditingController();

const List<String> listSizeContainer = <String>['20', '40', '45', '53'];
String currentSizeContainer = listSizeContainer[0];
const List<String> listType = <String>['DRY', 'REEFER'];
String currentTypeContainer = listType[0];
bool bool_type_container = false;
const List<String> listStatus = <String>['F', 'E'];
String currentStatusContainer = listStatus[0];

const List<String> listQuality = <String>[
  'A+',
  'A',
  'A-',
  'B+',
  'B',
  'B-',
  'C',
  'C-',
];
String currentQualityContainer = listQuality[0];

TextEditingController input_volume = TextEditingController();
TextEditingController input_weight = TextEditingController();
TextEditingController input_temp = TextEditingController();

bool bool_cont_dangerous = false;
TextEditingController input_rem = TextEditingController();

bool bool_add_cont = false;
bool bool_error = false;

class DepoPageTest extends StatefulWidget {
  @override
  State<DepoPageTest> createState() => _DepoPageTestState();
}

class _DepoPageTestState extends State<DepoPageTest> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: SingleChildScrollView(
        child: Column(
          children: [
            appbar(),
            Container(
              margin: const EdgeInsets.fromLTRB(10, 10, 10, 40),
              decoration: BoxDecoration(
                  color: contentColor, borderRadius: BorderRadius.circular(10)),
              width: 1004,
              padding: const EdgeInsets.fromLTRB(5, 10, 5, 10),
              child: Column(
                children: [
                  SelectableText(
                    'Create Booking',
                    style: style_title_page,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Divider(
                    color: normalColor,
                    height: 1,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  RouteInformationWidget(),
                  const SizedBox(height: 20),
                  ConsigneeWidget(),
                  const SizedBox(height: 20),
                  ServiceWidget(),
                  const SizedBox(height: 50),
                  CargoInformation(),
                  TableInformationContainer(),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
