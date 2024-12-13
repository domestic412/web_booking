import 'package:flutter/material.dart';
import 'package:web_booking/constants/variable.dart';
import 'package:web_booking/screen/notifications/fetch_notfication.dart';
import 'package:web_booking/screen/notifications/popup_showNoti.dart';
import 'package:web_booking/utils/app_shared.dart';

class NotificationIconButton extends StatelessWidget {
  final String userId;
  // final NotificationRepo _notificationRepo;
  // NotificationIconButton(
  //     {required this.userId, NotificationRepo? notificationRepo})
  //     : _notificationRepo = notificationRepo ?? NotificationRepo();
  NotificationIconButton({required this.userId});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        IconButton(
          icon: Icon(
            Icons.notifications,
            color: Colors.white,
          ),
          onPressed: () async {
            try {
              // showNotifications(context, notifications);
              showNotifications(context, userId);
            } catch (e) {
              print(e);
              // Handle errors if necessary
            }
          },
        ),
        FutureBuilder<int>(
            future: getCountNotify(userId),
            builder: (context, snapshot) {
              int value = snapshot.data ?? 0;
              if (value > 0) {
                value = value > 99 ? 99 : value;
                return Positioned(
                  right: 20,
                  top: 14,
                  child: Container(
                    width: 14,
                    height: 14,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.red,
                    ),
                    child: Center(
                      child: Text(
                        '$value',
                      ),
                    ),
                  ),
                );
              } else {
                return const SizedBox();
              }
            })
      ],
    );
  }
}
