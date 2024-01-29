import 'package:flutter/material.dart';
import 'package:web_booking/constants/color.dart';
import 'package:web_booking/model/booking/model_create_booking.dart';

class ButtonBookingRequest extends StatefulWidget {
  const ButtonBookingRequest({
    super.key,
  });

  @override
  State<ButtonBookingRequest> createState() => _ButtonBookingRequestState();
}

class _ButtonBookingRequestState extends State<ButtonBookingRequest> {
  @override
  Widget build(BuildContext context) {
    BookingRequest bookingRequest = BookingRequest();
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ElevatedButton(
            onPressed: () {
              bookingRequest.PostBookingRequest;
            },
            style: ElevatedButton.styleFrom(backgroundColor: Colors.orange),
            child: Container(
              alignment: Alignment.center,
              height: 40,
              child: Text(
                'Temporary Save',
                style: TextStyle(color: white),
              ),
            )),
        SizedBox(width: 20),
        ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(backgroundColor: haian),
            child: Container(
              alignment: Alignment.center,
              height: 40,
              child: Text(
                'Confirmation Request',
                style: TextStyle(color: white),
              ),
            ))
      ],
    );
  }
}
