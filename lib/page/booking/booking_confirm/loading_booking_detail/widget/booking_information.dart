import 'package:flutter/material.dart';
import 'package:web_booking/model/booking_confirm/model_loading_booking_detail.dart';
import 'package:web_booking/model/booking_confirm/storage_controller/loading_booking_detail.dart';
import 'package:intl/intl.dart';

class BookingInfomation extends StatefulWidget {
  const BookingInfomation({super.key});

  @override
  State<BookingInfomation> createState() => _BookingInfomationState();
}

class _BookingInfomationState extends State<BookingInfomation> {
  @override
  Widget build(BuildContext context) {
    loadingBookingDetail.bkno_controller.value.text =
        loadingBookingDetail.inforDetail[0].bookingNo!;
    // var bkDate = DateFormat('dd/MM/yyyy')
    //     .parse(loadingBookingDetail.inforDetail[0].bookingDate!);
    // print(bkDate);
    // // var etd = loadingBookingDetail.inforDetail[0].etd ?? '';

    List<DropdownMenuEntry<DepOnOfficeModel>> depotsEntries =
        <DropdownMenuEntry<DepOnOfficeModel>>[];
    for (final depot in loadingBookingDetail.depOnOfficeModel) {
      depotsEntries.add(DropdownMenuEntry<DepOnOfficeModel>(
          value: depot, label: depot.depotName!));
    }
    return Column(
      children: [
        Row(
          children: [
            Container(
              width: 200,
              child: Text('Booking: '),
            ),
            Text(loadingBookingDetail.inforDetail[0].shipper! +
                ' - ' +
                loadingBookingDetail.inforDetail[0].bookingNo!),
          ],
        ),
        SizedBox(
          height: 20,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Container(
              width: 200,
              child: Text('Booking Date: '),
            ),
            Text(DateFormat('dd/MM/yyyy').format(DateTime.parse(
                loadingBookingDetail.inforDetail[0].bookingDate!))),
          ],
        ),
        SizedBox(
          height: 20,
        ),
        Row(
          children: [
            Container(
              width: 200,
              child: Text('BKNo.'),
            ),
            Container(
              width: 250,
              child: TextFormField(
                controller: loadingBookingDetail.bkno_controller.value,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Booking Number',
                  labelStyle: TextStyle(fontSize: 14),
                ),
              ),
            )
          ],
        ),
        SizedBox(
          height: 20,
        ),
        Row(
          children: [
            Container(
              width: 200,
              child: Text('Vessel - Voyage: '),
            ),
            Text(loadingBookingDetail.inforDetail[0].shipName! +
                ' - ' +
                loadingBookingDetail.inforDetail[0].voyId!),
          ],
        ),
        SizedBox(
          height: 20,
        ),
        Row(
          children: [
            Container(
              width: 200,
              child: Text('ETD: '),
            ),
            Text(DateFormat('dd/MM/yyyy').format(
                DateTime.parse(loadingBookingDetail.inforDetail[0].etd!))),
          ],
        ),
        SizedBox(
          height: 20,
        ),
        Row(
          children: [
            Container(
              width: 200,
              child: Text('C/S: '),
            ),
            Text(loadingBookingDetail.inforDetail[0].coc!),
          ],
        ),
        SizedBox(
          height: 20,
        ),
        Row(
          children: [
            Container(
              width: 200,
              child: Text('POL: '),
            ),
            Text(loadingBookingDetail.inforDetail[0].portLoad!),
          ],
        ),
        SizedBox(
          height: 20,
        ),
        Row(
          children: [
            Container(
              width: 200,
              child: Text('POD: '),
            ),
            Text(loadingBookingDetail.inforDetail[0].portDischarge!),
          ],
        ),
        SizedBox(
          height: 20,
        ),
        Row(
          children: [
            Container(
              width: 200,
              child: Text('Shipper: '),
            ),
            Text(loadingBookingDetail.inforDetail[0].shipName!),
          ],
        ),
        SizedBox(
          height: 20,
        ),
        Row(
          children: [
            Container(
              width: 200,
              child: Text('Consignee: '),
            ),
            Text(loadingBookingDetail.inforDetail[0].consignee!),
          ],
        ),
        SizedBox(
          height: 20,
        ),
        Row(
          children: [
            Container(
              width: 200,
              child: Text('Request Depot: '),
            ),
            Text(loadingBookingDetail.inforDetail[0].depot!),
          ],
        ),
        SizedBox(
          height: 20,
        ),
        Row(
          children: [
            Container(
              width: 200,
              child: Text('Confirm Depot: '),
            ),
            DropdownMenu<DepOnOfficeModel>(
              width: 250,
              // controller: loadingBookingDetail.inforDetail.depot,
              label: const Text('Depo'),
              dropdownMenuEntries: depotsEntries,
              onSelected: (DepOnOfficeModel? depot) {
                loadingBookingDetail.confirmDepotId.value =
                    depot!.depotId ?? '';
              },
            ),
          ],
        ),
        SizedBox(
          height: 20,
        ),
        Row(
          children: [
            Container(
              width: 200,
              child: Text('Special Request: '),
            ),
            Text(loadingBookingDetail.inforDetail[0].remark!),
          ],
        ),
      ],
    );
  }
}
