import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:web_booking/constants/color.dart';
import 'package:web_booking/constants/variable.dart';
import 'package:web_booking/model/booking/model_get_ref.dart';
import 'package:web_booking/model/login/model_login.dart';
import 'package:web_booking/page/signin/widget/widget_user_pass.dart';
import 'package:web_booking/widgets/appbar/appbar.dart';

class SignInPage extends StatefulWidget {
  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  // InformationNewSignInController infoSignInController =
  //     Get.put(InformationNewSignInController());

  TextEditingController _controller_user = TextEditingController();
  TextEditingController _controller_password = TextEditingController();
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
                  WidgetUserPass(
                      _controller_user, _controller_password, context),
                  const SizedBox(
                    height: 10,
                  ),
                  CupertinoButton(
                    color: Colors.white70,
                    onPressed: () {
                      Login().signIn(_controller_user.value.text.toString(),
                          _controller_password.value.text.toString(), context);
                    },
                    child: Text(
                      'sign in'.tr,
                      // 'Sign in',
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
