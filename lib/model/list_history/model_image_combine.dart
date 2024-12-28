import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:web_booking/constants/color.dart';
import 'package:web_booking/constants/global.dart';
import 'package:http/http.dart' as http;
import 'package:web_booking/constants/variable.dart';
import 'package:web_booking/controllers/date_controller.dart';

class ImageCombine {
  String? combineImageId;
  String? cntrno;
  String? filename;
  String? data;
  int? size;
  String? combineStuffing;
  String? updateTime;

  ImageCombine(
      {this.combineImageId,
      this.cntrno,
      this.filename,
      this.data,
      this.size,
      this.combineStuffing,
      this.updateTime});

  ImageCombine.fromJson(Map<String, dynamic> json) {
    combineImageId = json['combineImageId'];
    cntrno = json['cntrno'];
    filename = json['filename'];
    data = json['data'];
    size = json['size'];
    combineStuffing = json['combineStuffing'];
    updateTime = json['updateTime'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['combineImageId'] = this.combineImageId;
    data['cntrno'] = this.cntrno;
    data['filename'] = this.filename;
    data['data'] = this.data;
    data['size'] = this.size;
    data['combineStuffing'] = this.combineStuffing;
    data['updateTime'] = this.updateTime;
    return data;
  }

  Future<void> fetchImageCombine(String cntr, String numKh) async {
    try {
      var url = '$SERVER/GetImageCombineContainer?container=$cntr';
      final response = await http.get(Uri.parse(url), headers: {
        "Access-Control-Allow-Origin": "*",
        "Access-Control-Allow-Methods": "GET", //use fot http, not use https
      });
      switch (response.statusCode) {
        case 200:
          var body = response.body;
          // print('Data Image Request Detail');
          List data = jsonDecode(body);
          if (data.length == 0) {
            return EasyLoading.showError('No Image');
          } else {
            dateController.fileImageCombine.value = data[0];
            return Get.defaultDialog(
              title: 'Current combinations of $cntr : $numKh',
              titleStyle: TextStyle(color: red),
              content: Container(
                height: (fullSizeHeight ?? 500) * 0.8,
                width: (fullSizeWidth ?? 900) * 0.8,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      margin: EdgeInsets.only(right: 5),
                      height: (fullSizeHeight ?? 500) * 0.8,
                      width: (fullSizeWidth ?? 900) * 0.25,
                      decoration: BoxDecoration(border: Border.all()),
                      child: ListView.builder(
                          scrollDirection: Axis.vertical,
                          itemCount: data.length,
                          itemBuilder: (BuildContext context, index) {
                            return Container(
                                margin: EdgeInsets.all(15),
                                child: InkWell(
                                  onTap: () {
                                    dateController.fileImageCombine.value =
                                        data[index];
                                  },
                                  child: Text('(' +
                                      data[index]['combineStuffing'] +
                                      ') ' +
                                      data[index]['filename']),
                                ));
                          }),
                    ),
                    Obx(() => Container(
                          height: (fullSizeHeight ?? 500) * 0.8,
                          width: (fullSizeWidth ?? 900) * 0.5,
                          decoration: BoxDecoration(border: Border.all()),
                          child: Image.memory(
                              base64.decode(
                                  dateController.fileImageCombine['data']),
                              errorBuilder: (BuildContext context, Object error,
                                  StackTrace? stackTrace) {
                            return const Center(
                              child: Text('This image type is not supported:'),
                            );
                          }),
                        ))
                  ],
                ),
              ),
              confirm: ElevatedButton(
                  style: ElevatedButton.styleFrom(backgroundColor: normalColor),
                  onPressed: () {
                    Get.back();
                  },
                  child: Text(
                    'OK',
                    style: TextStyle(color: white),
                  )),
            );
          }
        case 404:
          return EasyLoading.showError('No Image');
        default:
          return EasyLoading.showError('Error ${response.reasonPhrase}');
        // throw Exception(response.reasonPhrase);
      }
    } on Exception catch (e) {
      throw Exception('Error fetch Image - $e');
    }
  }
}
