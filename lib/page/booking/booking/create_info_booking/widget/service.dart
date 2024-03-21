import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:web_booking/constants/color.dart';
import 'package:web_booking/constants/variable.dart';
import 'package:web_booking/model/booking/storage_controller/create_booking_controller.dart';
import 'package:web_booking/model/new_login/model_newlogin.dart';

class ServiceWidget extends StatefulWidget {
  const ServiceWidget({super.key});

  @override
  State<ServiceWidget> createState() => _ServiceWidgetState();
}

class _ServiceWidgetState extends State<ServiceWidget> {
  DataTable4s? selectTerm;

  @override
  Widget build(BuildContext context) {
    List<DropdownMenuEntry<DataTable4s>> termEntries =
        <DropdownMenuEntry<DataTable4s>>[];
    List listTerm = box.read(termList_signin).map((e) => DataTable4s.fromJson(e)).toList();;
    for (final term in listTerm) {
      termEntries
          .add(DropdownMenuEntry<DataTable4s>(value: term, label: term.term.trim()));
    }
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
                  child: Text('Term')),
              DropdownMenu<DataTable4s>(
                width: 120,
                controller: createBookingController.term_controller.value,
                // enableFilter: true,
                // enableSearch: true,
                label: Text('Term'.tr),
                dropdownMenuEntries: termEntries,
                onSelected: (DataTable4s? term) {
                  setState(() {
                    selectTerm = term;
                    createBookingController.term.value = selectTerm?.term ?? '';
                  });
                },
              ),
            ],
          )),
          SizedBox(
            width: 50,
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
                width: 150,
                label: Text('Payment'.tr),
                initialSelection: createBookingController.paymentTerm.value,
                onSelected: (String? value) {
                  createBookingController.paymentTerm.value = value!;
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
                groupValue: createBookingController.coc.value,
                activeColor: normalColor,
                onChanged: (bool? value) {
                  // setState(() {
                  createBookingController.coc.value = value!;
                  // });
                },
              ),
            ),
          ),
          Container(
            width: 120,
            child: ListTile(
              title: const Text('SOC'),
              leading: Radio(
                value: createBookingController.optionsContainer[1],
                groupValue: createBookingController.coc.value,
                activeColor: normalColor,
                onChanged: (bool? value) {
                  // setState(() {
                  createBookingController.coc.value = value!;
                  // });
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
