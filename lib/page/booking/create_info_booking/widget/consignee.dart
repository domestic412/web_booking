import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:web_booking/model/booking/storage_controller/create_booking_controller.dart';

class ConsigneeWidget extends StatefulWidget {
  const ConsigneeWidget({super.key});

  @override
  State<ConsigneeWidget> createState() => _ConsigneeWidgetState();
}

class _ConsigneeWidgetState extends State<ConsigneeWidget> {
  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
              margin: EdgeInsets.only(left: 70),
              width: 70,
              child: Text('Consignee')),
          const SizedBox(width: 10),
          createBookingController.boolNewConsignee.value == false
              ? DropdownMenu<String>(
                  initialSelection: createBookingController.listConsignee[0],
                  onSelected: (String? value) {
                    createBookingController.currentConsignee.value = value!;
                  },
                  dropdownMenuEntries: createBookingController.listConsignee
                      .map<DropdownMenuEntry<String>>((String value) {
                    return DropdownMenuEntry<String>(
                        value: value, label: value);
                  }).toList(),
                )
              : Container(
                  width: 400,
                  child: TextField(
                    controller: createBookingController.inputNewConsignee.value,
                    decoration: InputDecoration(
                        isDense: true,
                        border: OutlineInputBorder(),
                        contentPadding: EdgeInsets.all(10)),
                  ),
                ),
          SizedBox(
            height: 50,
            width: 50,
            child: Checkbox(
              value: createBookingController.boolNewConsignee.value,
              onChanged: (newValue) {
                setState(() {
                  createBookingController.boolNewConsignee.value =
                      !createBookingController.boolNewConsignee.value;
                });
              },
            ),
          ),
          Text('(New Consignee)')
        ],
      ),
    );
  }
}
