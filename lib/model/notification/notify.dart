import 'dart:convert';

import 'package:web_booking/constants/global.dart';
import 'package:http/http.dart' as http;

class NotifyID {
  String? notificationId;
  String? id;
  String? title;
  String? payload;
  String? type;
  String? officeId;
  String? timeStamp;
  bool? isRead;

  NotifyID(
      {this.notificationId,
      this.id,
      this.title,
      this.payload,
      this.type,
      this.officeId,
      this.timeStamp,
      this.isRead});

  NotifyID.fromJson(Map<String, dynamic> json) {
    notificationId = json['notificationId'];
    id = json['id'];
    title = json['title'];
    payload = json['payload'];
    type = json['type'];
    officeId = json['officeId'];
    timeStamp = json['timeStamp'];
    isRead = json['isRead'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['notificationId'] = this.notificationId;
    data['id'] = this.id;
    data['title'] = this.title;
    data['payload'] = this.payload;
    data['type'] = this.type;
    data['officeId'] = this.officeId;
    data['timeStamp'] = this.timeStamp;
    data['isRead'] = this.isRead;
    return data;
  }

  Future<int> fetchNotify(String userId) async {
    try {
      var url = '$SERVER/notifications/unread-count?userId=$userId';
      final response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        return data['count'] ?? 0;
      } else {
        throw Exception('Failed to load count');
      }
    } catch (e) {
      print(e);
      return 0;
    }
  }
}
