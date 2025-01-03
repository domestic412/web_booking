import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:web_booking/model/login/model_login.dart';

class WidgetUserPass extends StatelessWidget {
  WidgetUserPass(this.controller_user, this.controller_password, this.context);

  TextEditingController controller_user;
  TextEditingController controller_password;
  BuildContext context;

  @override
  Widget build(BuildContext context) {
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
                controller: controller_user,
                style: const TextStyle(fontSize: 18, color: Colors.black87),
                autofocus: true,
                decoration: InputDecoration(
                    hintText: "user name".tr,
                    // 'User Name',
                    hintStyle:
                        const TextStyle(fontSize: 16, color: Colors.grey),
                    border: InputBorder.none),
                onSubmitted: (value) {
                  Login().signIn(
                      controller_user.text, controller_password.text, context);
                },
              ),
            ),
            Container(
              height: 50,
              margin: const EdgeInsets.only(left: 10, right: 10),
              padding: const EdgeInsets.all(10),
              child: TextField(
                obscureText: true,
                controller: controller_password,
                style: const TextStyle(fontSize: 18, color: Colors.black87),
                decoration: InputDecoration(
                    hintText: "password".tr,
                    // 'Password',
                    hintStyle:
                        const TextStyle(fontSize: 16, color: Colors.grey),
                    border: InputBorder.none),
                onSubmitted: (value) {
                  Login().signIn(
                      controller_user.text, controller_password.text, context);
                },
              ),
            )
          ],
        ),
      )
    ]);
    ;
  }
}
