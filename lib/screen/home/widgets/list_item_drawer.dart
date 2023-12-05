import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:web_booking/controllers/sidebar_controller.dart';
import 'package:web_booking/page/signin/controller_signin.dart/info_signin_controller.dart';

Widget buiderDrawItems(BuildContext context) {
  return Container(
      padding: EdgeInsets.all(20),
      child: Obx(
        () => Wrap(
          runSpacing: 10,
          children: [
            informationController.author.value == 'admin'
                ? ListTile(
                    leading: const Icon(
                      (Icons.supervised_user_circle_outlined),
                      color: Colors.white,
                    ),
                    title: const Text('User List',
                        style: TextStyle(color: Colors.white)),
                    onTap: () {
                      // Get.toNamed(GetRoutes.UserList);
                      controller.selectWidget.value = userList;
                    }
                    // sideBarController.index.value = 15,
                    // selected: sideBarController.index.value == 15,
                    )
                : const SizedBox(),
            informationController.author.value == 'admin'
                ? ListTile(
                    leading: const Icon(
                      (Icons.supervised_user_circle_outlined),
                      color: Colors.white,
                    ),
                    title: const Text('Approval List',
                        style: TextStyle(color: Colors.white)),
                    onTap: () {
                      // Get.toNamed(GetRoutes.ApprovalList);
                      controller.selectWidget.value = approvalList;
                    }
                    // => sideBarController.index.value = 1,
                    // selected: sideBarController.index.value == 1,
                    )
                : const SizedBox(),
            ListTile(
                leading: const Icon(
                  (Icons.supervised_user_circle_outlined),
                  color: Colors.white,
                ),
                title: const Text('Request List',
                    style: TextStyle(color: Colors.white)),
                onTap: () {
                  // Get.toNamed(GetRoutes.RequestList);
                  controller.selectWidget.value = requestList;
                }
                // => sideBarController.index.value = 2,
                // selected: sideBarController.index.value == 2,
                ),
            ListTile(
                leading: const Icon(
                  (Icons.supervised_user_circle_outlined),
                  color: Colors.white,
                ),
                title: const Text('Send Request',
                    style: TextStyle(color: Colors.white)),
                onTap: () {
                  // Get.toNamed(GetRoutes.SendRequest);
                  controller.selectWidget.value = sendRequest;
                }
                // => sideBarController.index.value = 3,
                // selected: sideBarController.index.value == 3,
                ),
            ListTile(
                leading: const Icon(
                  (Icons.supervised_user_circle_outlined),
                  color: Colors.white,
                ),
                title: const Text('Checking Combine',
                    style: TextStyle(color: Colors.white)),
                onTap: () {
                  // Get.toNamed(GetRoutes.CheckingCombine);
                  controller.selectWidget.value = checkingCombine;
                }
                // => sideBarController.index.value = 4,
                // selected: sideBarController.index.value == 4,
                ),
            ListTile(
                leading: const Icon(
                  (Icons.supervised_user_circle_outlined),
                  color: Colors.white,
                ),
                title: const Text('Tracking Container',
                    style: TextStyle(color: Colors.white)),
                onTap: () {
                  // Get.toNamed(GetRoutes.Tracking1);
                  controller.selectWidget.value = tracking1;
                }
                //  => sideBarController.index.value = 5,
                // selected: sideBarController.index.value == 5,
                ),
            informationController.author.value == 'admin'
                ? ListTile(
                    leading: const Icon(
                      (Icons.supervised_user_circle_outlined),
                      color: Colors.white,
                    ),
                    title: const Text('Quality List',
                        style: TextStyle(color: Colors.white)),
                    onTap: () {
                      // Get.toNamed(GetRoutes.QualityList);
                      controller.selectWidget.value = qualityList;
                    }
                    // => sideBarController.index.value = 6,
                    // selected: sideBarController.index.value == 6,
                    )
                : SizedBox(),
            informationController.author.value == 'admin'
                ? ListTile(
                    leading: const Icon(
                      (Icons.supervised_user_circle_outlined),
                      color: Colors.white,
                    ),
                    title: const Text('Special Policy List',
                        style: TextStyle(color: Colors.white)),
                    onTap: () {
                      // Get.toNamed(GetRoutes.SpecialPolicyList);
                      controller.selectWidget.value = specialPolicyList;
                    }
                    // => sideBarController.index.value = 8,
                    // selected: sideBarController.index.value == 8,
                    )
                : SizedBox(),
            informationController.author.value == 'admin'
                ? ListTile(
                    leading: const Icon(
                      (Icons.supervised_user_circle_outlined),
                      color: Colors.white,
                    ),
                    title: const Text('History List',
                        style: TextStyle(color: Colors.white)),
                    onTap: () {
                      // Get.toNamed(GetRoutes.HistoryList);
                      controller.selectWidget.value = historyList;
                    }
                    // => sideBarController.index.value = 10,
                    // selected: sideBarController.index.value == 10,
                    )
                : SizedBox(),
            informationController.author.value == 'admin'
                ? ListTile(
                    leading: const Icon(
                      (Icons.supervised_user_circle_outlined),
                      color: Colors.white,
                    ),
                    title: const Text('Container Stock',
                        style: TextStyle(color: Colors.white)),
                    onTap: () {
                      // Get.toNamed(GetRoutes.ContainerStock);
                      controller.selectWidget.value = containerStock;
                    }
                    // => sideBarController.index.value = 11,
                    // selected: sideBarController.index.value == 11,
                    )
                : SizedBox(),
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
