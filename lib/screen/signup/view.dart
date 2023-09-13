import 'package:flutter/material.dart';
import 'package:web_booking/assets/constants/color.dart';
import 'package:web_booking/assets/constants/message.dart';
import 'package:web_booking/assets/constants/style.dart';
import 'package:web_booking/widgets/appbar.dart';
import 'package:web_booking/widgets/footer.dart';

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
      bottomSheet: Footer(),
      body: SafeArea(
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              AppbarWidget(),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Container(
                  margin: EdgeInsets.fromLTRB(10, 10, 10, 40),
                  decoration: BoxDecoration(
                      color: contentColor,
                      borderRadius: BorderRadius.circular(10)),
                  width: 1004,
                  padding: const EdgeInsets.fromLTRB(5, 10, 5, 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        alignment: Alignment.topCenter,
                        child: const Text(
                          textAlign: TextAlign.center,
                          'CREATE ACCOUNT',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 36,
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      Container(
                        child: const Text(
                          'User Information',
                          textAlign: TextAlign.start,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                      ),
                      Divider(
                        color: normalColor,
                        height: 1,
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Container(
                        padding: const EdgeInsets.only(bottom: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const SizedBox(width: 20),
                            InkWell(
                              child: Container(
                                alignment: Alignment.center,
                                height: 40,
                                width: 80,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5),
                                ),
                                child: Text(
                                  textFieldUserId.trim(),
                                  style:
                                      TextStyle(fontWeight: FontWeight.normal),
                                ),
                              ),
                            ),
                            const SizedBox(
                              width: 20,
                            ),
                            Container(
                              height: 40,
                              width: 300,
                              child: TextField(
                                  controller: inputUserID,
                                  decoration: InputDecoration(
                                    border: OutlineInputBorder(),
                                    hintText: 'User ID',
                                    errorText: _validate
                                        ? 'ID MUST BE AT\'t LEAST 5 DIGITS!'
                                        : null,
                                  )),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Container(
                        padding: const EdgeInsets.only(bottom: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const SizedBox(width: 20),
                            InkWell(
                              child: Container(
                                alignment: Alignment.center,
                                height: 40,
                                width: 80,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5),
                                ),
                                child: Text(
                                  textFieldPassword.trim(),
                                  style:
                                      TextStyle(fontWeight: FontWeight.normal),
                                ),
                              ),
                            ),
                            const SizedBox(
                              width: 20,
                            ),
                            Container(
                              height: 40,
                              width: 300,
                              child: TextFormField(
                                  controller: inputPassword,
                                  decoration: InputDecoration(
                                    border: OutlineInputBorder(),
                                    hintText: 'Password',
                                    errorText: _validate
                                        ? 'ID MUST BE AT\'t LEAST 5 DIGITS!'
                                        : null,
                                  )),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Container(
                        child: const Text(
                          textFieldName,
                          textAlign: TextAlign.start,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Container(
                        child: const Text(
                          textFieldEmail,
                          textAlign: TextAlign.start,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
