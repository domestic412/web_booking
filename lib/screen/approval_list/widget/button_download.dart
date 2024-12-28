import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:html' as html;
import 'package:intl/intl.dart';
import 'package:flutter/services.dart';

import 'package:web_booking/constants/color.dart';
import 'package:web_booking/constants/global.dart';
import 'package:web_booking/controllers/date_controller.dart';
import 'package:web_booking/model/list_approval/storage_controller/approval_controller.dart';
import 'package:web_booking/model/list_history/storage_controller/history_controller.dart';
import 'package:web_booking/widgets/container/widget_Button.dart';

class DownloadButtonApproval extends StatefulWidget {
  @override
  _DownloadButtonApprovalState createState() => _DownloadButtonApprovalState();
}

class _DownloadButtonApprovalState extends State<DownloadButtonApproval> {
  Future<void> downloadFile(String fromDate, String toDate) async {
    final url =
        '$SERVER/Requests/Export?fromDay=$fromDate&toDay=$toDate'; // Replace with your direct link
    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      print('Export approval list done');
      final bytes = response.bodyBytes;
      final blob = html.Blob([bytes]);
      final url = html.Url.createObjectUrlFromBlob(blob);
      final anchor = html.AnchorElement(href: url)
        ..setAttribute('download',
            'Requests List.xlsx') // Change file name and extension as needed
        ..click();
      html.Url.revokeObjectUrl(url);
    } else {
      print('Error export approval list: ' + response.statusCode.toString());
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
