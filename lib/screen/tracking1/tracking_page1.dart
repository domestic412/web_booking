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
    return ListView(
      children: [
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                width: deviceWidth(context),
                alignment: Alignment.center,
                child: Text(
                  "title tracking container".tr,
                  style: style_title_page,
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  color: white,
                  border: Border.all(color: blue.withOpacity(.4), width: .5),
                  boxShadow: [
                    BoxShadow(
                        offset: const Offset(0, 6),
                        color: blue.withOpacity(.1),
                        blurRadius: 12)
                  ],
                  borderRadius: BorderRadius.circular(4),
                ),
                padding: const EdgeInsets.all(4),
                margin: const EdgeInsets.symmetric(vertical: 10),
                child: Row(
                  children: [
                    DropdownButtonSearch(),
                    Expanded(
                        child: WidgetTextFieldSearch(
                      controller: _controller,
                      width: 500,
                      onSubmitted: (value) {
                        setState(() {
                          containerTracking = ContainerTracking()
                              .fetchContainerTracking(
                                  _controller.text.toUpperCase());
                        });
                      },
                    )
                        // Container(
                        //   height: 40,
                        //   width: 500,
                        //   margin: EdgeInsets.symmetric(horizontal: 20),
                        //   child: TextField(
                        //       controller: inputTracking1,
                        //       onSubmitted: (value) {
                        //         setState(() {
                        //           containerTracking = ContainerTracking()
                        //               .fetchContainerTracking(
                        //                   inputTracking1.text.toUpperCase());
                        //         });
                        //       },
                        //       style: style_textfield,
                        //       decoration: const InputDecoration(
                        //           border: OutlineInputBorder())),
                        // ),
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
                              .fetchContainerTracking(
                                  _controller.text.toUpperCase());
                        });
                      },
                    )
                    // InkWell(
                    //   onTap: () {
                    //     setState(() {
                    //       containerTracking = ContainerTracking()
                    //           .fetchContainerTracking(
                    //               _controller.text.toUpperCase());
                    //     });
                    //   },
                    //   child: Container(
                    //     alignment: Alignment.center,
                    //     height: 30,
                    //     width: 80,
                    //     decoration: BoxDecoration(
                    //         borderRadius: BorderRadius.circular(5),
                    //         color: normalColor),
                    //     child: Text(
                    //       'search'.tr,
                    //       style: style_text_button_detail,
                    //     ),
                    //   ),
                    // )
                  ],
                ),
              ),
              ListContainer1(_controller.text),
            ],
          ),
        ),
      ],
    );
  }
}
