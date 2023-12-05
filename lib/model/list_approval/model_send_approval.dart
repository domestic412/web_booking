import 'dart:convert';
import 'package:http/http.dart' as http;

import 'package:web_booking/constants/global.dart';
import 'package:web_booking/constants/variable.dart';
import 'package:web_booking/controllers/sidebar_controller.dart';
import 'package:web_booking/page/signin/controller.dart/info_signin_controller.dart';
import 'package:web_booking/screen/home/homepage_screen.dart';

class SendApproval {
  Future<void> fetchSendApproval(String status) async {
    try {
      var url = '$SERVER/Requests/Process?Trangthai=$status';
      Map<String, dynamic> data = {
        'id': id_DetailApproval,
        'noteHangTau': note_detail_approval.text,
        'userXuly': {informationController.maNV.value},
      };
      // print(data);
      var body = json.encode(data);
      final response = await http.post(Uri.parse(url),
          headers: {
            "Content-Type": "application/json",
            "Authorization": "Bearer ${informationController.authorize.value}",
          },
          body: body);
      switch (response.statusCode) {
        case 200:
          // sideBarController.index.value = 1;
          controller.changePage(SideBarController.approvalList);
        default:
          throw Exception(response.reasonPhrase);
      }
    } on Exception catch (e) {
      throw Exception('Error fetch Send Approval - $e');
    }
  }
}
