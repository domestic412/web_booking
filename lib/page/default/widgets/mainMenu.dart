import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';
import 'package:web_booking/assets/constants/color.dart';
import 'package:web_booking/assets/constants/variable.dart';
import 'package:web_booking/assets/utils/project/routes/app_route_config.dart';
import 'package:easy_localization/easy_localization.dart';

class mainMenu extends StatefulWidget {
  const mainMenu({
    super.key,
  });

  @override
  State<mainMenu> createState() => _mainMenuState();
}

class _mainMenuState extends State<mainMenu> {
  bool isHovered_booking = false;
  bool isHovered_bookingRequest = false;
  Color booking_color = Colors.black54;
  Color bookingRequest_color = black;

  // Color booking_color = Color.fromARGB(255, 21, 123, 206);
  // Color tracking_color = Color.fromARGB(255, 21, 123, 206);

  bool isHovered_tracking = false;
  bool isHovered_containerTracking = false;
  Color tracking_color = Colors.black54;
  Color trackingContainer_color = black;


  bool isHovered_schedule = false;
  bool isHovered_scheduleVessel = false;
  bool isHovered_schedulePort = false;
  Color schedule_color = Colors.black54;
  Color scheduleVessel_color = black;
  Color schedulePort_color = black;

  // bool isHovered_signUp = false;
  Color? signUp_color = Colors.blue[900];

  void handleMouseEnter_booking(PointerEnterEvent event) {
    setState(() {
      isHovered_booking = true;
      booking_color = haian;
    });
  }
  
  void handleMouseExit_booking(PointerExitEvent event) {
    setState(() {
      isHovered_booking = false;
      // booking_color = Color.fromARGB(255, 21, 123, 206);
      booking_color = Colors.black54;
    });
  }

  void handleMouseEnter_bookingRequest(PointerEnterEvent event) {
    setState(() {
      isHovered_bookingRequest = true;
      bookingRequest_color = haian;
    });
  }
  
  void handleMouseExit_bookingRequest(PointerExitEvent event) {
    setState(() {
      isHovered_bookingRequest = false;
      bookingRequest_color = black;
    });
  }

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

  void handleMouseEnter_signUp(PointerEnterEvent event) {
    setState(() {
      // isHovered_signUp = true;
      signUp_color = haian;
    });
  }
  
