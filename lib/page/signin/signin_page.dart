import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:web_booking/constants/color.dart';
import 'package:web_booking/constants/global.dart';
import 'package:web_booking/constants/variable.dart';
import 'package:web_booking/controllers/sidebar_controller.dart';
import 'package:web_booking/model/booking/model_get_ref.dart';
import 'package:web_booking/page/signin/controller_signin.dart/info_signin_controller.dart';
import 'package:web_booking/page/signin/popUpAlert/alert.dart';
import 'package:http/http.dart' as http;
import 'package:web_booking/utils/getx_route.dart';
import 'package:web_booking/widgets/appbar/appbar.dart';

class SignInPage extends StatefulWidget {
  @override
  State<SignInPage> createState() => _SignInPageState();
}

// TextEditingController _user = TextEditingController();
// TextEditingController _password = TextEditingController();

class _SignInPageState extends State<SignInPage> {
  // InformationNewSignInController infoSignInController =
  //     Get.put(InformationNewSignInController());
  GetRef getRef = GetRef();

  @override
  Widget build(BuildContext context) {
    // if (inforUserController.shipperName.value != "") {
    //   print(inforUserController.shipperName.value);
    //   currentRouteController.route.value = checkingCombine;
    //   controller.selectWidget.value = checkingCombine;
    //   Get.toNamed(GetRoutes.Home);
    // }
    // switch (inforUserController.shipperName.value) {
    //   case '':
    //     currentRouteController.route.value = checkingCombine;
    //     controller.selectWidget.value = checkingCombine;
    //     Get.toNamed(GetRoutes.SignIn);
    //   default:
    //     currentRouteController.route.value = checkingCombine;
    //     controller.selectWidget.value = checkingCombine;
    //     Get.toNamed(GetRoutes.Home);
    // }
    return Scaffold(
        body: Container(
      constraints: const BoxConstraints.expand(),
      decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/images/VesselHA1.jpg'),
              fit: BoxFit.cover)),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            appbar(),
            Container(
              height: 440,
              width: 400,
              margin: EdgeInsets.only(top: 160, bottom: 20),
              decoration: BoxDecoration(
                color: Colors.white70,
                borderRadius: BorderRadius.circular(15),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  _buildAppbarImage(),
                  _buildAppbarName(),
                  const SizedBox(
                    height: 30,
                  ),
                  _buildInputUser(),
                  const SizedBox(
                    height: 10,
                  ),
                  CupertinoButton(
                    color: Colors.white70,
                    onPressed: () {
                      signIn(inforUserController.username.value.text.toString(),
                          inforUserController.password.value.text.toString());
                    },
                    child: Text(
                      // 'sign in'.tr,
                      'Sign in',
                      style:
                          TextStyle(color: button, fontWeight: FontWeight.w900),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    ));
  }

  /// SignIn with username and password.
  ///
  /// If the username and password are correct, login and store the shipperId and shipperName
  /// in the box and navigate to the home page.
  ///
  /// If the username and password are incorrect, show a snackbar with an error message.
  ///
  /// If there is an error with the request, throw an exception with the error message.
  ///
  /// [username] is the username of the user.
  ///
  /// [password] is the password of the user.
  ///
  Future<void> signIn(String username, String password) async {
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
                    // return ModelNewLogin.fromJson(dataNewLogIn);
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

Widget _buildAppbarImage() {
  return Padding(
    padding: const EdgeInsets.only(top: 30),
    child: Image.asset(
      'assets/images/hact_logo.png',
      height: 100,
      width: 200,
    ),
  );
}

Widget _buildAppbarName() {
  return Padding(
      padding: const EdgeInsets.only(top: 20),
      child: Text(
        'welcome to HAI AN'.tr,
        style: TextStyle(
            fontSize: 30, fontWeight: FontWeight.bold, color: Colors.blue[900]),
      ));
}

Widget _buildInputUser() {
  // InformationNewSignInController infoSignInController =
  //     Get.put(InformationNewSignInController());
  return Column(children: <Widget>[
    Container(
      margin: const EdgeInsets.only(left: 30, right: 30),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10), color: Colors.white54),
      child: Column(
        children: [
          Container(
            decoration: const BoxDecoration(
                border: Border(bottom: BorderSide(color: Colors.grey))),
            height: 50,
            margin: const EdgeInsets.only(left: 10, right: 10),
            padding: const EdgeInsets.all(10),
            child: TextField(
              controller: inforUserController.username.value,
              style: const TextStyle(fontSize: 18, color: Colors.black87),
              autofocus: true,
              decoration: InputDecoration(
                  hintText: "user name".tr,
                  // 'User Name',
                  hintStyle: const TextStyle(fontSize: 16, color: Colors.grey),
                  border: InputBorder.none),
            ),
          ),
          Container(
            height: 50,
            margin: const EdgeInsets.only(left: 10, right: 10),
            padding: const EdgeInsets.all(10),
            child: TextField(
              obscureText: true,
              controller: inforUserController.password.value,
              style: const TextStyle(fontSize: 18, color: Colors.black87),
              decoration: InputDecoration(
                  hintText: "password".tr,
                  // 'Password',
                  hintStyle: const TextStyle(fontSize: 16, color: Colors.grey),
                  border: InputBorder.none),
            ),
          )
        ],
      ),
    )
  ]);
}

void checkDataLogin(dataLogin) {
  if (dataLogin is List) {
    box.write(is_staff_signin, 1);
    // print('data type list');
  } else if (dataLogin is Map<dynamic, dynamic>) {
    box.write(is_staff_signin, 0);
    // print('data type Map');
  } else {
    // print(dataLogin);
  }
}
