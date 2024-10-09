import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:web_booking/constants/color.dart';
import 'package:web_booking/page/menu/quote/quote_page.dart';
import 'package:web_booking/page/menu/tracking/tracking_page.dart';
import 'package:web_booking/widgets/appbar/appbar.dart';
import 'package:web_booking/widgets/footer.dart';

class SupportPage extends StatefulWidget {
  const SupportPage({super.key});

  @override
  State<SupportPage> createState() => _SupportPageState();
}

class _SupportPageState extends State<SupportPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: WidgetAppBar(),
      backgroundColor: backgroundColor,
      bottomSheet: Footer(),
      body: SafeArea(
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              // AppbarWidget(),
              appbar(),
              // Container(
              //   margin: EdgeInsets.all(10),
              //   child: Row(
              //     mainAxisAlignment: MainAxisAlignment.center,
              //     children: [
              //       ElevatedButton(
              //           onPressed: () {
              //             Get.to(() => TrackingPage());
              //           },
              //           child: Text('Tracking')),
              //       SizedBox(width: 30),
              //       ElevatedButton(
              //           onPressed: () {
              //             Get.to(() => QuoteListPage());
              //           },
              //           child: Text('Quote')),
              //     ],
              //   ),
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
