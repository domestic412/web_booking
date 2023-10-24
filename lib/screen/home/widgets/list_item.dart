// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:web_booking/controllers/sidebar_controller.dart';

// Widget buiderMenuItems(BuildContext context) {
//   SideBarController sideBarController = Get.put(SideBarController());
//   return Container(
//       padding: EdgeInsets.all(24),
//       child: Obx(
//         () => Wrap(
//           runSpacing: 16,
//           children: [
//             ListTile(
//               leading: const Icon(
//                 (Icons.supervised_user_circle_outlined),
//                 color: Colors.white,
//               ),
//               title: const Text('User Management',
//                   style: TextStyle(color: Colors.white)),
//               onTap: () => sideBarController.index.value = 0,
//               selected: sideBarController.index.value == 0,
//             ),
//             const Divider(
//               color: Colors.black54,
//             ),
//             ListTile(
//               leading: const Icon(
//                 (Icons.logout),
//                 color: Colors.white,
//               ),
//               title:
//                   const Text('Log out', style: TextStyle(color: Colors.white)),
//               onTap: () {},
//             ),
//           ],
//         ),
//       ));
// }
