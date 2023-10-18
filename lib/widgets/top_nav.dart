import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:web_booking/constants/color.dart';
import 'package:web_booking/utils/app_route_config.dart';

AppBar topNavigationBar(BuildContext context, GlobalKey<ScaffoldState> key) =>
    AppBar(
      leading: Container(
        padding: const EdgeInsets.only(
          left: 16,
        ),
        child: Image.asset(
          'assets/images/hats_logo.png',
        ),
      ),
      title: Row(
        children: [
          Visibility(
              child: Text(
            'Hai An Container',
            style: TextStyle(color: haian),
          )),
          Expanded(child: Container()),
          // Spacer(),
          Container(
            // height: 25,
            width: 250,
            padding: const EdgeInsets.symmetric(horizontal: 16),
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.all(
                Radius.circular(10),
              ),
              color: Colors.white54,
              border: Border.all(width: 2, color: Color(0xFFE5E5E5)),
            ),
            child: TextFormField(
              textAlignVertical: TextAlignVertical.top,
              style: const TextStyle(color: Colors.grey, fontSize: 12),
              decoration: const InputDecoration(
                  hintText: 'Search...',
                  hintStyle: TextStyle(color: Colors.grey),
                  disabledBorder: InputBorder.none,
                  enabledBorder: InputBorder.none,
                  icon: Icon(
                    Icons.search,
                    color: Color(0xFFE5E5E5),
                  )),
            ),
          ),
          const SizedBox(
            width: 12,
          ),
          Container(
            child: Text(
              'Do Khai',
              style: TextStyle(color: black, fontSize: 16),
            ),
          ),
          const SizedBox(
            width: 16,
          ),
          Container(
            decoration: BoxDecoration(
              color: Colors.blue.withOpacity(.5),
              borderRadius: BorderRadius.circular(30),
            ),
            child: Container(
              decoration: BoxDecoration(
                  color: white, borderRadius: BorderRadius.circular(30)),
              padding: const EdgeInsets.all(2),
              margin: const EdgeInsets.all(2),
              child: CircleAvatar(
                child: IconButton(
                  onPressed: () {
                    context.go(AppRoutes.SignInRoute);
                  },
                  icon: Icon(Icons.abc),
                ),
              ),
            ),
          ),
        ],
      ),
      // iconTheme: IconThemeData(color: black),
      elevation: 5,
      backgroundColor: white,
    );
