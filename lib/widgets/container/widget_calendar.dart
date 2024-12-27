import 'package:flutter/material.dart';
import 'package:flutter_popup/flutter_popup.dart';
import 'package:web_booking/constants/color.dart';
import 'package:web_booking/constants/style.dart';
import 'package:web_booking/constants/variable.dart';
import 'package:web_booking/model/list_history/storage_controller/history_controller.dart';
import 'package:web_booking/widgets/container/widget_ContainerLabel.dart';

class WidgetCalendar extends StatefulWidget {
  WidgetCalendar({
    required this.fromDate_show,
    required this.fromDate_send,
    required this.toDate_show,
    required this.toDate_send,
    required this.voidCallback,
  });
  String fromDate_show;
  String fromDate_send;
  String toDate_show;
  String toDate_send;
  Function voidCallback;

  @override
  State<WidgetCalendar> createState() => _WidgetCalendarState();
}

class _WidgetCalendarState extends State<WidgetCalendar> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        WidgetContainerLabel(label: 'From Date', width: 90),
        CustomPopup(
          showArrow: false,
          content: SizedBox(
            height: 270,
            width: 270,
            child: CalendarDatePicker(
              initialDate: dateFormat.parse(widget.fromDate_show),
              firstDate: DateTime(2024),
              lastDate: DateTime(2123),
              onDateChanged: (value) {
                widget.fromDate_show = changeDatetoShow(date: value);
                widget.fromDate_send = changeDatetoSend(date: value);
                print(historyController.fromDate_show);
                print(historyController.toDate_show);
                setState(() {
                  Navigator.pop(context);
                });
                widget.voidCallback();
              },
            ),
          ),
          child: Container(
            decoration: BoxDecoration(border: Border.all(color: grey)),
            margin: EdgeInsets.symmetric(horizontal: 10),
            padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
            child: Text(
              widget.fromDate_show,
              style: style12_black,
            ),
          ),
        ),
        WidgetContainerLabel(label: 'To Date', width: 90),
        SizedBox(
          child: CustomPopup(
            showArrow: false,
            contentPadding: EdgeInsets.all(0),
            content: SizedBox(
              height: 270,
              width: 270,
              child: CalendarDatePicker(
                initialDate: dateFormat.parse(widget.toDate_show),
                firstDate: DateTime(2024),
                lastDate: DateTime(2123),
                onDateChanged: (value) {
                  widget.toDate_show = changeDatetoShow(date: value);
                  widget.toDate_send = changeDatetoSend(date: value);
                  // setState(() {
                  //   Navigator.pop(context);
                  // });
                },
              ),
            ),
            child: Container(
              decoration: BoxDecoration(
                border: Border.all(color: grey),
              ),
              margin: EdgeInsets.symmetric(horizontal: 10),
              padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
              child: Text(
                widget.toDate_show,
                style: style12_black,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
