import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';
import 'package:web_booking/constants/color.dart';
import 'package:web_booking/utils/app_route_config.dart';
import 'package:web_booking/utils/getx_route.dart';
// import 'package:easy_localization/easy_localization.dart';

class TrackingMenu extends StatefulWidget {
  const TrackingMenu({super.key});

  @override
  State<TrackingMenu> createState() => _TrackingMenuState();
}

class _TrackingMenuState extends State<TrackingMenu> {
  // handle mouse Tracking
  bool isHovered_tracking = false;
  bool isHovered_containerTracking = false;
  Color tracking_color = Colors.black54;
  Color trackingContainer_color = black;

  void handleMouseEnter_tracking(PointerEnterEvent event) {
    setState(() {
      isHovered_tracking = true;
      tracking_color = haian;
    });
  }

  void handleMouseExit_tracking(PointerExitEvent event) {
    setState(() {
      isHovered_tracking = false;
      tracking_color = Colors.black54;
    });
  }

  void handleMouseEnter_containerTracking(PointerEnterEvent event) {
    setState(() {
      isHovered_containerTracking = true;
      trackingContainer_color = haian;
    });
  }

  void handleMouseExit_containerTracking(PointerExitEvent event) {
    setState(() {
      isHovered_containerTracking = false;
      trackingContainer_color = black;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: handleMouseEnter_tracking,
      onExit: handleMouseExit_tracking,
      child: Column(
        children: <Widget>[
          Container(
            alignment: Alignment.center,
            margin: EdgeInsets.only(top: 35),
            width: 200,
            child: Text(
              'tracking'.tr,
              style: TextStyle(
                  fontSize: 23,
                  fontWeight: FontWeight.bold,
                  color: tracking_color),
            ),
          ),
          if (isHovered_tracking)
            Container(
                margin: EdgeInsets.only(top: 20),
                height: 150,
                width: 180,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20)),
                child: Column(
                  children: [
                    Container(
                      height: 7,
                      width: 80,
                      decoration: BoxDecoration(
                          color: haian,
                          borderRadius: BorderRadius.circular(10)),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    MouseRegion(
                      onEnter: handleMouseEnter_containerTracking,
                      onExit: handleMouseExit_containerTracking,
                      child: InkWell(
                        onTap: () {
                          // context.go(AppRoutes.trackingRoute);
                          Get.toNamed(GetRoutes.Tracking);
                        },
                        child: Text(
                          'Container Tracking',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontSize: 16, color: trackingContainer_color),
                        ),
                      ),
                    ),
                  ],
                )),
        ],
      ),
    );
  }
}
