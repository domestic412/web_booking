import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:web_booking/controllers/sidebar_controller.dart';

Widget buiderMenuItems(BuildContext context) {
  SideBarController sideBarController = Get.put(SideBarController());
  return Container(
      padding: EdgeInsets.all(20),
      child: Obx(
        () => Wrap(
          runSpacing: 10,
          children: [
            ListTile(
              leading: const Icon(
                (Icons.supervised_user_circle_outlined),
                color: Colors.white,
              ),
              title: const Text('User Management',
                  style: TextStyle(color: Colors.white)),
              onTap: () => sideBarController.index.value = 0,
              selected: sideBarController.index.value == 0,
            ),
            ListTile(
              leading: const Icon(
                (Icons.supervised_user_circle_outlined),
                color: Colors.white,
              ),
              title: const Text('List Request',
                  style: TextStyle(color: Colors.white)),
              onTap: () => sideBarController.index.value = 1,
              selected: sideBarController.index.value == 1,
            ),
            ListTile(
              leading: const Icon(
                (Icons.supervised_user_circle_outlined),
                color: Colors.white,
              ),
              title: const Text('Send Request',
                  style: TextStyle(color: Colors.white)),
              onTap: () => sideBarController.index.value = 2,
              selected: sideBarController.index.value == 2,
            ),
            ListTile(
              leading: const Icon(
                (Icons.supervised_user_circle_outlined),
                color: Colors.white,
              ),
              title: const Text('Check Container',
                  style: TextStyle(color: Colors.white)),
              onTap: () => sideBarController.index.value = 3,
              selected: sideBarController.index.value == 3,
            ),
            ListTile(
              leading: const Icon(
                (Icons.supervised_user_circle_outlined),
                color: Colors.white,
              ),
              title: const Text('Tracking Container',
                  style: TextStyle(color: Colors.white)),
              onTap: () => sideBarController.index.value = 4,
              selected: sideBarController.index.value == 4,
            ),
            const Divider(
              color: Colors.black54,
            ),
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
