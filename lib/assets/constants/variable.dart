import 'package:flutter/material.dart';

double deviceHeight(BuildContext context) => MediaQuery.of(context).size.height;
double deviceWidth(BuildContext context) => MediaQuery.of(context).size.width;

// Appbar Leaguage
String dropdownValue = 'EN';

// Booking page
String? nameVoyage;
String? dateVoyage;
String? idVoyage;
List dataPorts = [];

String? nameDepo;
String? idDepo;
int? soluongcontDepo;


