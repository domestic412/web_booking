import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:web_booking/constants/color.dart';

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
      padding: EdgeInsets.only(left: 20),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            containerTrackingSearch(),
            const SizedBox(
              width: 30,
            ),
            sheduleSearch(),
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

Container containerTrackingSearch() {
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
            child: Text('container tracking'.tr(),
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
            decoration: InputDecoration(
                hintText: 'searchNumber'.tr(), border: InputBorder.none),
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
            onTap: () {},
            child: Container(
              alignment: Alignment.center,
              width: 100,
              height: 40,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5), color: haian),
              child: Text(
                'inquiry'.tr(),
                style: TextStyle(fontSize: 20, color: white),
              ),
            ),
          ),
        )
      ],
    ),
  );
}

Container sheduleSearch() {
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
        const SizedBox(height: 20),
        Text(
          'schedule'.tr(),
          style: TextStyle(fontSize: 25, color: haian),
        ),
        const SizedBox(
          height: 10,
        ),
        Container(
          margin: const EdgeInsets.only(left: 20, right: 20),
          padding: const EdgeInsets.only(left: 15),
          decoration: BoxDecoration(
            color: Colors.white60,
            borderRadius: BorderRadius.circular(5),
          ),
          child: TextField(
            decoration: InputDecoration(
                icon: const Icon(
                  Icons.location_on,
                  size: 30,
                ),
                hintText: 'departure'.tr(),
                border: InputBorder.none),
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        Container(
          margin: const EdgeInsets.only(left: 20, right: 20),
          padding: const EdgeInsets.only(left: 15),
          decoration: BoxDecoration(
            color: Colors.white60,
            borderRadius: BorderRadius.circular(5),
          ),
          child: TextField(
            decoration: InputDecoration(
                icon: const Icon(
                  Icons.location_on,
                  size: 30,
                ),
                hintText: 'arrival'.tr(),
                border: InputBorder.none),
          ),
        ),
        const SizedBox(
          height: 5,
        ),
        Container(
          alignment: Alignment.topRight,
          padding: const EdgeInsets.only(right: 20),
          child: InkWell(
            splashColor: green,
            highlightColor: blue,
            onTap: () {},
            child: Container(
              alignment: Alignment.center,
              width: 100,
              height: 40,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5), color: haian),
              child: Text(
                'inquiry'.tr(),
                style: TextStyle(fontSize: 20, color: white),
              ),
            ),
          ),
        )
      ],
    ),
  );
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
