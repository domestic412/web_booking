import 'dart:convert';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:syncfusion_flutter_datagrid/datagrid.dart';
import 'package:web_booking/constants/global.dart';
import 'package:web_booking/page/signin/controller_signin.dart/info_signin_controller.dart';
import 'package:web_booking/utils/getx_route.dart';

class QualityList {
  int? id;
  String? maChatLuong;
  String? tenChatLuong;
  String? ghiChu;
  String? updateTime;
  String? updateUser;

  QualityList(
      {this.id,
      this.maChatLuong,
      this.tenChatLuong,
      this.ghiChu,
      this.updateTime,
      this.updateUser});

  DataGridRow getDataGridRow_Quality() {
    return DataGridRow(cells: [
      DataGridCell<int>(columnName: 'id', value: id),
      DataGridCell<String>(columnName: 'quality code'.tr, value: maChatLuong),
      DataGridCell<String>(columnName: 'quality name'.tr, value: tenChatLuong),
      DataGridCell<String>(columnName: 'note'.tr, value: ghiChu),
      DataGridCell<String>(columnName: 'updateTime'.tr, value: updateTime),
      DataGridCell<String>(columnName: 'updater'.tr, value: updateUser),
      DataGridCell<String>(columnName: '##', value: ''),
    ]);
  }

  QualityList.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    maChatLuong = json['maChatLuong'];
    tenChatLuong = json['tenChatLuong'];
    ghiChu = json['ghiChu'];
    updateTime = json['updateTime'];
    updateUser = json['updateUser'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['maChatLuong'] = this.maChatLuong;
    data['tenChatLuong'] = this.tenChatLuong;
    data['ghiChu'] = this.ghiChu;
    data['updateTime'] = this.updateTime;
    data['updateUser'] = this.updateUser;
    return data;
  }

  Future<List<QualityList>> fetchQualityList() async {
    try {
      var url = '$SERVER/QualityList/GetAll';
      final response = await http.get(Uri.parse(url), headers: {
        "Access-Control-Allow-Origin": "*",
        "Access-Control-Allow-Methods": "GET", //use fot http, not use https
      });
      if (response.statusCode == 200) {
        var body = response.body;
        print('Data List Quality');
        List dataQualityList = json.decode(body);
        return dataQualityList
            .map((data) => QualityList.fromJson(data))
            .toList();
      } else if (response.statusCode == 401) {
        Get.toNamed(GetRoutes.SignIn);
        throw Exception(response.reasonPhrase);
      } else {
        throw Exception('Error');
      }
    } on Exception catch (e) {
      throw Exception('Error fetch Quality - $e');
    }
  }
}
