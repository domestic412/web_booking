import 'package:flutter/material.dart';
import 'package:web_booking/constants/message.dart';
import 'package:web_booking/screen/signup/Wigdet/combobox.dart';
import 'package:web_booking/screen/signup/view.dart';

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
            child: const Text(
              'Company Information',
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
                      textFieldBusinessNumber.trim(),
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
                    width: 80,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: Text(
                      textFieldCompanyName.trim(),
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
                        hintText: 'Please enter a company name',
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
                    width: 80,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: Text(
                      textFieldAddress.trim(),
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
                        hintText: 'Please enter an address',
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
                      textFieldOfficeInCharge.trim(),
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
                  width: 330,
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
