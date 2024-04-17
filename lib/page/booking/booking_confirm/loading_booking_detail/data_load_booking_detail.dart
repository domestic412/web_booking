import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:web_booking/constants/color.dart';
import 'package:web_booking/model/booking_confirm/model_loading_booking_detail.dart';
import 'package:web_booking/model/booking_confirm/storage_controller/loading_booking_detail.dart';

import 'widget/booking_information.dart';

class DataLoadingBookingDetail extends StatefulWidget {
  const DataLoadingBookingDetail({super.key});

  @override
  State<DataLoadingBookingDetail> createState() =>
      _DataLoadingBookingDetailState();
}

class _DataLoadingBookingDetailState extends State<DataLoadingBookingDetail> {
  @override
  Widget build(BuildContext context) {
    return dataLoadingBookingDetail();
  }

  FutureBuilder<LoadBookingDetail> dataLoadingBookingDetail() {
    return FutureBuilder<LoadBookingDetail>(
      future: LoadBookingDetail().fetchDataLoadBookingDetail(
          bookingId: loadingBookingDetail.bookingId.value),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const CircularProgressIndicator();
        } else if (snapshot.hasError) {
          return Text('Error: ${snapshot.error}');
        } else if (snapshot.hasData) {
          var data = snapshot.data;
          // add infoDetail controller
          loadingBookingDetail.inforDetail.value = data!.inforDetail!;
          loadingBookingDetail.commoditieDetail.value = data.commoditieDetail!;
          loadingBookingDetail.refDetails.value = data.refDetails!;
          loadingBookingDetail.depAvaModel.value = data.depAvaModel!;
          loadingBookingDetail.depOnOfficeModel.value = data.depOnOfficeModel!;

          // InforDetail(
          //   shipper: data!.inforDetail![0].shipper,
          //   consignee: data.inforDetail![0].consignee,
          //   notifyParty: data.inforDetail![0].notifyParty,
          //   shipName: data.inforDetail![0].shipName,
          //   voyId: data.inforDetail![0].voyId,
          //   etd: data.inforDetail![0].etd,
          //   bookingDate: data.inforDetail![0].bookingDate,
          //   bookingNo: data.inforDetail![0].bookingNo,
          //   coc: data.inforDetail![0].coc,
          //   portLoad: data.inforDetail![0].portLoad,
          //   portDischarge: data.inforDetail![0].portDischarge,
          //   depot: data.inforDetail![0].depot,
          //   requestDepotId: data.inforDetail![0].requestDepotId,
          //   remark: data.inforDetail![0].remark,
          // );
          return Column(
            children: [
              // BookingInfomation(),
              Container(
                padding: EdgeInsets.all(20),
                decoration: BoxDecoration(
                    color: contentColor,
                    border: Border.all(color: blue.withOpacity(.4), width: .5),
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [
                      BoxShadow(
                          color: blue.withOpacity(.4),
                          blurRadius: 4,
                          offset: Offset(2, 2))
                    ]),
                child: Column(
                  children: [
                    Text('Booking Information',
                        style: TextStyle(fontSize: 20, color: haian)),
                    Divider(
                      color: normalColor,
                      height: 1,
                    ),
                    const SizedBox(height: 20),
                    // BookingInfomation(),
                  ],
                ),
              ),
            ],
          );
        }
        return Text('');
      },
    );
  }
}
