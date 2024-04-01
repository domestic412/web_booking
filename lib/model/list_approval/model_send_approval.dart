import 'dart:convert';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:web_booking/constants/global.dart';
import 'package:web_booking/controllers/sidebar_controller.dart';
import 'package:web_booking/page/signin/controller_signin.dart/info_signin_controller.dart';
import 'package:web_booking/utils/getx_route.dart';

class SendApproval {
  Future<void> fetchSendApproval(
      String status, String id, String noteHangTau) async {
    try {
      var url = '$SERVER/Requests/Process?Trangthai=$status';
      Map<String, dynamic> data = {
        'id': id,
        'noteHangTau': noteHangTau,
        'userId': inforUserController.shipperId.value,
      };
      // print(data);
      var body = json.encode(data);
      final response = await http.post(Uri.parse(url),
          headers: {
            "Content-Type": "application/json",
          },
          body: body);
      switch (response.statusCode) {
        case 200:
          controller.selectWidget.value = approvalList;
        case 401:
          Get.toNamed(GetRoutes.SignIn);
          throw Exception(response.reasonPhrase);
        default:
          throw Exception(response.reasonPhrase);
      }
    } on Exception catch (e) {
      throw Exception('Error fetch Send Approval - $e');
    }
  }
}
