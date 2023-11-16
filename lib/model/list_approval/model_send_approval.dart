import 'dart:convert';
import 'package:http/http.dart' as http;

import 'package:web_booking/constants/global.dart';
import 'package:web_booking/constants/variable.dart';
import 'package:web_booking/screen/home/homepage_screen.dart';

class SendApproval {
  Future<void> fetchSendApproval(String status) async {
    var url = '$SERVER/Requests/Process?Trangthai=$status';
    Map<String, dynamic> data = {
      'id': id_DetailApproval,
      'noteHangTau': note_detail_approval.text,
      'userXuly': user,
    };
    // print(data);
    var body = json.encode(data);
    final response = await http.post(Uri.parse(url),
        headers: {
          "Content-Type": "application/json",
          "Authorization": "Bearer $tokenAuthorize",
        },
        body: body);
    if (response.statusCode == 200) {
      sideBarController.index.value = 1;
    } else {
      throw Exception('Error');
    }
  }
}
