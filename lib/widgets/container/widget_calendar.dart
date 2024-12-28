import 'package:flutter/material.dart';
import 'package:flutter_popup/flutter_popup.dart';
import 'package:web_booking/constants/color.dart';
import 'package:web_booking/constants/style.dart';
import 'package:web_booking/constants/variable.dart';
import 'package:web_booking/controllers/date_controller.dart';
import 'package:web_booking/model/list_history/storage_controller/history_controller.dart';
import 'package:web_booking/widgets/container/widget_ContainerLabel.dart';

class WidgetCalendar extends StatefulWidget {
  WidgetCalendar({required this.refresh});
  Function refresh;

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
              initialDate: dateFormat.parse(dateController.fromDate_show.value),
              firstDate: DateTime(2024),
              lastDate: DateTime(2123),
              onDateChanged: (value) {
                dateController.fromDate_show.value =
                    changeDatetoShow(date: value);
                dateController.fromDate_send.value =
                    changeDatetoSend(date: value);
                // setState(() {
                Navigator.pop(context);
                // });
                widget.refresh();
              },
            ),
          ),
          child: Container(
            decoration: BoxDecoration(border: Border.all(color: grey)),
            margin: EdgeInsets.symmetric(horizontal: 10),
            padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
            child: Text(
              dateController.fromDate_show.value,
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
                initialDate: dateFormat.parse(dateController.toDate_show.value),
                firstDate: DateTime(2024),
                lastDate: DateTime(2123),
                onDateChanged: (value) {
                  dateController.toDate_show.value =
                      changeDatetoShow(date: value);
                  dateController.toDate_send.value =
                      changeDatetoSend(date: value);
                  // setState(() {
                  Navigator.pop(context);
                  // });
                  widget.refresh();
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
                dateController.toDate_show.value,
                style: style12_black,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
