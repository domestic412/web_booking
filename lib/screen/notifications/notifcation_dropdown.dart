import 'package:flutter/material.dart';
import 'package:web_booking/page/default/default_page.dart';

class NotificationDropdown extends StatelessWidget {
  final List<String> notifications;

  NotificationDropdown({required this.notifications});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300,
      padding: EdgeInsets.all(8.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8.0),
        boxShadow: [
          BoxShadow(
            color: Colors.black26,
            blurRadius: 10,
            offset: Offset(0, 10),
          ),
        ],
      ),
      child: ListView.builder(
        shrinkWrap: true,
        itemCount: notifications.length,
        itemBuilder: (context, index) {
          return ListTile(
              title: Text(notifications[index]), onTap: () => print('Test'));
        },
      ),
    );
  }
}
