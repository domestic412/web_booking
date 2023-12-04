import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:web_booking/constants/color.dart';
import 'package:web_booking/constants/variable.dart';
import 'package:web_booking/model/tracking/model_tracking.dart';
import 'package:web_booking/utils/getx_route.dart';

class ContainerTrackingSearch extends StatefulWidget {
  const ContainerTrackingSearch({super.key});

  @override
  State<ContainerTrackingSearch> createState() =>
      _ContainerTrackingSearchState();
}

class _ContainerTrackingSearchState extends State<ContainerTrackingSearch> {
  TextEditingController _input = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 230,
      width: 400,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          color: Colors.white54,
          boxShadow: const [
            BoxShadow(
                color: Colors.white30,
                spreadRadius: 7,
                blurRadius: 7,
                offset: Offset(0, 3))
          ]),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 7,
            decoration: BoxDecoration(
                color: haian,
                borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(5), topRight: Radius.circular(5))),
          ),
          const SizedBox(
            height: 20,
          ),
          Container(
              alignment: Alignment.center,
              child: Text('container tracking'.tr,
                  style: TextStyle(fontSize: 25, color: haian))),
          const SizedBox(
            height: 10,
          ),
          Container(
            margin: const EdgeInsets.only(left: 20, right: 20),
            padding: const EdgeInsets.only(left: 10),
            decoration: BoxDecoration(
              color: Colors.white60,
              borderRadius: BorderRadius.circular(5),
            ),
            child: TextField(
              controller: _input,
              decoration: InputDecoration(
                  hintText: 'searchNumber'.tr, border: InputBorder.none),
            ),
          ),
          const SizedBox(
            height: 60,
          ),
          Container(
            alignment: Alignment.topRight,
            padding: const EdgeInsets.only(right: 20),
            child: InkWell(
              splashColor: green,
              highlightColor: blue,
              onTap: () {
                setState(() {
                  cntr_no_tracking = _input.text;
                  containerTracking = ContainerTracking()
                      .fetchContainerTracking(_input.text.toUpperCase());
                  // context.go(AppRoutes.trackingRoute);
                  Get.toNamed(GetRoutes.Tracking);
                });
              },
              child: Container(
                alignment: Alignment.center,
                width: 100,
                height: 40,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5), color: haian),
                child: Text(
                  'inquiry'.tr,
                  style: TextStyle(fontSize: 20, color: white),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
