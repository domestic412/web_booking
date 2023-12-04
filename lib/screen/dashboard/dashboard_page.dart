import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:web_booking/constants/color.dart';
import 'package:web_booking/constants/style.dart';
import 'package:web_booking/constants/variable.dart';
import 'package:web_booking/model/list_request/model_request_list.dart';
// import 'package:easy_localization/easy_localization.dart';

// ignore: must_be_immutable
class DashboardPage extends StatefulWidget {
  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  @override
  Widget build(BuildContext context) {
    return DataDashboard();
  }

  FutureBuilder<List<RequestList>> DataDashboard() {
    return FutureBuilder<List<RequestList>>(
      future: RequestList().fetchRequestList(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator());
        }
        if (snapshot.hasData) {
          int tong = snapshot.data!.length;
          int dong_y = 0;
          int tu_choi = 0;
          int dang_xu_ly = 0;
          int khac = 0;
          for (var i = 0; i < tong; i++) {
            if (snapshot.data![i].trangThaiYc == 'A') {
              ++dong_y;
            } else if (snapshot.data![i].trangThaiYc == 'R') {
              ++tu_choi;
            } else if (snapshot.data![i].trangThaiYc == 'C') {
              ++dang_xu_ly;
            } else {
              ++khac;
            }
          }
          return SizedBox(
            // use sizedbox to content always start on top
            height: deviceHeight(context),
            width: deviceWidth(context),
            child: Padding(
              padding: const EdgeInsets.all(32.0),
              child: SingleChildScrollView(
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Container(
                        width: deviceWidth(context),
                        alignment: Alignment.center,
                        child: Text(
                          'title dashboard'.tr,
                          style: style_title_page,
                        ),
                      ),
                      Container(
                          margin: EdgeInsets.symmetric(vertical: 16),
                          padding: EdgeInsets.all(32),
                          width: deviceWidth(context),
                          height: 225,
                          decoration: BoxDecoration(
                            color: white,
                            border: Border.all(
                                color: blue.withOpacity(.4), width: .5),
                            boxShadow: [
                              BoxShadow(
                                  offset: const Offset(0, 6),
                                  color: blue.withOpacity(.1),
                                  blurRadius: 12)
                            ],
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: SingleChildScrollView(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'all request'.tr + '$tong',
                                  style: style_text_black,
                                ),
                                const SizedBox(
                                  height: 20,
                                ),
                                Text(
                                  'request wait'.tr + '$dang_xu_ly',
                                  style: style_text_grey,
                                ),
                                const SizedBox(
                                  height: 20,
                                ),
                                Text('request approval'.tr + '$dong_y',
                                    style: style_text_green),
                                const SizedBox(
                                  height: 20,
                                ),
                                Text('request reject'.tr + '$tu_choi',
                                    style: style_text_red),
                                const SizedBox(
                                  height: 20,
                                ),
                                khac == 0
                                    ? SizedBox()
                                    : Text('Yêu cầu khác: $khac',
                                        style: style_text_grey),
                              ],
                            ),
                          )),
                    ]),
              ),
            ),
          );
        }
        return Text('');
      },
    );
  }
}
