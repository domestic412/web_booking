import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
//
import 'package:image_picker/image_picker.dart';
import 'package:web_booking/constants/color.dart';
import 'package:web_booking/constants/global.dart';
import 'package:web_booking/constants/style.dart';
import 'package:web_booking/constants/text.dart';
import 'package:web_booking/constants/variable.dart';
import 'package:web_booking/controllers/sidebar_controller.dart';
import 'package:web_booking/page/default/widgets/mainMenu/mainMenu.dart';
import 'package:web_booking/page/signin/controller_signin.dart/info_signin_controller.dart';
import 'package:web_booking/screen/request_list/detail_request/detail_image_request_list.dart';
import 'package:web_booking/storage_controller.dart/controller_image.dart';
import 'package:web_booking/widgets/container/widget_Button.dart';
import 'dart:html' as html;

import 'package:web_booking/widgets/container/widget_TextField.dart';

class SendRequestPage extends StatefulWidget {
  const SendRequestPage({super.key});

  @override
  State<SendRequestPage> createState() => _SendRequestPageState();
}

class _SendRequestPageState extends State<SendRequestPage> {
  TextEditingController _input_cntr = TextEditingController();
  TextEditingController _input_camKet = TextEditingController();
  TextEditingController _input_shipperNote = TextEditingController();

  List<XFile>? _listImage;

  // String? base64image;
  final ImagePicker _picker = ImagePicker();
  int numberImage = 0;
  bool _bool_error_cntr = false;
  bool _bool_error_request_exist = false;
  bool _bool_error_null_cntr = false;
  @override
  void initState() {
    super.initState();
    _input_cntr.text = savecntr;
    _input_camKet.text = noiDung;
  }

  Future getImage(ImageSource media) async {
    List<XFile> img = await _picker.pickMultiImage();

    setState(() {
      _listImage = img;
    });
  }

