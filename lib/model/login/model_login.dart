import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:web_booking/constants/global.dart';
import 'package:web_booking/constants/variable.dart';
import 'package:web_booking/controllers/sidebar_controller.dart';
import 'package:web_booking/page/signin/controller_signin.dart/info_signin_controller.dart';
import 'package:web_booking/page/signin/popUpAlert/alert.dart';
import 'package:web_booking/page/signin/signin_page.dart';
import 'package:web_booking/utils/getx_route.dart';
import 'package:http/http.dart' as http;
import 'package:web_booking/widgets/appbar/checkInfoUser/infoUser_appbar.dart';

class Login {
  List<DataTable1s>? dataTable1s;
  List<DataTable2s>? dataTable2s;
  List<DataTable4s>? dataTable4s;
  List<DataTable5s>? dataTable5s;

  Login(
      {this.dataTable1s, this.dataTable2s, this.dataTable4s, this.dataTable5s});

  Login.fromJson(Map<String, dynamic> json) {
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

  Future<void> signIn(
      String username, String password, BuildContext context) async {
    try {
      final url = URL_LOGIN;
      Map data = {
        'username': username,
        'password': password,
      };
      var body = json.encode(data);
      if (username.isNotEmpty && password.isNotEmpty) {
        final response = await http.post(Uri.parse(url),
            headers: {"Content-Type": "application/json"}, body: body);
        switch (response.statusCode) {
          case 200:
            {
              var body = response.body;
              var dataLogIn = jsonDecode(body);
              checkDataLogin(dataLogIn);
              // print(dataLogIn);
              // String shipperId = dataNewLogIn['dataTable2s'][1]['shipperName'];

              switch (box.read(is_staff_signin)) {
                case 0:
                  {
                    //update infoUser
                    List infoUser = dataLogIn['dataTable1s'];
                    String shipperId = infoUser[0]['shipperId'];
                    String shipperName = infoUser[0]['shipperName'];
                    String managingOfficeId = infoUser[0]['managingOfficeId'];

                    //update consignee
                    var consigneeList_json = dataLogIn['dataTable2s'];
                    // List consigneeList = consigneeList_json
                    //     .map((e) => DataTable2s.fromJson(e))
                    //     .toList();

                    var termList_json = dataLogIn['dataTable4s'];
                    // List termList =
                    //     termList_json.map((e) => DataTable4s.fromJson(e)).toList();

                    var commodityList_json = dataLogIn['dataTable5s'];
                    // List commodityList = commodityList_json
                    //     .map((e) => DataTable5s.fromJson(e))
                    //     .toList();
                    // print(commodityList);
                    box.write(shipperId_signin, shipperId);
                    box.write(shipperName_signin, shipperName);
                    box.write(managingOfficeId_signin, managingOfficeId);
                    box.write(consigneeList_signin, consigneeList_json);
                    // box.write(refList_signin, refList_json);
                    box.write(termList_signin, termList_json);
                    box.write(commodityList_signin, commodityList_json);

                    inforUserController.updateInfoShipperController(
                      isStaff: 0,
                      shipperId: box.read(shipperId_signin),
                      shipperName: box.read(shipperName_signin),
                      managingOfficeId: box.read(managingOfficeId_signin),
                      consigneeList: box.read(consigneeList_signin),
                      termList: box.read(termList_signin),
                    );

                    // currentRouteController.route.value = checkingCombine;
                    controller.selectWidget.value = checkingCombine;
                    Get.toNamed(GetRoutes.Home);

                    // switch (currentRouteController.route.value) {
                    //   case booking:
                    //     Get.toNamed(GetRoutes.BookingRequest);
                    //     break;
                    //   case service:
                    //     Get.toNamed(GetRoutes.Home);
                    //     break;
                    //   case checkingCombine:
                    //     Get.toNamed(GetRoutes.Home);
                    //     break;
                    //   default:
                    //     Get.toNamed(GetRoutes.defaultRoute);
                    //     break;
                    // }
                    print('Login Success');
                    print(box.read(hostName));
                    // return Login.fromJson(dataNewLogIn);
                  }
                case 1:
                  {
                    String userId = dataLogIn[0]['userId'];
                    String userName = dataLogIn[0]['userName'];
                    String officeId = dataLogIn[0]['officeId'];
                    int isAdmin = dataLogIn[0]['isAdmin'];
                    box.write(shipperId_signin, userId);
                    box.write(shipperName_signin, userName);
                    box.write(managingOfficeId_signin, officeId);

                    switch (isAdmin) {
                      case 0: // user depo
                        {
                          inforUserController.updateInfoStaffController(
                            isStaff: 2,
                            shipperId: box.read(shipperId_signin),
                            shipperName: box.read(shipperName_signin),
                            managingOfficeId: box.read(managingOfficeId_signin),
                          );
                          Get.toNamed(GetRoutes.QuoteList);
                        }
                      case 1: //user admin
                        {
                          inforUserController.updateInfoStaffController(
                            isStaff: 1,
                            shipperId: box.read(shipperId_signin),
                            shipperName: box.read(shipperName_signin),
                            managingOfficeId: box.read(managingOfficeId_signin),
                          );
                          controller.selectWidget.value = checkingCombine;
                          Get.toNamed(GetRoutes.Home);
                        }
                    }
                    print(box.read(hostName));
                    // switch (currentRouteController.route.value) {
                    //   case checkingCombine:
                    //     Get.toNamed(GetRoutes.Home);
                    //     break;
                    //   default:
                    //     Get.toNamed(GetRoutes.defaultRoute);
                    //     break;
                    // }
                  }
                default:
                  LoginAlertDatabase(context);
              }
            }
          default:
            LoginAlert(context);
            throw Exception('Error - ${response.reasonPhrase}');
        }
      } else {
        ScaffoldMessenger.of(context)
            .showSnackBar(const SnackBar(content: Text("Invalid")));
        throw Exception('Error fetch Tracking');
      }
    } on Exception catch (e) {
      throw Exception('Error fetch Login - $e');
    }
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
