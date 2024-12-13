import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'package:web_booking/model/notification/firebase_message.dart';
import 'package:web_booking/screen/notifications/fetch_notfication.dart';

void showNotifications(BuildContext context, String userId) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text('Notifications'),
        content: FutureBuilder<List<FirebaseMessage>>(
          future: fetchNotifications(userId),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(child: CircularProgressIndicator());
            } else if (snapshot.hasError) {
              return Text('Error: ${snapshot.error}');
            } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
              return Text('No notifications found.');
            } else {
              List<FirebaseMessage> notifications = snapshot.data!;
              return Container(
                width: 300,
                child: ListView(
                  shrinkWrap: true,
                  children: notifications.map((notification) {
                    return NotificationItem(
                      item: notification,
                      callback: () {
                        // Define what happens when the item is clicked
                      },
                    );
                  }).toList(),
                ),
              );
            }
          },
        ),
        actions: [
          TextButton(
            child: Text('Close'),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ],
      );
    },
  );
}

class NotificationItem extends StatelessWidget {
  final FirebaseMessage item;
  final VoidCallback? callback;

  NotificationItem({Key? key, required this.item, this.callback})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: callback,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          ClipOval(
            child: CircleAvatar(
              backgroundColor: Colors.orange.withOpacity(0.2),
              radius: 25,
              child: SizedBox(
                width: 40,
                height: 40,
                child: Transform.scale(
                  scale: 0.8,
                  child: SvgPicture.asset(item.type.image),
                ),
              ),
            ),
          ),
          SizedBox(height: 80),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Html(data: item.payload),
                if (item.timestamp != null) _buildUpdatedTime(),
              ],
            ),
          ),
          if (!item.isRead)
            const Padding(
              padding: EdgeInsets.only(top: 12.0),
              child: CircleAvatar(radius: 5),
            ),
        ],
      ),
    );
  }

  Widget _buildUpdatedTime() {
    return Padding(
      padding: const EdgeInsets.only(left: 7.0),
      child: Text(
        DateTimeUtils.convertTimeToTimeAgo(item.timestamp),
      ),
    );
  }
}

class DateTimeUtils {
  static String convertTimeToTimeAgo(DateTime? createdDate) {
    if (createdDate == null) return '';
    final result = timeago
            .format(createdDate, locale: 'en')
            .substring(0, 1)
            .toUpperCase() +
        timeago.format(createdDate, locale: 'en').substring(1);
    return result;
  }
}
