// import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:web_booking/constants/color.dart';
import 'package:web_booking/constants/style.dart';
import 'package:web_booking/constants/variable.dart';
import 'package:web_booking/model/tracking/model_tracking.dart';

import 'package:web_booking/page/tracking/widgets/dropdownbox.dart';
import 'package:web_booking/page/tracking/widgets/container_list.dart';
import 'package:web_booking/widgets/appbar/appbar.dart';

import '../../widgets/footer.dart';

class TrackingPage extends StatefulWidget {
  const TrackingPage({super.key});

  @override
  State<TrackingPage> createState() => _TrackingPageState();
}

TextEditingController input = TextEditingController();
final ScrollController horizontalScroll = ScrollController();
double width_20 = 20;

class _TrackingPageState extends State<TrackingPage> {
  @override
  void initState() {
    super.initState();
    input.text = cntr_no_tracking;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      bottomSheet: Footer(),
      body: SafeArea(
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              appbar(),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Container(
                  margin: EdgeInsets.fromLTRB(10, 10, 10, 40),
                  decoration: BoxDecoration(
                      color: contentColor,
                      borderRadius: BorderRadius.circular(10)),
                  width: 1004,
                  padding: const EdgeInsets.fromLTRB(5, 10, 5, 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SelectableText(
                        'container tracking'.tr,
                        style: style_title_page,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Divider(
                        color: normalColor,
                        height: 1,
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Container(
                        padding: const EdgeInsets.only(bottom: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            DropdownButtonSearch(),
                            const SizedBox(width: 20),
                            Container(
                              height: 50,
                              width: 500,
                              child: TextField(
                                  controller: input,
                                  style: style_textfield,
                                  decoration: const InputDecoration(
                                      border: OutlineInputBorder())),
                            ),
                            const SizedBox(
                              width: 20,
                            ),
                            InkWell(
                              onTap: () {
                                setState(() {
                                  // containerTracking = ContainerTracking()
                                  //     .fetchContainerTracking(
                                  //         input.text.toUpperCase());
                                });
                              },
                              child: Container(
                                alignment: Alignment.center,
                                height: 50,
                                width: 80,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(5),
                                    color: normalColor),
                                child: Text(
                                  'search'.tr,
                                  style: style_text_button_detail,
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                      Container(
                        child: SelectableText(
                          'note_tracking'.tr,
                          style: style_text_Table_small,
                        ),
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      ContainerList(),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
