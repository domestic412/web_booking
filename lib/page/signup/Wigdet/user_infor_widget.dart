import 'package:flutter/material.dart';
import 'package:web_booking/constants/message.dart';
import 'package:web_booking/page/signup/signup_page.dart';
import 'package:easy_localization/easy_localization.dart';

class UserInforWidget extends StatelessWidget {
  const UserInforWidget({
    super.key,
    required bool validate,
  }) : _validate = validate;

  final bool _validate;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            height: 30,
          ),
          Container(
            alignment: Alignment.topCenter,
            child: Text(
              textAlign: TextAlign.center,
              'create account'.tr(),
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 36,
              ),
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          Container(
            child: Text(
              'user information'.tr(),
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
          ),
          const Divider(
            color: Colors.black,
          ),
          const SizedBox(
            height: 30,
          ),
          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const SizedBox(width: 20),
                InkWell(
                  child: Container(
                    alignment: Alignment.centerLeft,
                    height: 40,
                    width: 100,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: Text(
                      // textFieldUserId.trim(),
                      'user id'.tr(),
                      style: TextStyle(fontWeight: FontWeight.normal),
                    ),
                  ),
                ),
                const SizedBox(
                  width: 20,
                ),
                Container(
                  width: 520,
                  child: TextField(
                      controller: inputUserID,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: 'user id'.tr(),
                        errorText: _validate
                            ? 'ID MUST BE AT\'t LEAST 5 DIGITS!'
                            : null,
                      )),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          Container(
            //padding: const EdgeInsets.only(bottom: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const SizedBox(width: 20),
                InkWell(
                  child: Container(
                    alignment: Alignment.centerLeft,
                    height: 40,
                    width: 100,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: Text(
                      // textFieldPassword.trim(),
                      'password'.tr(),
                      style: TextStyle(fontWeight: FontWeight.normal),
                    ),
                  ),
                ),
                const SizedBox(
                  width: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      width: 200,
                      child: TextFormField(
                          controller: inputPassword,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            hintText: 'password'.tr(),
                            errorText: _validate
                                ? 'ID MUST BE AT\'t LEAST 5 DIGITS!'
                                : null,
                          )),
                    ),
                  ],
                ),
                const SizedBox(width: 20),
                InkWell(
                  child: Container(
                    alignment: Alignment.centerLeft,
                    height: 40,
                    width: 80,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: Text(
                      // textFieldPasswordConfirm.trim(),
                      're password'.tr(),
                      style: TextStyle(fontWeight: FontWeight.normal),
                    ),
                  ),
                ),
                Container(
                  width: 220,
                  child: TextFormField(
                      controller: inputPassword,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: 're password'.tr(),
                        errorText: _validate
                            ? 'ID MUST BE AT\'t LEAST 5 DIGITS!'
                            : null,
                      )),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          Container(
            //padding: const EdgeInsets.only(bottom: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const SizedBox(width: 20),
                InkWell(
                  child: Container(
                    alignment: Alignment.centerLeft,
                    height: 40,
                    width: 100,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: Text(
                      // textFieldName.trim(),
                      'full name'.tr(),
                      style: TextStyle(fontWeight: FontWeight.normal),
                    ),
                  ),
                ),
                const SizedBox(
                  width: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      width: 200,
                      child: TextFormField(
                          controller: inputPassword,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            hintText: 'full name'.tr(),
                            errorText: _validate
                                ? 'ID MUST BE AT\'t LEAST 5 DIGITS!'
                                : null,
                          )),
                    ),
                  ],
                ),
                const SizedBox(width: 20),
                InkWell(
                  child: Container(
                    alignment: Alignment.centerLeft,
                    height: 40,
                    width: 80,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: Text(
                      // textFieldTelNo.trim(),
                      'tel no'.tr(),
                      style: TextStyle(fontWeight: FontWeight.normal),
                    ),
                  ),
                ),
                Container(
                  width: 220,
                  child: TextFormField(
                      controller: inputPassword,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: 'tel no'.tr(),
                        errorText: _validate
                            ? 'ID MUST BE AT\'t LEAST 5 DIGITS!'
                            : null,
                      )),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          Container(
            //padding: const EdgeInsets.only(bottom: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const SizedBox(width: 20),
                InkWell(
                  child: Container(
                    alignment: Alignment.centerLeft,
                    height: 40,
                    width: 100,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: Text(
                      // textFieldEmail.trim(),
                      'email'.tr(),
                      style: TextStyle(fontWeight: FontWeight.normal),
                    ),
                  ),
                ),
                const SizedBox(
                  width: 20,
                ),
                Container(
                  width: 520,
                  child: TextField(
                      controller: inputUserID,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: 'email'.tr(),
                        errorText: _validate
                            ? 'ID MUST BE AT\'t LEAST 5 DIGITS!'
                            : null,
                      )),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
