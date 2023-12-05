import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:web_booking/constants/color.dart';
import 'package:web_booking/page/signin/controller_signin.dart/info_signin_controller.dart';
import 'package:web_booking/screen/member/widgets/members_table.dart';

class MemberPage extends StatelessWidget {
  const MemberPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
            child: Container(
          padding: EdgeInsets.symmetric(horizontal: 16 * 2, vertical: 16 * 2),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "User's List",
                    style: TextStyle(fontSize: 30, color: haian),
                  ),
                  TextButton(
                      onPressed: () {
                        print({informationController.authorize.value});
                      },
                      child: Text('Print'))
                ],
              ),
              SizedBox(
                height: 16,
              ),
              DataTableExample(),
            ],
          ),
        )),
      ],
    );
  }

  // print1() async {
  //   String abc = await SecureStorage().readData('tokenLogin');
  //   print(abc);
  // }
}
