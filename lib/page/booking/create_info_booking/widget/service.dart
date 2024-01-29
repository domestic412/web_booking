import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:web_booking/constants/color.dart';
import 'package:web_booking/model/booking/storage_controller/create_booking_controller.dart';

class ServiceWidget extends StatefulWidget {
  const ServiceWidget({super.key});

  @override
  State<ServiceWidget> createState() => _ServiceWidgetState();
}

class _ServiceWidgetState extends State<ServiceWidget> {
  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
              // width: 300,
              child: Row(
            children: [
              Container(
                  margin: EdgeInsets.only(left: 50),
                  width: 90,
                  child: Text('Service Term')),
              const SizedBox(
                width: 10,
              ),
              DropdownMenu<String>(
                width: 120,
                initialSelection:
                    createBookingController.currentServiceTerm.value,
                onSelected: (String? value) {
                  createBookingController.currentServiceTerm.value = value!;
                },
                dropdownMenuEntries: createBookingController.listServiceTerm
                    .map<DropdownMenuEntry<String>>((String value) {
                  return DropdownMenuEntry<String>(value: value, label: value);
                }).toList(),
              ),
            ],
          )),
          SizedBox(
            width: 30,
          ),
          Container(
              // width: 300,
              child: Row(
            children: [
              Text('Payment Term'),
              const SizedBox(
                width: 10,
              ),
              DropdownMenu<String>(
                width: 120,
                initialSelection:
                    createBookingController.currentPaymentTerm.value,
                onSelected: (String? value) {
                  createBookingController.currentPaymentTerm.value = value!;
                },
                dropdownMenuEntries: createBookingController.listPaymentTerm
                    .map<DropdownMenuEntry<String>>((String value) {
                  return DropdownMenuEntry<String>(value: value, label: value);
                }).toList(),
              ),
            ],
          )),
          SizedBox(
            width: 20,
          ),
          Container(
            width: 120,
            child: ListTile(
              title: const Text('COC'),
              leading: Radio(
                value: createBookingController.optionsContainer[0],
                groupValue:
                    createBookingController.currentOptionsContainer.value,
                activeColor: normalColor,
                onChanged: (String? value) {
                  setState(() {
                    createBookingController.currentOptionsContainer.value =
                        value!;
                  });
                },
              ),
            ),
          ),
          Container(
            width: 120,
            child: ListTile(
              title: const Text('SOC'),
              leading: Radio<String>(
                value: createBookingController.optionsContainer[1],
                groupValue:
                    createBookingController.currentOptionsContainer.value,
                activeColor: normalColor,
                onChanged: (String? value) {
                  setState(() {
                    createBookingController.currentOptionsContainer.value =
                        value!;
                  });
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
