import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:web_booking/page/signin/controller.dart/info_signin_controller.dart';
import 'package:web_booking/page/signin/signin_page.dart';
import 'package:web_booking/screen/home/homepage_screen.dart';
import 'package:web_booking/utils/getx_route.dart';

// SideBarController sideBarController = Get.put(SideBarController());

// getUser() async {
//   String _user = await SecureStorage().readData('user');
//   return _user;
// }

Widget buiderDrawItems(BuildContext context) {
  return Container(
      padding: EdgeInsets.all(20),
      child: Obx(
        () => Wrap(
          runSpacing: 10,
          children: [
            // user == 'admin'
            //     ? ListTile(
            //         leading: const Icon(
            //           (Icons.supervised_user_circle_outlined),
            //           color: Colors.white,
            //         ),
            //         title: const Text('User Management',
            //             style: TextStyle(color: Colors.white)),
            //         onTap: () => sideBarController.index.value = 0,
            //         selected: sideBarController.index.value == 0,
            //       )
            //     : const SizedBox(),
            informationController.author.value == 'admin'
                ? ListTile(
                    leading: const Icon(
                      (Icons.supervised_user_circle_outlined),
                      color: Colors.white,
                    ),
                    title: const Text('User List',
                        style: TextStyle(color: Colors.white)),
                    onTap: () {
                      Get.toNamed(GetRoutes.UserList);
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
                      Get.toNamed(GetRoutes.ApprovalList);
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
                  Get.toNamed(GetRoutes.RequestList);
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
                  Get.toNamed(GetRoutes.SendRequest);
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
                  Get.toNamed(GetRoutes.CheckingCombine);
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
                  Get.toNamed(GetRoutes.Tracking1);
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
                      Get.toNamed(GetRoutes.QualityList);
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
                      Get.toNamed(GetRoutes.SpecialPolicyList);
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
                      Get.toNamed(GetRoutes.HistoryList);
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
                      Get.toNamed(GetRoutes.ContainerStock);
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
