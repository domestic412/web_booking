import 'package:flutter/material.dart';
import 'package:web_booking/constants/color.dart';

import 'package:web_booking/screen/signup/Wigdet/account_widget.dart';
import 'package:web_booking/widgets/appbar.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({super.key});

  @override
  State<SignInPage> createState() => _SignInPageState();
}

final inputUserID = TextEditingController();
final inputPassword = TextEditingController();
final inputName = TextEditingController();
final inputTel = TextEditingController();
final inputEmail = TextEditingController();
final inputBusinessNo = TextEditingController();
final inputCompanyName = TextEditingController();
final inputAddress = TextEditingController();

final ScrollController horizontalScroll = ScrollController();
double width_20 = 20;
bool _validate = false;

class _SignInPageState extends State<SignInPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: SafeArea(
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              AppbarWidget(),
              AccountPage(),
            ],
          ),
        ),
      ),
    );
  }
}
