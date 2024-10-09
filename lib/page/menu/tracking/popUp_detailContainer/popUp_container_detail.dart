// ignore: depend_on_referenced_packages
// import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:web_booking/constants/color.dart';
import 'package:web_booking/page/menu/tracking/widgets/table_container_details.dart';

// ignore: non_constant_identifier_names
Future<void> PopUpContainerDetail(BuildContext context) {
  return showDialog(
    context: context,
    builder: (BuildContext context) {
      return Center(
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: AlertDialog(
            backgroundColor: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            content: Column(children: [
              Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const Icon(Icons.arrow_right),
                    SelectableText('title_container'.tr,
                        style: const TextStyle(fontWeight: FontWeight.bold)),
                  ],
                ),
              ),
              Container(
                // width: deviceWidth(context),
                // decoration: BoxDecoration(
                //   color: white,
                //   // border: Border.all(color: blue.withOpacity(.4), width: .5),
                //   boxShadow: [
                //     BoxShadow(
                //         offset: const Offset(0, 6),
                //         color: blue.withOpacity(.1),
                //         blurRadius: 12)
                //   ],
                //   borderRadius: BorderRadius.circular(8),
                // ),
                margin: const EdgeInsets.symmetric(vertical: 10),
                child: TableContainerDetails(),
              ),
              Center(
                child: ElevatedButton(
                    style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all(normalColor)),
                    onPressed: () {
                      Get.back();
                    },
                    child: Text('Back')),
              )
            ]),
          ),
        ),
      );
    },
  );
}