  Widget _previewImage() {
    // print('show Image request');
    return Container(
      height: 150,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: _listImage!.length,
        itemBuilder: (BuildContext context, int index) {
          return Container(
            margin: EdgeInsets.only(right: 5, top: 10),
            child: InkWell(
              onTap: () {
                imageController.i.value = index;
                showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return Dialog(
                          child:
                              // InkWell(
                              //   onTap: () {
                              //     Navigator.of(context).pop();
                              //   },
                              //   child: Image.network(_listImage![index].path),
                              // ),
                              Obx(
                        () => Actions(
                          actions: <Type, Action<Intent>>{
                            DownIntent: CallbackAction<DownIntent>(
                              onInvoke: (DownIntent intent) {
                                if (imageController.i.value == 0) {
                                } else {
                                  --imageController.i.value;
                                  print(imageController.i.value);
                                }
                                return null;
                              },
                            ),
                            UpIntent: CallbackAction<UpIntent>(
                              onInvoke: (UpIntent intent) {
                                if (imageController.i.value ==
                                    _listImage!.length - 1) {
                                } else {
                                  ++imageController.i.value;
                                  print(imageController.i.value);
                                }
                                return null;
                              },
                            ),
                          },
                          child: Shortcuts(
                            shortcuts: <LogicalKeySet, Intent>{
                              LogicalKeySet(
                                LogicalKeyboardKey.arrowRight,
                              ): UpIntent(),
                              LogicalKeySet(
                                LogicalKeyboardKey.arrowLeft,
                              ): DownIntent(),
                            },
                            child: Focus(
                              autofocus: true,
                              child: Image.network(
                                  _listImage![imageController.i.value].path),
                            ),
                          ),
                        ),
                      ));
                    });
              },
              child: Image.network(_listImage![index].path, errorBuilder:
                  (BuildContext context, Object error, StackTrace? stackTrace) {
                return const Center(
                  child: Text('This image type is not supported'),
                );
              }),
            ),
          );
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Padding(
          padding: EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Center(
                child: Text(
                  "send request combine".tr,
                  style: style_title_page,
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                  width: deviceWidth(context),
                  decoration: BoxDecoration(
                    color: white,
                    border: Border.all(color: blue.withOpacity(.4), width: .5),
                    boxShadow: [
                      BoxShadow(
                          offset: const Offset(0, 6),
                          color: blue.withOpacity(.1),
                          blurRadius: 12)
                    ],
                    borderRadius: BorderRadius.circular(4),
                  ),
                  padding: EdgeInsets.only(top: 10, bottom: 10, left: 10),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Text('cntrno'.tr, style: style12_black),
                          const SizedBox(
                            width: 5,
                          ),
                          WidgetTextField(
                              controller: _input_cntr, width: 200, maxLines: 1),
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Row(
                        children: [
                          Text('shipper note'.tr, style: style12_black),
                          SizedBox(
                            width: 17,
                          ),
                          WidgetTextField(
                              controller: _input_shipperNote,
                              width: 200,
                              maxLines: 1),
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text('attach picture'.tr, style: style12_black),
                      const SizedBox(
                        height: 5,
                      ),
                      WidgetButton(
                        text: 'upload picture'.tr,
                        style: ElevatedButton.styleFrom(
                          backgroundColor: haian,
                          minimumSize: Size(100, 35),
                        ),
                        onPressed: () {
                          getImage(ImageSource.gallery);
                        },
                      ),
                      _listImage != null
                          ? Stack(children: [
                              _previewImage(),
                              Positioned(
                                  right: -10,
                                  top: -10,
                                  child: IconButton(
                                      icon: Icon(
                                        Icons.cancel,
                                        color: Colors.black.withOpacity(0.5),
                                        size: 14,
                                      ),
                                      onPressed: () => setState(() {
                                            numberImage = 0;
                                            _listImage = null;
                                          })))
                            ])
                          : const SizedBox(),
                      const SizedBox(
                        height: 10,
                      ),
                      Text('tenYeuCau'.tr, style: style12_black),
                      const SizedBox(
                        height: 5,
                      ),
                      Container(
                        width: 150,
                        padding: const EdgeInsets.all(6),
                        margin: const EdgeInsets.all(5),
                        color: Colors.black26,
                        child: Text(
                          NameRequest,
                          style: TextStyle(fontSize: 12, color: Colors.black54),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text('customer commitments'.tr, style: style12_black),
                      const SizedBox(
                        height: 5,
                      ),
                      WidgetTextField(
                          controller: _input_camKet, minLines: 1, maxLines: 10),
                      const SizedBox(
                        height: 20,
                      ),
                      Center(
                          child: WidgetButton(
                        text: 'send request'.tr,
                        style: ElevatedButton.styleFrom(
                          backgroundColor: haian,
                          minimumSize: Size(100, 35),
                        ),
                        onPressed: () {
                          setState(() {
                            _bool_error_request_exist = false;
                            _bool_error_cntr = false;
                            _bool_error_null_cntr = false;
                            PostRequest(_input_cntr.text);
                          });
                        },
                      )),
                      const SizedBox(height: 20),
                      _bool_error_cntr == false
                          ? SizedBox.shrink()
                          : Center(
                              child: Text('cont number not exist'.tr,
                                  style: style_text_red),
                            ),
                      _bool_error_request_exist == false
                          ? SizedBox.shrink()
                          : Center(
                              child: Text('cont number duplicate'.tr,
                                  style: style_text_red),
                            ),
                      _bool_error_null_cntr == false
                          ? SizedBox.shrink()
                          : Center(
                              child: Text('cont number null'.tr,
                                  style: style_text_red),
                            ),
                    ],
                  )),
            ],
          ),
        ),
      ],
    );
    // );
  }

  Future<void> PostRequest(String cntr) async {
    // String _token = await SecureStorage().readData('tokenLogin');

    //PostRequest with multipartFile
    if (cntr.isNotEmpty) {
      // Create a FormData object to store your files
      final formData = html.FormData();
      // Assuming a list of XFile objects in _listImage
      if (_listImage != null) {
        for (int i = 0; i < _listImage!.length; i++) {
          final file = _listImage![i];
          //Convert XFile to Blob
          final blob = html.Blob([await file.readAsBytes()], file.mimeType);
          // Add the Blob to the FormData object
          formData.appendBlob('files', blob, file.name);
        }
      }
      formData.append('tenYeuCau', NameRequest);
      formData.append('noiDung', _input_camKet.text);
      formData.append('cntrno', cntr.toUpperCase());
      formData.append('shipperNote', _input_shipperNote.text);
      formData.append('shipperId', inforUserController.shipperId.value);
      formData.append('shipperName', inforUserController.shipperName.value);

      final request = html.HttpRequest();
      request.open(
        'POST',
        URL_REQUEST,
      );
      request.send(formData);
      request.onLoad.listen((html.ProgressEvent event) {
        if (request.status == 200) {
          numberImage = 0;
          savecntr = '';
          controller.selectWidget.value = requestList;
        } else if (request.status == 409) {
          //request exist or cntr accept
          setState(() {
            _bool_error_request_exist = true;
          });
        } else if (request.status == 404) {
          // EasyLoading.dismiss();
          setState(() {
            _bool_error_cntr = true;
          });
        } else {
          ScaffoldMessenger.of(context)
              .showSnackBar(const SnackBar(content: Text("Invalid")));
        }
      });
    } else {
      setState(() {
        _bool_error_null_cntr = true;
      });
    }
  }
}
