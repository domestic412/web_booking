import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:web_booking/constants/color.dart';
import 'package:web_booking/constants/variable.dart';
import 'package:web_booking/screen/tracking1/widgets/table_container_details1.dart';

class ContainerDetails1 extends StatefulWidget {
  const ContainerDetails1({super.key});

  @override
  State<ContainerDetails1> createState() => _ContainerDetails1State();
}

class _ContainerDetails1State extends State<ContainerDetails1> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: const EdgeInsets.only(left: 32, right: 32, bottom: 16),
          child: const Text(
            'Kết quả',
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
        ),
        SizedBox(
          height: 5,
        ),
        Container(
          width: deviceWidth(context),
          decoration: BoxDecoration(
            color: white,
            border: Border.all(color: blue.withOpacity(.4), width: .5),
            boxShadow: [
              BoxShadow(
                  offset: const Offset(0, 6),
                  color: blue.withOpacity(.1),
                  blurRadius: 12)
            ],
            borderRadius: BorderRadius.circular(8),
          ),
          margin: const EdgeInsets.only(bottom: 16, left: 32, right: 32),
          child: TableContainerDetails1(),
        ),
      ],
    );
  }
}
