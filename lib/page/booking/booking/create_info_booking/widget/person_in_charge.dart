import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:web_booking/constants/variable.dart';
import 'package:web_booking/model/booking/model_get_ref.dart';
import 'package:web_booking/model/booking/storage_controller/create_booking_controller.dart';
import 'package:web_booking/model/new_login/model_newlogin.dart';

import 'checkPrice.dart';

class PersonInChangeWidget extends StatefulWidget {
  const PersonInChangeWidget({super.key});

  @override
  State<PersonInChangeWidget> createState() => _PersonInChangeWidgetState();
}

class _PersonInChangeWidgetState extends State<PersonInChangeWidget> {
  // var consignee_controller = TextEditingController();
  DataTable2s? selectConsignee;
  GetRef? selectRef;

  @override
  Widget build(BuildContext context) {
    // print(box.read(refList_signin));
    List<DropdownMenuEntry<DataTable2s>> consigneeEntries =
        <DropdownMenuEntry<DataTable2s>>[];
    List listConsignee = box
        .read(consigneeList_signin)
        .map((e) => DataTable2s.fromJson(e))
        .toList();
    for (final consignee in listConsignee) {
      consigneeEntries.add(DropdownMenuEntry<DataTable2s>(
          value: consignee, label: consignee.shipperName.trim()));
    }

    List<DropdownMenuEntry<GetRef>> refEntries = <DropdownMenuEntry<GetRef>>[];
    // print(refEntries == <DropdownMenuEntry<GetRef>>[]);

    List<GetRef> listRef = box.read(ref_booking);
    for (final ref in listRef) {
      if (refEntries.length == 0) {
        refEntries.add(
            DropdownMenuEntry<GetRef>(value: ref, label: ref.refNo!.trim()));
      } else {
        List dataref = refEntries
            .where((item) => item.label.contains(ref.refNo!.trim()))
            .toList();
        if (dataref.length == 0) {
          refEntries.add(
              DropdownMenuEntry<GetRef>(value: ref, label: ref.refNo!.trim()));
        } else {}
      }
    }
    return Obx(
      () => Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
              margin: EdgeInsets.only(left: 50),
              width: 90,
              child: Text('Consignee')),
          const SizedBox(width: 10),
          DropdownMenu<DataTable2s>(
            width: 210,
            controller: createBookingController.consignee_controller.value,
            // enableFilter: true,
            // enableSearch: true,
            label: Text('Consignee'.tr),
            dropdownMenuEntries: consigneeEntries,
            onSelected: (DataTable2s? consignee) {
              // setState(() {
              selectConsignee = consignee;
              createBookingController.consigneeId.value =
                  selectConsignee?.consigneeId ?? '';
              // });
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
          DropdownMenu<GetRef>(
            controller: createBookingController.ref_controller.value,
            label: Text('Ref'.tr),
            dropdownMenuEntries: refEntries,
            onSelected: (GetRef? ref) {
              // setState(() {
              selectRef = ref;
              createBookingController.refId.value = selectRef?.refId ?? '';
              createBookingController.coc.value = selectRef?.coc ?? true;
              // createBookingController.dg.value = selectRef?.dg ?? false;
              createBookingController.checkPrice.value = checkPrice();
              // });
            },
          ),
        ],
      ),
    );
  }
}
