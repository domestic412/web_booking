import 'dart:convert';

import 'package:web_booking/constants/global.dart';
import 'package:web_booking/constants/variable.dart';
import 'package:http/http.dart' as http;

List<imageRequestDetailResponse> postFromJson(String str) =>
    List<imageRequestDetailResponse>.from(json.decode(str).map((x) => imageRequestDetailResponse.fromJson(x)));

class imageRequestDetailResponse {
  int? id;
  int? requestId;
  String? data;
  int? size;
  String? requestImage;
  Null request;

  imageRequestDetailResponse(
      {this.id,
      this.requestId,
      this.data,
      this.size,
      this.requestImage,
      this.request});

  imageRequestDetailResponse.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    requestId = json['requestId'];
    data = json['data'];
    size = json['size'];
    requestImage = json['requestImage'];
    request = json['request'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['requestId'] = this.requestId;
    data['data'] = this.data;
    data['size'] = this.size;
    data['requestImage'] = this.requestImage;
    data['request'] = this.request;
    return data;
  }

  Future<List<imageRequestDetailResponse>> fetchImageRequestDetail() async {
    var url = '$SERVER/Requests/GetDBMultiImage?id=$id_request';
    if (id_request!.isNotEmpty) {
      // EasyLoading.show(
      //   status: 'Loading...',
      //   maskType: EasyLoadingMaskType.black,
      //   dismissOnTap: true,
      //   );
      final response = await http.get(Uri.parse(url),);
      if (response.statusCode == 200) {
        // EasyLoading.dismiss();
        var body = response.body;
        print('Data Image Request Detail');
        List dataDetail = jsonDecode(body);
        return dataDetail.map((data) => imageRequestDetailResponse.fromJson(data)).toList();
        } else {
          // EasyLoading.dismiss();
          throw Exception('Cannot connect to Server or no have Image');
        }
    } else {
      throw Exception('Failed to load because no have ID');
    }
  }
}