import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:html' as html;
import 'package:intl/intl.dart';
import 'package:flutter/services.dart';

import 'package:web_booking/constants/color.dart';
import 'package:web_booking/constants/global.dart';
import 'package:web_booking/model/list_history/storage_controller/export_history_controller.dart';


class DownloadButtonHistory extends StatefulWidget {
  @override
  _DownloadButtonHistoryState createState() => _DownloadButtonHistoryState();
}

class _DownloadButtonHistoryState extends State<DownloadButtonHistory> {
  bool isExport = false;

  Future<void> downloadFile(String fromDate, String toDate) async {

    final url = '$SERVER/History/ExportExcel?fromDay=$fromDate&toDay=$toDate'; // Replace with your direct link
    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      print('Export history done');
      final bytes = response.bodyBytes;
      final blob = html.Blob([bytes]);
      final url = html.Url.createObjectUrlFromBlob(blob);
      final anchor = html.AnchorElement(href: url)
        ..setAttribute('download', 'history.xlsx') // Change file name and extension as needed
        ..click();
      html.Url.revokeObjectUrl(url);
    } else {
      print('Error export history: ' + response.statusCode.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ElevatedButton(
          onPressed: () {
            setState(() {
              isExport = !isExport;
            });
          },
          style: ButtonStyle(
                          backgroundColor: MaterialStatePropertyAll<Color>(haian),
                          minimumSize: MaterialStateProperty.all(Size(100, 40))
                        ),
          child: Text('Export data'),
        ),
        SizedBox(height: 10,),
        isExport == true ? dateDownload(context) : SizedBox.shrink(),
      ],
    );
  }

  Row dateDownload(BuildContext context) {
    return Row(
        children: [
          Container(
            margin: EdgeInsets.only(right: 10),
            height: 40,
            width: 150,
            child: TextField(
              controller: exportHistoryController.fromDate.value,
              decoration: InputDecoration(
                fillColor: white,
                border: OutlineInputBorder(),
                label: Text(
                  'From Date',
                  style: TextStyle(fontSize: 14),
                ),
              ),
              onTap: () async {
                DateTime? pickeddate = await showDatePicker(
                    context: context,
                    initialDate: DateTime.now(),
                    firstDate: DateTime(2024),
                    lastDate: DateTime(2100));
                if (pickeddate != null) {
                  setState(() {
                    exportHistoryController.fromDate.value.text = DateFormat('dd/MM/yyyy')
                            .format(pickeddate);
                    exportHistoryController.fromDate_send.value = DateFormat('MM/dd/yyyy')
                        .format(pickeddate);     
                  });
                }
              },
            ),
          ),
          Container(
            margin: EdgeInsets.only(right: 10),
            height: 40,
            width: 150,
            child: TextField(
              controller: exportHistoryController.toDate.value,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                label: Text(
                  'To Date',
                  style: TextStyle(fontSize: 14),
                ),
              ),
              onTap: () async {
                DateTime? pickeddate = await showDatePicker(
                    context: context,
                    initialDate: DateTime.now(),
                    firstDate: DateTime(2024),
                    lastDate: DateTime(2100));
                if (pickeddate != null) {
                  setState(() {
                    exportHistoryController.toDate.value.text =
                        DateFormat('dd/MM/yyyy')
                            .format(pickeddate);
                    exportHistoryController.toDate_send.value = DateFormat('MM/dd/yyyy')
                        .format(pickeddate);     
                  });
                }
              },
            ),
          ),
          ElevatedButton(
        onPressed:  () {
          if (exportHistoryController.fromDate_send.value == '' || exportHistoryController.toDate_send.value == '') {
            print('Error: Choose date');
          } else {
            downloadFile(exportHistoryController.fromDate_send.value, exportHistoryController.toDate_send.value);
          }   
        },
        style: ButtonStyle(
                        backgroundColor: MaterialStatePropertyAll<Color>(haian),
                        minimumSize: MaterialStateProperty.all(Size(100, 40))
                      ),
        child: Text('Download'),
      ),
        ],
      );
  }
}