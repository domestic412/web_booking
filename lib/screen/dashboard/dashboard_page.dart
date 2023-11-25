import 'package:flutter/material.dart';
import 'package:web_booking/constants/color.dart';
import 'package:web_booking/constants/style.dart';
import 'package:web_booking/constants/variable.dart';
import 'package:web_booking/model/list_request/model_request_list.dart';
import 'package:easy_localization/easy_localization.dart';

// ignore: must_be_immutable
class DashboardPage extends StatefulWidget {
  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  int tong = 0;
  int dong_y = 0;
  int tu_choi = 0;
  int dang_xu_ly = 0;
  int khac = 0;

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
          tong = snapshot.data!.length;
          return SizedBox(
            // use sizedbox to content always start on top
            height: deviceHeight(context),
            width: deviceWidth(context),
            child: Padding(
              padding: const EdgeInsets.all(32.0),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Container(
                      width: deviceWidth(context),
                      alignment: Alignment.center,
                      child: Text(
                        'title dashboard'.tr(),
                        style: style_title_page,
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.all(32),
                      width: deviceWidth(context),
                      decoration: BoxDecoration(
                        color: white,
                        border:
                            Border.all(color: blue.withOpacity(.4), width: .5),
                        boxShadow: [
                          BoxShadow(
                              offset: const Offset(0, 6),
                              color: blue.withOpacity(.1),
                              blurRadius: 12)
                        ],
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Tổng yêu cầu: $tong',
                            style: style_text_black,
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Text(
                            'Yeu cau chua xu ly: $dang_xu_ly',
                            style: style_text_grey,
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Text('Yeu cau duoc chap thuan: $dong_y',
                              style: style_text_green),
                          const SizedBox(
                            height: 20,
                          ),
                          Text('Yeu cau bi tu choi: $tu_choi',
                              style: style_text_red),
                          const SizedBox(
                            height: 20,
                          ),
                          khac == 0
                              ? SizedBox()
                              : Text('Yeu cau bi tu choi: $khac',
                                  style: style_text_grey),
                        ],
                      ),
                    ),
                    ListView.builder(
                      itemCount: snapshot.data!.length,
                      itemBuilder: (context, index) {
                        var data = snapshot.data![index];
                        if (data.trangThaiYc == 'A') {
                          ++dong_y;
                        } else if (data.trangThaiYc == 'R') {
                          ++tu_choi;
                        } else if (data.trangThaiYc == 'C') {
                          ++dang_xu_ly;
                        } else {
                          ++khac;
                        }
                        return SizedBox();
                      },
                    ),
                  ]),
            ),
          );
        }
        return Text('');
      },
    );
  }
}
