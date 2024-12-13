import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:web_booking/constants/global.dart';
import 'package:web_booking/model/notification/firebase_message.dart';
import 'package:web_booking/page/signin/controller_signin.dart/info_signin_controller.dart';

Future<List<FirebaseMessage>> fetchNotifications(String userId) async {
  var url = '$SERVER/notifications/$userId/getUser';
  final response = await http.get(Uri.parse(
      // 'http://113.160.100.137:9999/notifications/${inforUserController.shipperId.value}/getUser'));
      url));
  print(inforUserController.shipperId.value);

  if (response.statusCode == 200) {
    List data = jsonDecode(response.body);
    return data.map((e) => FirebaseMessage.fromJson(e)).toList();
  } else {
    throw Exception('Failed to load notifications');
  }
}

Future<int> getCountNotify(String userId) async {
  try {
    var url = '$SERVER/notifications/unread-count?userId=$userId';
    final response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      print(data);
      return data['count'] ?? 0;
    } else {
      throw Exception('Failed to load count');
    }
  } catch (e) {
    print(e);
    return 0;
  }
}
