// import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:web_booking/constants/color.dart';

class ScheduleMenu extends StatefulWidget {
  const ScheduleMenu({super.key});

  @override
  State<ScheduleMenu> createState() => _ScheduleMenuState();
}

class _ScheduleMenuState extends State<ScheduleMenu> {
  // handle mouse Schedule
  bool isHovered_schedule = false;
  bool isHovered_scheduleVessel = false;
  bool isHovered_schedulePort = false;
  Color schedule_color = Colors.black54;
  Color scheduleVessel_color = black;
  Color schedulePort_color = black;

  void handleMouseEnter_schedule(PointerEnterEvent event) {
    setState(() {
      isHovered_schedule = true;
      schedule_color = haian;
    });
  }

  void handleMouseExit_schedule(PointerExitEvent event) {
    setState(() {
      isHovered_schedule = false;
      schedule_color = Colors.black54;
    });
  }

  void handleMouseEnter_scheduleVessel(PointerEnterEvent event) {
    setState(() {
      isHovered_scheduleVessel = true;
      scheduleVessel_color = haian;
    });
  }

  void handleMouseExit_scheduleVessel(PointerExitEvent event) {
    setState(() {
      isHovered_scheduleVessel = false;
      scheduleVessel_color = black;
    });
  }

  void handleMouseEnter_schedulePort(PointerEnterEvent event) {
    setState(() {
      isHovered_schedulePort = true;
      schedulePort_color = haian;
    });
  }

  void handleMouseExit_schedulePort(PointerExitEvent event) {
    setState(() {
      isHovered_schedulePort = false;
      schedulePort_color = black;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: handleMouseEnter_schedule,
      onExit: handleMouseExit_schedule,
      child: Column(
        children: <Widget>[
          Container(
            alignment: Alignment.center,
            margin: EdgeInsets.only(top: 35),
            width: 200,
            child: Text(
              'schedule'.tr,
              style: TextStyle(
                  fontSize: 23,
                  fontWeight: FontWeight.bold,
                  color: schedule_color),
            ),
          ),
          if (isHovered_schedule)
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
                      onEnter: handleMouseEnter_schedulePort,
                      onExit: handleMouseExit_schedulePort,
                      child: InkWell(
                        onTap: () {
                          print('Port');
                        },
                        child: Text(
                          'Port - Port',
                          style: TextStyle(
                              fontSize: 16, color: schedulePort_color),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    MouseRegion(
                      onEnter: handleMouseEnter_scheduleVessel,
                      onExit: handleMouseExit_scheduleVessel,
                      child: InkWell(
                        onTap: () {
                          print('Vessel');
                        },
                        child: Text(
                          'Vessel',
                          style: TextStyle(
                              fontSize: 16, color: scheduleVessel_color),
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
