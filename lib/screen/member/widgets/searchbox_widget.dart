import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:web_booking/constants/color.dart';
import 'package:web_booking/utils/app_route_config.dart';

class SearchWigdet extends StatelessWidget {
  const SearchWigdet({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Container(
                  width: 600.0,
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: "Search user name, email...",
                      prefixIcon: Icon(Icons.search),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        borderSide: BorderSide(
                          color: Colors.black26,
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  width: 16,
                ),
                Container(
                  width: 300.0,
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: "User Permision",
                      prefixIcon: Icon(Icons.search),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        borderSide: BorderSide(
                          color: Colors.black26,
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  width: 16,
                ),
                ElevatedButton(
                    onPressed: () {},
                    child: Text('Search'),
                    style: ElevatedButton.styleFrom(
                      padding: EdgeInsets.all(20),
                      primary: haian,
                      onPrimary: white,
                      // elevation: 15),
                    )),
              ],
            ),
            Row(
              children: [
                ElevatedButton.icon(
                    icon: Icon(Icons.add),
                    onPressed: () {
                      context.go(AppRoutes.signInRoute);
                    },
                    label: Text('ADD USER'),
                    style: ElevatedButton.styleFrom(
                      padding: EdgeInsets.all(15),
                      primary: haian,
                      onPrimary: white,
                      // elevation: 15),
                    )),
              ],
            ),
          ],
        ),
      ],
    );
  }
}
