import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:jwt_decoder/jwt_decoder.dart';
import 'package:web_booking/constants/color.dart';
import 'package:web_booking/constants/global.dart';
import 'package:web_booking/constants/variable.dart';
import 'package:web_booking/page/signin/popUpAlert/alert.dart';
import 'package:web_booking/screen/Data_storage/dataStorage.dart';
import 'package:web_booking/utils/app_route_config.dart';
import 'package:http/http.dart' as http;
import 'package:web_booking/widgets/appbar/appbar.dart';

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
                      'SIGN IN',
                      style:
                          TextStyle(color: button, fontWeight: FontWeight.w900),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  InkWell(
                    onTap: () {
                      context.go(AppRoutes.SignUpRoute);
                    },
                    child: Container(
                        decoration: BoxDecoration(
                            color: Colors.white70,
                            borderRadius: BorderRadius.circular(5)),
                        padding: EdgeInsets.fromLTRB(10, 5, 10, 5),
                        child: Text(
                          'Create Account',
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
    var url = URL_LOGIN;
    Map data = {
      'username': username,
      'password': '123@ha'.toString() + password + 'haian'.toString(),
    };
    var body = json.encode(data);
    if (username.isNotEmpty && password.isNotEmpty) {
      LoadingAlert(context);

      final response = await http.post(Uri.parse(url),
          headers: {"Content-Type": "application/json"}, body: body);

      if (response.statusCode == 200) {
        var body = response.body;
        dataAuthorize = jsonDecode(body.toString())['token'];

        // // print(data['token']);
        Map<String, dynamic> decodedToken = JwtDecoder.decode(dataAuthorize!);
        results = decodedToken.values.toList();

        // Save tokenLogin
        await saveData();
        await getData();

        _user.clear();
        _password.clear();

        context.go(AppRoutes.HomeRoute);
      } else {
        LoginAlert(context);
      }
    } else {
      ScaffoldMessenger.of(context)
          .showSnackBar(const SnackBar(content: Text("Invalid")));
    }
  }
}

saveData() async {
  box = await Hive.openBox('myData');
  box.put('authorize', dataAuthorize!);
  box.put('tokenLogin', results[2]);
  box.put('maNV', results[3].trim());
  box.put('code', results[4]);
}

getData() async {
  print('get Data 1');
  try {
    box = await Hive.openBox('myData');
    tokenAuthorize = box.get('authorize');
    tokenLogin = box.get('tokenLogin');
    maNV = box.get('maNV');
    code = box.get('code');
    print(maNV);
  } catch (e) {
    print('This error is: $e');
  }
  print('get Data 2');
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
        'Welcome to HAI AN',
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
              decoration: const InputDecoration(
                  hintText: "User Name",
                  hintStyle: TextStyle(fontSize: 16, color: Colors.grey),
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
              decoration: const InputDecoration(
                  hintText: "Password",
                  hintStyle: TextStyle(fontSize: 16, color: Colors.grey),
                  border: InputBorder.none),
            ),
          )
        ],
      ),
    )
  ]);
}
