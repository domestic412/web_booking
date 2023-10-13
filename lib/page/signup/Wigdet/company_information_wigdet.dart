import 'package:flutter/material.dart';
import 'package:web_booking/constants/message.dart';
import 'package:web_booking/page/signup/Wigdet/combobox.dart';
import 'package:web_booking/page/signup/signup_page.dart';
import 'package:easy_localization/easy_localization.dart';


class CompanyInforWidget extends StatelessWidget {
  const CompanyInforWidget({
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
          Container(
            alignment: Alignment.centerLeft,
            child: Text(
              'company information'.tr(),
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
                    width: 100,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: Text(
                      // textFieldBusinessNumber.trim(),
                      'business number'.tr(),
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
                        hintText: 'Please enter only number without " - "',
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
                      // textFieldCompanyName.trim(),
                      'company name'.tr(),
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
                        hintText: 'company name'.tr(),
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
                      // textFieldAddress.trim(),
                      'address'.tr(),
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
                        hintText: 'address'.tr(),
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
                      // textFieldOfficeInCharge.trim(),
                      'office in charge'.tr(),
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
                      width: 150,
                      child: const DropdownButton1(),
                    ),
                    // Container(
                    //   width: 150,
                    //   child: TextFormField(
                    //       controller: inputPassword,
                    //       decoration: InputDecoration(
                    //         border: OutlineInputBorder(),
                    //         hintText: 'Name',
                    //         errorText: _validate
                    //             ? 'ID MUST BE AT\'t LEAST 5 DIGITS!'
                    //             : null,
                    //       )),
                    // ),
                  ],
                ),
                const SizedBox(width: 20),
                Container(
                  width: 350,
                  child: const DropdownButton1(),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
