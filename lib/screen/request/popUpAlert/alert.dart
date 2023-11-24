import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';

// Future<void> RequestContAlert(BuildContext context) {
//   return showDialog<void>(
//       context: context,
//       builder: (BuildContext context) {
//         return AlertDialog(
//           title: const Text("Lỗi"),
//           content: const Text("Không tìm thấy số Container"),
//           actions: [
//             TextButton(
//               onPressed: () => Navigator.pop(context, 'OK'),
//               child: const Text(
//                 'OK',
//                 style: TextStyle(fontSize: 16),
//               ),
//             ),
//           ],
//         );
//       });
// }

Future<void> OverloadImageAlert(BuildContext context) {
  return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("error".tr()),
          content: Text("error maximum 5 picture".tr()),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context, 'OK'),
              child: const Text(
                'OK',
                style: TextStyle(fontSize: 16),
              ),
            ),
          ],
        );
      });
}
