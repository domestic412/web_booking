import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:web_booking/constants/variable.dart';
import 'package:web_booking/controllers/sidebar_controller.dart';
import 'package:web_booking/screen/home/homepage_screen.dart';
import 'package:web_booking/screen/Data_storage/dataStorage.dart';

// SideBarController sideBarController = Get.put(SideBarController());

// getUser() async {
//   String _user = await SecureStorage().readData('user');
//   return _user;
// }

Widget buiderMenuItems(BuildContext context) {
  return Container(
      padding: EdgeInsets.all(20),
      child: Obx(
        () => Wrap(
          runSpacing: 10,
          children: [
            user == 'admin'
                ? ListTile(
                    leading: const Icon(
                      (Icons.supervised_user_circle_outlined),
                      color: Colors.white,
                    ),
                    title: const Text('User Management',
                        style: TextStyle(color: Colors.white)),
                    onTap: () => sideBarController.index.value = 0,
                    selected: sideBarController.index.value == 0,
                  )
                : const SizedBox(),
            user == 'admin'
                ? ListTile(
                    leading: const Icon(
                      (Icons.supervised_user_circle_outlined),
                      color: Colors.white,
                    ),
                    title: const Text('List Approval',
                        style: TextStyle(color: Colors.white)),
                    onTap: () => sideBarController.index.value = 1,
                    selected: sideBarController.index.value == 1,
                  )
                : const SizedBox(),
            ListTile(
              leading: const Icon(
                (Icons.supervised_user_circle_outlined),
                color: Colors.white,
              ),
              title: const Text('List Request',
                  style: TextStyle(color: Colors.white)),
              onTap: () => sideBarController.index.value = 2,
              selected: sideBarController.index.value == 2,
            ),
            ListTile(
              leading: const Icon(
                (Icons.supervised_user_circle_outlined),
                color: Colors.white,
              ),
              title: const Text('Send Request',
                  style: TextStyle(color: Colors.white)),
              onTap: () => sideBarController.index.value = 3,
              selected: sideBarController.index.value == 3,
            ),
            ListTile(
              leading: const Icon(
                (Icons.supervised_user_circle_outlined),
                color: Colors.white,
              ),
              title: const Text('Check Container',
                  style: TextStyle(color: Colors.white)),
              onTap: () => sideBarController.index.value = 4,
              selected: sideBarController.index.value == 4,
            ),
            ListTile(
              leading: const Icon(
                (Icons.supervised_user_circle_outlined),
                color: Colors.white,
              ),
              title: const Text('Tracking Container',
                  style: TextStyle(color: Colors.white)),
              onTap: () => sideBarController.index.value = 5,
              selected: sideBarController.index.value == 5,
            ),
            // const Divider(
            //   color: Colors.black54,
            // ),
            // ListTile(
            //   leading: const Icon(
            //     (Icons.logout),
            //     color: Colors.white,
            //   ),
            //   title:
            //       const Text('Log out', style: TextStyle(color: Colors.white)),
            //   onTap: () => sideBarController.index.value = 1,
            //   selected: sideBarController.index.value == 1,
            // ),
          ],
        ),
      ));
}
