import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:html' as html;
import 'package:intl/intl.dart';
import 'package:flutter/services.dart';

import 'package:web_booking/constants/color.dart';
import 'package:web_booking/constants/global.dart';
import 'package:web_booking/controllers/date_controller.dart';
import 'package:web_booking/model/list_history/storage_controller/history_controller.dart';
import 'package:web_booking/page/signin/controller_signin.dart/info_signin_controller.dart';
import 'package:web_booking/widgets/container/widget_Button.dart';

class DownloadButtonHistory extends StatefulWidget {
  @override
  _DownloadButtonHistoryState createState() => _DownloadButtonHistoryState();
}

class _DownloadButtonHistoryState extends State<DownloadButtonHistory> {
  bool isExport = false;

  Future<void> downloadFile(String fromDate, String toDate) async {
    final url =
        '$SERVER/History/ExportExcel?fromDay=$fromDate&toDay=$toDate&id=${inforUserController.shipperId.value}'; // Replace with your direct link
    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      print('Export history done');
      final bytes = response.bodyBytes;
      final blob = html.Blob([bytes]);
      final url = html.Url.createObjectUrlFromBlob(blob);
      final anchor = html.AnchorElement(href: url)
        ..setAttribute('download',
            'history.xlsx') // Change file name and extension as needed
        ..click();
      html.Url.revokeObjectUrl(url);
    } else {
      print('Error export history: ' + response.statusCode.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return WidgetButton(
      text: 'Export Data',
      style: ElevatedButton.styleFrom(
        backgroundColor: haian,
        minimumSize: Size(90, 35),
      ),
      onPressed: () {
        downloadFile(dateController.fromDate_send.value,
            dateController.toDate_send.value);
      },
    );
  }
}
