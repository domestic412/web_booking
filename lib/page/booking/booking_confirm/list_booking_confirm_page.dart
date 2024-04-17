import 'package:flutter/material.dart';
import 'package:web_booking/constants/color.dart';
import 'package:web_booking/constants/style.dart';
import 'package:web_booking/widgets/appbar/appbar.dart';

import 'widget/data_list_booking_confirm.dart';

class BookingConfirmList extends StatefulWidget {
  @override
  State<BookingConfirmList> createState() => _BookingConfirmListState();
}

class _BookingConfirmListState extends State<BookingConfirmList> {
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
                margin: const EdgeInsets.fromLTRB(10, 10, 10, 40),
                decoration: BoxDecoration(
                    color: contentColor,
                    borderRadius: BorderRadius.circular(10)),
                width: 1004,
                padding: const EdgeInsets.fromLTRB(5, 10, 5, 10),
                child: Column(
                  children: [
                    SelectableText(
                      'List of Booking Confirmations',
                      style: style_title_page,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Divider(
                      color: normalColor,
                      height: 1,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    DataListBookingConfirm(),
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
