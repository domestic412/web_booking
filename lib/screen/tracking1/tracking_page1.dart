import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:web_booking/constants/color.dart';
import 'package:web_booking/constants/style.dart';
import 'package:web_booking/constants/variable.dart';
import 'package:web_booking/model/tracking/model_tracking.dart';
import 'package:web_booking/page/menu/tracking/widgets/dropdownbox.dart';
// import 'package:easy_localization/easy_localization.dart';
import 'package:web_booking/screen/tracking1/widgets/list_container1.dart';
import 'package:web_booking/widgets/container/widget_Button.dart';
import 'package:web_booking/widgets/container/widget_TextField.dart';

class Tracking1Page extends StatefulWidget {
  @override
  State<Tracking1Page> createState() => _Tracking1PageState();
}

TextEditingController _controller = TextEditingController();

class _Tracking1PageState extends State<Tracking1Page> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            width: deviceWidth(context),
            margin: EdgeInsets.only(bottom: 5),
            alignment: Alignment.center,
            child: Text(
              "title tracking container".tr,
              style: style_title_page,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(color: white, child: DropdownButtonSearch()),
              SizedBox(
                width: 5,
              ),
              WidgetTextFieldSearch(
                controller: _controller,
                width: 300,
                style: style14_black,
                onSubmitted: (value) {
                  setState(() {
                    containerTracking = ContainerTracking()
                        .fetchContainerTracking(_controller.text.toUpperCase());
                  });
                },
              ),
              SizedBox(
                width: 5,
              ),
              WidgetButton(
                text: 'search'.tr,
                style: ElevatedButton.styleFrom(
                  backgroundColor: haian,
                  minimumSize: Size(50, 35),
                ),
                onPressed: () {
                  setState(() {
                    containerTracking = ContainerTracking()
                        .fetchContainerTracking(_controller.text.toUpperCase());
                  });
                },
              )
            ],
          ),
          SizedBox(
            height: 5,
          ),
          Expanded(child: ListContainer1(_controller.text)),
        ],
      ),
    );
  }
}
