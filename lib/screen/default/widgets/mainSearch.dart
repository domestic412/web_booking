import 'package:flutter/material.dart';

import '../../../assets/constants.dart/color.dart';

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
      padding: EdgeInsets.only(left: 20, right: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          containerTrackingSearch(),
          SizedBox(
            width: 20,
          ),
          sheduleSearch(),
          SizedBox(
            width: 20,
          ),
          Container(
            height: 230,
            width: 400,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              color: Colors.white54,
              boxShadow: [
                BoxShadow(
                  color: Colors.white30,
                  spreadRadius: 7,
                  blurRadius: 7,
                  offset: Offset(0, 3)
                )
              ]
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  height: 7,
                  decoration: BoxDecoration(
                    color: haian,
                    borderRadius: BorderRadius.only(topLeft: Radius.circular(5), topRight: Radius.circular(5))
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Text('No Name', style: TextStyle(fontSize: 25, color: haian),),
                Container(
                  margin: EdgeInsets.all(20),
                  padding: EdgeInsets.only(left: 10),
                  decoration: BoxDecoration(
                    color: Colors.white60,
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: 'B/L No. or Container No.',
                      border: InputBorder.none
                    ),
                  ),
                )
              ],
            ),
          ),
        ],
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
          boxShadow: [
            BoxShadow(
              color: Colors.white30,
              spreadRadius: 7,
              blurRadius: 7,
              offset: Offset(0, 3)
            )
          ]
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 7,
              decoration: BoxDecoration(
                color: haian,
                borderRadius: BorderRadius.only(topLeft: Radius.circular(5), topRight: Radius.circular(5))
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              alignment: Alignment.center,
              child: Text('Container Tracking', style: TextStyle(fontSize: 25, color: haian))),
            SizedBox(height: 10,),
            Container(
              margin: EdgeInsets.only(left: 20, right: 20),
              padding: EdgeInsets.only(left: 10),
              decoration: BoxDecoration(
                color: Colors.white60,
                borderRadius: BorderRadius.circular(5),
              ),
              child: TextField(
                decoration: InputDecoration(
                  hintText: 'B/L No. or Container No.',
                  border: InputBorder.none
                ),
              ),
            ),
            SizedBox(
              height: 60,
            ),
            Container(
              alignment: Alignment.topRight,
              padding: EdgeInsets.only(right: 20),
              child: InkWell(
                splashColor: green,
                highlightColor: blue,
                onTap: (){},
                child: Container(
                  alignment: Alignment.center,
                  width: 100,
                  height: 40,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: haian
                  ),
                  child: Text('Inquiry', style: TextStyle(fontSize: 20, color: white),),
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
          boxShadow: [
            BoxShadow(
              color: Colors.white30,
              spreadRadius: 7,
              blurRadius: 7,
              offset: Offset(0, 3)
            )
          ]
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              height: 7,
              decoration: BoxDecoration(
                color: haian,
                borderRadius: BorderRadius.only(topLeft: Radius.circular(5), topRight: Radius.circular(5))
              ),
            ),
            SizedBox(
              height: 20
            ),
            Text('Schedule', style: TextStyle(fontSize: 25, color: haian),),
            SizedBox(height: 10,),
            Container(
              margin: EdgeInsets.only(left: 20, right: 20),
              padding: EdgeInsets.only(left: 15),
              decoration: BoxDecoration(
                color: Colors.white60,
                borderRadius: BorderRadius.circular(5),
              ),
              child: const TextField(
                decoration: InputDecoration(
                  icon: Icon(Icons.location_on, size: 30,),
                  hintText: 'Departure',
                  border: InputBorder.none
                ),
              ),
            ),
            SizedBox(height: 10,),
            Container(
              margin: EdgeInsets.only(left: 20, right: 20),
              padding: EdgeInsets.only(left: 15),
              decoration: BoxDecoration(
                color: Colors.white60,
                borderRadius: BorderRadius.circular(5),
              ),
              child: TextField(
                decoration: InputDecoration(
                  icon: Icon(Icons.location_on, size: 30,),
                  hintText: 'Arrival',
                  border: InputBorder.none
                ),
              ),
            ),
            SizedBox(
              height: 5,
            ),
            Container(
              alignment: Alignment.topRight,
              padding: EdgeInsets.only(right: 20),
              child: InkWell(
                splashColor: green,
                highlightColor: blue,
                onTap: (){},
                child: Container(
                  alignment: Alignment.center,
                  width: 100,
                  height: 40,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: haian
                  ),
                  child: Text('Inquiry', style: TextStyle(fontSize: 20, color: white),),
                ),
              ),
            )
          ],
        ),
      );
}