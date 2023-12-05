// import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:web_booking/page/tracking/widgets/table_container_details.dart';

class ContainerDetails extends StatefulWidget {
  const ContainerDetails({super.key});

  @override
  State<ContainerDetails> createState() => _ContainerDetailsState();
}

class _ContainerDetailsState extends State<ContainerDetails> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(bottom: 30),
      child: Column(children: [
        Container(
          padding: EdgeInsets.only(left: 45),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Icon(Icons.arrow_right),
              SelectableText('title_container'.tr),
            ],
          ),
        ),
        SizedBox(
          height: 5,
        ),
        TableContainerDetails()
      ]),
    );
  }
}
