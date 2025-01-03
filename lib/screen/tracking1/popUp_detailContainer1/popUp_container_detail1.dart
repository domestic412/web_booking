// import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:web_booking/screen/tracking1/data%20container/data_table_tracking_zim.dart';
import 'package:web_booking/screen/tracking1/data%20container/header_table_tracking_zim.dart';

// String? _dt;
Future<void> PopUpContainerDetail1(
    BuildContext context, DataTrackingZimSource _dataTrackingZimSource) async {
  return showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        backgroundColor: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        content: Container(
          // height: 1000,
          width: 1000,
          child: ListView(
            children: [
              Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Icon(Icons.arrow_right),
                    Text('title_container'.tr,
                        style: TextStyle(fontWeight: FontWeight.bold)),
                  ],
                ),
              ),
              SizedBox(
                height: 10,
              ),
              TableTrackingZim(_dataTrackingZimSource),
            ],
          ),
        ),
        actions: <Widget>[
          TextButton(
            child: const Text('OK'),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ],
      );
    },
  );
}
