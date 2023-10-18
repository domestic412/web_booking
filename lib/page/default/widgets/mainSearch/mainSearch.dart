import 'package:flutter/material.dart';
import 'package:web_booking/constants/color.dart';
import 'package:web_booking/page/default/widgets/mainSearch/widget/widget_container_tracking.dart';
import 'package:web_booking/page/default/widgets/mainSearch/widget/widget_schedule.dart';

class mainSearch extends StatefulWidget {
  const mainSearch({
    super.key,
  });

  @override
  State<mainSearch> createState() => _mainSearchState();
}

class _mainSearchState extends State<mainSearch> {
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      width: 1400,
      padding: EdgeInsets.only(left: 20),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ContainerTrackingSearch(),
            SizedBox(
              width: 30,
            ),
            ScheduleSearch()
            // const SizedBox(
            //   width: 20,
            // ),
            // Noname(),
          ],
        ),
      ),
    );
  }
}

Container Noname() {
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
      crossAxisAlignment: CrossAxisAlignment.center,
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
        Text(
          'No Name',
          style: TextStyle(fontSize: 25, color: haian),
        ),
        Container(
          margin: EdgeInsets.all(20),
          padding: EdgeInsets.only(left: 10),
          decoration: BoxDecoration(
            color: Colors.white60,
            borderRadius: BorderRadius.circular(5),
          ),
          child: const TextField(
            decoration: InputDecoration(
                hintText: 'B/L No. or Container No.', border: InputBorder.none),
          ),
        )
      ],
    ),
  );
}
