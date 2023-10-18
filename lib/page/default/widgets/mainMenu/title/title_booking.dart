import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';
import 'package:web_booking/constants/color.dart';
import 'package:web_booking/utils/app_route_config.dart';
import 'package:easy_localization/easy_localization.dart';

class BookingMenu extends StatefulWidget {
  const BookingMenu({super.key});

  @override
  State<BookingMenu> createState() => _BookingMenuState();
}

class _BookingMenuState extends State<BookingMenu> {

    // handle mouse Booking
  bool isHovered_booking = false;
  bool isHovered_bookingRequest = false;
  Color booking_color = Colors.black54;
  Color bookingRequest_color = black;

  void handleMouseEnter_booking(PointerEnterEvent event) {
    setState(() {
      isHovered_booking = true;
      booking_color = haian;
    });
  }

  void handleMouseExit_booking(PointerExitEvent event) {
    setState(() {
      isHovered_booking = false;
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
  
  @override
  Widget build(BuildContext context) {
    return MouseRegion(
            onEnter: handleMouseEnter_booking,
            onExit: handleMouseExit_booking,
            child: Column(
              children: <Widget>[
                Container(
                  alignment: Alignment.center,
                  margin: EdgeInsets.only(top: 35),
                  width: 200,
                  child: Text(
                    'booking'.tr(),
                    style: TextStyle(
                        fontSize: 23,
                        fontWeight: FontWeight.bold,
                        color: booking_color),
                  ),
                ),
                if (isHovered_booking)
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
                                borderRadius:
                                    BorderRadius.circular(10)),
                          ),
                          const SizedBox(
                            height: 30,
                          ),
                          MouseRegion(
                            onEnter:
                                handleMouseEnter_bookingRequest,
                            onExit: 
                                handleMouseExit_bookingRequest,
                            child: InkWell(
                              onTap: () {
                                context.go(AppRoutes.BookingRoute);
                              },
                              child: Text(
                                'Booking Request',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontSize: 16,
                                    color: bookingRequest_color),
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