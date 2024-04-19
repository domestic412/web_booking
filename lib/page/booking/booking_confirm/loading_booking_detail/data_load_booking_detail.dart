import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:web_booking/constants/color.dart';
import 'package:web_booking/model/booking_confirm/model_loading_booking_detail.dart';
import 'package:web_booking/model/booking_confirm/storage_controller/loading_booking_detail.dart';
import 'package:web_booking/page/booking/booking_confirm/loading_booking_detail/widget/depo_information.dart';
import 'package:web_booking/page/booking/booking_confirm/loading_booking_detail/widget/freight_information.dart';

import 'widget/booking_information.dart';
import 'widget/cargo_information.dart';

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
          return Column(
            children: [
              Container(
                padding: EdgeInsets.all(20),
                margin: EdgeInsets.only(bottom: 20),
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
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Booking Information',
                        style: TextStyle(fontSize: 20, color: haian)),
                    Divider(
                      color: normalColor,
                      height: 1,
                    ),
                    const SizedBox(height: 20),
                    BookingInfomation(),
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.all(20),
                margin: EdgeInsets.only(bottom: 20),
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
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Depo Information',
                        style: TextStyle(fontSize: 20, color: haian)),
                    Divider(
                      color: normalColor,
                      height: 1,
                    ),
                    const SizedBox(height: 20),
                    DepoInformation(),
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.all(20),
                margin: EdgeInsets.only(bottom: 20),
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
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Cargo Information',
                        style: TextStyle(fontSize: 20, color: haian)),
                    Divider(
                      color: normalColor,
                      height: 1,
                    ),
                    const SizedBox(height: 20),
                    CargoInformation(),
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.all(20),
                margin: EdgeInsets.only(bottom: 20),
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
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Freight Information',
                        style: TextStyle(fontSize: 20, color: haian)),
                    Divider(
                      color: normalColor,
                      height: 1,
                    ),
                    const SizedBox(height: 20),
                    FreightInformation(),
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
