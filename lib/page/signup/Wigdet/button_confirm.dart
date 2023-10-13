import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';

class ButtonConfirm extends StatelessWidget {
  const ButtonConfirm({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const SizedBox(width: 20),
          InkWell(
            onTap: () {},
            child: Container(
              alignment: Alignment.center,
              height: 40,
              width: 180,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8), color: Colors.brown),
              child: Text(
                'cancle'.tr(),
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
          ),
          const SizedBox(
            width: 20,
          ),
          Container(
            width: 440,
            alignment: Alignment.center,
            height: 40,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8), color: Colors.black),
            child: Text(
              'create account'.tr(),
              style:
                  TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }
}
