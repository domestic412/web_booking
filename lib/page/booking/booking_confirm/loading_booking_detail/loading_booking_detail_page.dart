import 'package:flutter/material.dart';
import 'package:web_booking/constants/color.dart';
import 'package:web_booking/constants/style.dart';
import 'package:web_booking/page/booking/booking_confirm/loading_booking_detail/data_load_booking_detail.dart';
import 'package:web_booking/widgets/appbar/appbar.dart';

class LoadingBookingDetailPage extends StatefulWidget {
  @override
  State<LoadingBookingDetailPage> createState() => _LoadingBookingDetailPage();
}

class _LoadingBookingDetailPage extends State<LoadingBookingDetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              appbar(),
              Container(
                margin: const EdgeInsets.fromLTRB(10, 10, 10, 10),
                decoration: BoxDecoration(
                    color: backgroundColor
                    // contentColor
                    ,
                    borderRadius: BorderRadius.circular(10)),
                width: 1004,
                padding:
                    const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
                child: Column(
                  children: [
                    SelectableText(
                      'Details of Booking Confirm',
                      style: style_title_page,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    DataLoadingBookingDetail(),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
