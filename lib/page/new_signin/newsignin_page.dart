import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jwt_decoder/jwt_decoder.dart';
import 'package:web_booking/constants/color.dart';
import 'package:web_booking/constants/global.dart';
import 'package:web_booking/model/new_login/model_newlogin.dart';
import 'package:web_booking/page/signin/controller_signin.dart/info_signin_controller.dart';
import 'package:web_booking/page/signin/popUpAlert/alert.dart';
import 'package:http/http.dart' as http;
import 'package:web_booking/utils/getx_route.dart';
import 'package:web_booking/widgets/appbar/appbar.dart';

import '../../constants/variable.dart';
import 'controller_newsignin.dart/info_newsignin_controller.dart';

class NewSignInPage extends StatefulWidget {
  @override
  State<NewSignInPage> createState() => _NewSignInPageState();
}

// TextEditingController _user = TextEditingController();
// TextEditingController _password = TextEditingController();

class _NewSignInPageState extends State<NewSignInPage> {
  // InformationNewSignInController infoSignInController =
  //     Get.put(InformationNewSignInController());
  @override
  Widget build(BuildContext context) {
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
                      newSignIn(
                          inforUserController.username.value.text.toString(),
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

  Future<ModelNewLogin> newSignIn(String username, String password) async {
    try {
      final url = URL_NEWLOGIN;
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
              var dataNewLogIn = jsonDecode(body);
              var test = dataNewLogIn['dataTable2s'][1]['shipperName'];
              print(test);
              print('Login Success');
              return ModelNewLogin.fromJson(dataNewLogIn);
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
      'assets/images/hats_logo.png',
      height: 100,
      width: 200,
    ),
  );
}

Widget _buildAppbarName() {
  return Padding(
      padding: const EdgeInsets.only(top: 20),
      child: Text(
        'LOGIN'.tr,
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
