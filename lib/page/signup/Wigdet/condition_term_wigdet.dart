import 'package:flutter/material.dart';
import 'package:get/get.dart';
// import 'package:easy_localization/easy_localization.dart';

class ConditionTermWidget extends StatelessWidget {
  const ConditionTermWidget({
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    bool _value = false;
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            alignment: Alignment.centerLeft,
            child: Text(
              'agree to terms'.tr,
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
            height: 20,
          ),
          Container(
            width: 660,
            //padding: const EdgeInsets.only(bottom: 10),
            padding: EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: Colors.grey[100],
              borderRadius: BorderRadius.circular(14),
            ),
            child: Row(
              children: [
                Checkbox(value: _value, onChanged: (_value) {}),
                SizedBox(
                  width: 20,
                ),
                Text(
                  // textFieldAgreeToTermsAndConditions,
                  'i agree to terms'.tr,
                  style: TextStyle(
                    fontWeight: FontWeight.normal,
                    fontSize: 16,
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
