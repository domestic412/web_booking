import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:web_booking/constants/variable.dart';
import 'package:web_booking/model/booking/storage_controller/create_booking_controller.dart';
import 'package:web_booking/model/new_login/model_newlogin.dart';

class ConsigneeWidget extends StatefulWidget {
  const ConsigneeWidget({super.key});

  @override
  State<ConsigneeWidget> createState() => _ConsigneeWidgetState();
}

class _ConsigneeWidgetState extends State<ConsigneeWidget> {
  // var consignee_controller = TextEditingController();
  DataTable2s? selectConsignee;
  DataTable3s? selectRef;

  @override
  Widget build(BuildContext context) {
    List<DropdownMenuEntry<DataTable2s>> consigneeEntries =
        <DropdownMenuEntry<DataTable2s>>[];
    List listConsignee = box.read(consigneeList_signin).map((e) => DataTable2s.fromJson(e))
                  .toList();
    for (final consignee in listConsignee) {
      consigneeEntries.add(DropdownMenuEntry<DataTable2s>(
          value: consignee, label: consignee.shipperName.trim()));
    }

    List<DropdownMenuEntry<DataTable3s>> refEntries =
        <DropdownMenuEntry<DataTable3s>>[];
    List listRef = box.read(refList_signin).map((e) => DataTable3s.fromJson(e)).toList();
    for (final ref in listRef) {
      refEntries
          .add(DropdownMenuEntry<DataTable3s>(value: ref, label: ref.refNo.trim()));
    }
    return
        Obx(() =>
        Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Container(
            margin: EdgeInsets.only(left: 50),
            width: 90,
            child: Text('Consignee')),
        const SizedBox(width: 10),
        DropdownMenu<DataTable2s>(
          controller: createBookingController.consignee_controller.value,
          // enableFilter: true,
          // enableSearch: true,
          label: Text('Consignee'.tr),
          dropdownMenuEntries: consigneeEntries,
          onSelected: (DataTable2s? consignee) {
            setState(() {
              selectConsignee = consignee;
              createBookingController.consigneeId.value =
                  selectConsignee?.consigneeId ?? '';
            });
          },
        ),
        SizedBox(
          width: 30,
        ),
        Container(
            margin: EdgeInsets.only(left: 50),
            width: 90,
            child: Text('References')),
        const SizedBox(width: 10),
        DropdownMenu<DataTable3s>(
          controller: createBookingController.ref_controller.value,
          // enableFilter: true,
          // enableSearch: true,
          label: Text('Ref'.tr),
          dropdownMenuEntries: refEntries,
          onSelected: (DataTable3s? ref) {
            setState(() {
              selectRef = ref;
              createBookingController.refId.value =
                  selectRef?.refId ?? '';
            });
          },
        ),
      ],
      ),
    );
  }
}
