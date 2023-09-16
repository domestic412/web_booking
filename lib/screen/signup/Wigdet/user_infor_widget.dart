import 'package:flutter/material.dart';
import 'package:web_booking/assets/constants/message.dart';
import 'package:web_booking/screen/signup/view.dart';

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
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
          ),
          Divider(
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
                    width: 80,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: Text(
                      textFieldUserId.trim(),
                      style: TextStyle(fontWeight: FontWeight.normal),
                    ),
                  ),
                ),
                const SizedBox(
                  width: 20,
                ),
                Container(
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
                    width: 80,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: Text(
                      textFieldPassword.trim(),
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
                            hintText: 'Password',
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
                      textFieldPasswordConfirm.trim(),
                      style: TextStyle(fontWeight: FontWeight.normal),
                    ),
                  ),
                ),
                Container(
                  width: 200,
                  child: TextFormField(
                      controller: inputPassword,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: 'Re-enter password',
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
                    width: 80,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: Text(
                      textFieldName.trim(),
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
                            hintText: 'Name',
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
                      textFieldTelNo.trim(),
                      style: TextStyle(fontWeight: FontWeight.normal),
                    ),
                  ),
                ),
                Container(
                  width: 200,
                  child: TextFormField(
                      controller: inputPassword,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: 'Tel No.',
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
                    width: 80,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: Text(
                      textFieldEmail.trim(),
                      style: TextStyle(fontWeight: FontWeight.normal),
                    ),
                  ),
                ),
                const SizedBox(
                  width: 20,
                ),
                Container(
                  width: 500,
                  child: TextField(
                      controller: inputUserID,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: 'Email',
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
