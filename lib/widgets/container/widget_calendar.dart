import 'package:flutter/material.dart';
import 'package:flutter_popup/flutter_popup.dart';
import 'package:web_booking/constants/color.dart';
import 'package:web_booking/constants/style.dart';
import 'package:web_booking/constants/variable.dart';
import 'package:web_booking/model/eqc_quote/storage_controller/init_quote_controller.dart';
import 'package:web_booking/widgets/container/widget_ContainerLabel.dart';

class WidgetCalendar extends StatelessWidget {
  const WidgetCalendar({
    super.key,
  });

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
              initialDate:
                  dateFormat.parse(quoteController.fromDate_text.value),
              firstDate: DateTime(2024),
              lastDate: DateTime(2123),
              onDateChanged: (value) {
                quoteController.fromDate_text.value =
                    changeDatetoShow(date: value);
                quoteController.fromDate_send.value =
                    changeDatetoSend(date: value);
                // setState(() {
                //   Navigator.pop(context);
                // });
              },
            ),
          ),
          child: Container(
            decoration: BoxDecoration(border: Border.all(color: grey)),
            margin: EdgeInsets.symmetric(horizontal: 10),
            padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
            child: Text(
              quoteController.fromDate_text.value,
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
                initialDate:
                    dateFormat.parse(quoteController.toDate_text.value),
                firstDate: DateTime(2024),
                lastDate: DateTime(2123),
                onDateChanged: (value) {
                  quoteController.toDate_text.value =
                      changeDatetoShow(date: value);
                  quoteController.toDate_send.value =
                      changeDatetoSend(date: value);
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
                quoteController.toDate_text.value,
                style: style12_black,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
