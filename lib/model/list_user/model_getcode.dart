// import 'dart:async';
// import 'dart:convert';
// import 'package:get/get.dart';
// import 'package:http/http.dart' as http;
// import 'package:web_booking/constants/global.dart';
// import 'package:web_booking/page/signin/controller_signin.dart/info_signin_controller.dart';
// import 'package:web_booking/utils/getx_route.dart';

// class GetCode {
//   String? code;

//   GetCode({this.code});

//   GetCode.fromJson(Map<String, dynamic> json) {
//     code = json['code'];
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['code'] = this.code;
//     return data;
//   }

//   Future<List<GetCode>> fetchCode() async {
//     try {
//       var url = ServerCode;
//       final response = await http.get(Uri.parse(url), headers: {
//         "Access-Control-Allow-Origin": "*",
//         "Access-Control-Allow-Methods": "GET", //use fot http, not use https
//       });
//       switch (response.statusCode) {
//         case 200:
//           var body = response.body;
//           List dataCode = json.decode(body);
//           return dataCode.map((data) => GetCode.fromJson(data)).toList();
//         case 401:
//           Get.toNamed(GetRoutes.SignIn);
//           throw Exception(response.reasonPhrase);
//         default:
//           throw Exception(response.reasonPhrase);
//       }
//     } on Exception catch (e) {
//       throw Exception('Error fetch Code - $e');
//     }
//   }
// }
