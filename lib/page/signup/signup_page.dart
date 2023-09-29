import 'package:flutter/material.dart';
import 'package:web_booking/assets/constants/color.dart';
import 'package:web_booking/page/signup/Wigdet/account_widget.dart';
import 'package:web_booking/widgets/appbar.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
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

class _SignUpPageState extends State<SignUpPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: SafeArea(
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              // crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // AppbarWidget(),
                AccountPage(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
