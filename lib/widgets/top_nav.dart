import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:web_booking/constants/color.dart';
import 'package:web_booking/constants/style.dart';
import 'package:web_booking/constants/variable.dart';
import 'package:web_booking/screen/secure_storage/storage.dart';
import 'package:web_booking/utils/app_route_config.dart';
import 'package:web_booking/widgets/appbar/dropdownLeaguage.dart';

// getTokenLogin() async {
//   try {
//     tokenLogin = await SecureStorage().readData('tokenLogin');
//   } catch (error) {
//     print(error);
//     print('testsadgasgash');
//   }
// }

// class Textuser extends StatefulWidget {
//   const Textuser({super.key});

//   @override
//   State<Textuser> createState() => _TextuserState();
// }

// class _TextuserState extends State<Textuser> {
//   @override
//   void initState() {
//     super.initState();
//     getTokenLogin();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       width: 50,
//       height: 50,
//       child: Text(
//         tokenLogin!,
//         style: style_text_detail,
//       ),
//     );
//   }
// }

AppBar topNavigationBar(
  BuildContext context,
) =>
    AppBar(
      leading: Container(
        padding: EdgeInsets.only(
          left: 16,
        ),
        child: Image.asset(
          'assets/images/hats_logo.png',
        ),
      ),
      title: Row(
        children: [
          Text(
            'Hai An Container',
            style: TextStyle(color: haian),
          ),
          Expanded(child: Container()),
          // Spacer(),
          // Container(
          //   // height: 25,
          //   width: 250,
          //   padding: const EdgeInsets.symmetric(horizontal: 16),
          //   decoration: BoxDecoration(
          //     borderRadius: const BorderRadius.all(
          //       Radius.circular(10),
          //     ),
          //     color: Colors.white54,
          //     border: Border.all(width: 2, color: Color(0xFFE5E5E5)),
          //   ),
          //   child: TextFormField(
          //     textAlignVertical: TextAlignVertical.top,
          //     style: const TextStyle(color: Colors.grey, fontSize: 12),
          //     decoration: const InputDecoration(
          //         hintText: 'Search...',
          //         hintStyle: TextStyle(color: Colors.grey),
          //         disabledBorder: InputBorder.none,
          //         enabledBorder: InputBorder.none,
          //         icon: Icon(
          //           Icons.search,
          //           color: Color(0xFFE5E5E5),
          //         )),
          //   ),
          // ),
          const SizedBox(
            width: 12,
          ),
          // Textuser(),
          Text(
            // 'test',
            tokenLogin,
            style: style_text_detail,
          ),
          const SizedBox(
            width: 30,
          ),
          DropdownLeaguage(),
          const SizedBox(
            width: 30,
          ),
          Container(
            decoration: BoxDecoration(
                color: white, borderRadius: BorderRadius.circular(10)),
            child: CircleAvatar(
              backgroundColor: normalColor,
              child: IconButton(
                onPressed: () {
                  context.go(AppRoutes.SignInRoute);
                },
                icon: Icon(
                  Icons.logout,
                  color: white,
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