  void handleMouseExit_signUp(PointerExitEvent event) {
    setState(() {
      // isHovered_signUp = false;
      signUp_color = Colors.blue[900];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          // alignment: Alignment.center,
          height: 250,
          child: Stack(
            children: <Widget>[ 
              Container(
                width: deviceWidth(context),
                height: 100,
                color: Colors.white70,
              ),
              Container(
                alignment: Alignment.topCenter,
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Container(
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          height: 100,
                            width: 200,
                            padding: const EdgeInsets.all(15),
                            child: Image.asset(
                                'lib/assets/images/hats_logo.png')),
                        SizedBox(width: 200,),
                        MouseRegion(
                          onEnter: handleMouseEnter_booking,
                          onExit: handleMouseExit_booking,
                          child: Column(
                            children: <Widget> [
                              Container(
                                alignment: Alignment.center,
                                margin: EdgeInsets.only(top: 35),
                                width: 200,
                                child: Text('booking'.tr(), style: TextStyle(fontSize: 23,fontWeight: FontWeight.bold, color: booking_color),),
                              ),
                              if (isHovered_booking)
                              Container(
                                margin: EdgeInsets.only(top: 20),
                                height: 150,
                                width: 180,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(20)
                                ),
                                child: Column(
                                  children: [
                                    Container(
                                      height: 7,
                                      width: 80,
                                      decoration: BoxDecoration(
                                        color: haian,
                                        borderRadius: BorderRadius.circular(10)
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 30,
                                    ),
                                    MouseRegion(
                                      onEnter: handleMouseEnter_bookingRequest,
                                      onExit: handleMouseExit_bookingRequest,
                                      child: InkWell(
                                        onTap: () {
                                          context.go(AppRoutes.BookingRoute);
                                        },
                                        child: Text('Booking Request', 
                                          textAlign: TextAlign.center, 
                                          style: TextStyle(fontSize: 16, color: bookingRequest_color),),
                                      ),
                                    ),
                                  ],
                                )),
                            ],
                          ),
                        ),
                        MouseRegion(
                          onEnter: handleMouseEnter_tracking,
                          onExit: handleMouseExit_tracking,
                          child: Column(
                            children: <Widget> [
                              Container(
                                alignment: Alignment.center,
                                margin: EdgeInsets.only(top: 35),
                                width: 200,
                                child: Text('tracking'.tr(), style: TextStyle(fontSize: 23,fontWeight: FontWeight.bold, color: tracking_color),),
                              ),
                              if (isHovered_tracking)
                              Container(
                                margin: EdgeInsets.only(top: 20),
                                height: 150,
                                width: 180,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(20)
                                ),
                                child: Column(
                                  children: [
                                    Container(
                                      height: 7,
                                      width: 80,
                                      decoration: BoxDecoration(
                                        color: haian,
                                        borderRadius: BorderRadius.circular(10)
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 30,
                                    ),
                                    MouseRegion(
                                      onEnter: handleMouseEnter_containerTracking,
                                      onExit: handleMouseExit_containerTracking,
                                      child: InkWell(
                                        onTap: () {
                                          context.go(AppRoutes.TrackingRoute);
                                        },
                                        child: Text('Container Tracking', 
                                          textAlign: TextAlign.center, 
                                          style: TextStyle(fontSize: 16, color: trackingContainer_color),),
                                      ),
                                    ),
                                  ],
                                )),
                            ],
                          ),
                        ),
                        MouseRegion(
                          onEnter: handleMouseEnter_schedule,
                          onExit: handleMouseExit_schedule,
                          child: Column(
                            children: <Widget> [
                              Container(
                                alignment: Alignment.center,
                                margin: EdgeInsets.only(top: 35),
                                width: 200,
                                child: Text('schedule'.tr(), style: TextStyle(fontSize: 23,fontWeight: FontWeight.bold, color: schedule_color),),
                              ),
                              if (isHovered_schedule)
                              Container(
                                margin: EdgeInsets.only(top: 20),
                                height: 150,
                                width: 180,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(20)
                                ),
                                child: Column(
                                  // crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      height: 7,
                                      width: 80,
                                      decoration: BoxDecoration(
                                        color: haian,
                                        borderRadius: BorderRadius.circular(10)
                                      ),
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
                                        child: Text('Port - Port', 
                                          style: TextStyle(fontSize: 16, color: schedulePort_color),),
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
                                        child: Text('Vessel', 
                                          style: TextStyle(fontSize: 16, color: scheduleVessel_color),),
                                      ),
                                    ),
                                  ],
                                )),
                            ],
                          ),
                        ),
                        Container(
                          alignment: Alignment.topRight,
                          padding: EdgeInsets.only(top: 20),
                          width: 370,
                          child: MouseRegion(
                            onEnter: handleMouseEnter_signUp,
                            onExit: handleMouseExit_signUp,
                            child: InkWell(
                              onTap: () {
                                context.go(AppRoutes.SignUpRoute);
                              },
                              child: Container(
                                alignment: Alignment.center,
                                height: 50,
                                width: 100,
                                decoration: BoxDecoration(
                                  color: signUp_color,
                                  borderRadius: BorderRadius.circular(15)
                                ),
                                child: Text('signup'.tr(), style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: white),),
                              ),
                            ),
                          ),
                          ),
                      ],
                    ),
                  ),
                ),
              ),
              ]
          ),
        ),
        Container(
          alignment: Alignment.centerRight,
          padding: EdgeInsets.only(right: 10),
          width: 1400,
          height: 150,
          child: Text(
            'Customer Satisfaction\n is Our Success',
            textAlign: TextAlign.right,
            style: TextStyle(
                fontSize: 60,
                fontWeight: FontWeight.bold,
                color: white,
                shadows: const [
                  Shadow(
                      color: Colors.black, blurRadius: 10)
                ]),
          ),
        ),
        SizedBox(height: 150,)
      ],
    );
  }
}
