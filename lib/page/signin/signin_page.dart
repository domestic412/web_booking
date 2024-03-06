import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jwt_decoder/jwt_decoder.dart';
import 'package:web_booking/constants/color.dart';
import 'package:web_booking/constants/global.dart';
import 'package:web_booking/page/signin/popUpAlert/alert.dart';
import 'package:http/http.dart' as http;
import 'package:web_booking/utils/getx_route.dart';
import 'package:web_booking/widgets/appbar/appbar.dart';

import '../../constants/variable.dart';
import 'controller_signin.dart/info_signin_controller.dart';

class SignInPage extends StatefulWidget {
  @override
  State<SignInPage> createState() => _SignInPageState();
}

TextEditingController _user = TextEditingController();
TextEditingController _password = TextEditingController();

class _SignInPageState extends State<SignInPage> {
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
                      signin(_user.text.toString(), _password.text.toString());
                    },
                    child: Text(
                      // 'sign in'.tr,
                      'Sign in',
                      style:
                          TextStyle(color: button, fontWeight: FontWeight.w900),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  InkWell(
                    onTap: () {
                      // context.go(AppRoutes.signUpRoute);
                      Get.toNamed(GetRoutes.NewSignIn);
                    },
                    child: Container(
                        decoration: BoxDecoration(
                            color: Colors.white70,
                            borderRadius: BorderRadius.circular(5)),
                        padding: EdgeInsets.fromLTRB(10, 5, 10, 5),
                        child: Text(
                          // 'create_account'.tr,
                          'New Login',
                          style: TextStyle(
                              fontSize: 14,
                              color: haian,
                              fontWeight: FontWeight.w500),
                        )),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    ));
  }

  Future<void> signin(String username, String password) async {
    try {
      var url = URL_LOGIN;
      Map data = {
        'username': username,
        'password': '123@ha'.toString() + password + 'haian'.toString(),
      };
      var body = json.encode(data);
      if (username.isNotEmpty && password.isNotEmpty) {
        final response = await http.post(Uri.parse(url),
            headers: {"Content-Type": "application/json"}, body: body);
        switch (response.statusCode) {
          case 200:
            var body = response.body;
            String dataAuthorize = jsonDecode(body.toString())['token'];
            // // print(data['token']);
            Map<String, dynamic> decodedToken =
                JwtDecoder.decode(dataAuthorize);
            // results = decodedToken.values.toList();
            String manv = decodedToken['MaNV'];
            String tennv = decodedToken['TenNV'];
            String author = decodedToken['Author'].trim();
            String code = decodedToken['Code'];

            //add data signIn to box GetStorage
            box.write(authorize_signin, dataAuthorize);
            box.write(maNV_signin, manv);
            box.write(tenNV_signin, tennv);
            box.write(author_signin, author);
            box.write(code_signin, code);

            _user.clear();
            _password.clear();

            informationController.updateInfomationSignIn(
                authorize: box.read(authorize_signin).toString().obs,
                maNV: box.read(maNV_signin).toString().obs,
                tenNV: box.read(tenNV_signin).toString().obs,
                author: box.read(author_signin).toString().obs,
                code: box.read(code_signin).toString().obs);

            switch (currentRouteController.route.value) {
              case 'default':
                Get.toNamed(GetRoutes.defaultRoute);
                break;
              case 'booking':
                Get.toNamed(GetRoutes.BookingRequest);
                break;
              case 'service':
                Get.toNamed(GetRoutes.Home);
                break;
              default:
                Get.toNamed(GetRoutes.defaultRoute);
            }
          default:
            CircularProgressIndicator(
              value: 0.0,
            );
            LoginAlert(context);
        }
      } else {
        ScaffoldMessenger.of(context)
            .showSnackBar(const SnackBar(content: Text("Invalid")));
      }
    } on Exception catch (e) {
      throw Exception('Error SignIn - $e');
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
        'welcome to HAI AN'.tr,
        // 'Welcome to HAI AN',
        style: TextStyle(
            fontSize: 30, fontWeight: FontWeight.bold, color: Colors.blue[900]),
      ));
}

Widget _buildInputUser() {
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
              controller: _user,
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
              controller: _password,
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
