import 'package:flutter/material.dart';
//
import 'package:image_picker/image_picker.dart';
import 'package:web_booking/constants/color.dart';
import 'package:web_booking/constants/global.dart';
import 'package:web_booking/constants/style.dart';
import 'package:web_booking/constants/text.dart';
import 'package:web_booking/constants/variable.dart';
import 'package:web_booking/screen/home/homepage_screen.dart';
import 'package:web_booking/screen/request/popUpAlert/alert.dart';
import 'dart:html' as html;
import 'package:easy_localization/easy_localization.dart';

class SendRequestPage extends StatefulWidget {
  @override
  State<SendRequestPage> createState() => _SendRequestPageState();
}

class _SendRequestPageState extends State<SendRequestPage> {
  TextEditingController _input_cntr = TextEditingController();
  TextEditingController _input_camKet = TextEditingController();

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
      if (_listImage!.length <= 5) {
        numberImage = _listImage!.length;
      } else {
        numberImage = 5;
        OverloadImageAlert(context);
      }
    });
  }

  Widget _previewImage() {
    print('show Image request');
    return Container(
      height: 150,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: numberImage,
        itemBuilder: (BuildContext context, int index) {
          return Container(
            margin: EdgeInsets.only(right: 5, top: 10),
            child: InkWell(
              onTap: () {
                showDialog(
                  context: context,
                  builder: (_) => Dialog(
                    child: InkWell(
                      onTap: () {
                        Navigator.of(context).pop();
                      },
                      child: Image.network(_listImage![index].path),
                    ),
                  ),
                );
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
    return SizedBox(
      height: deviceHeight(context),
      child: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(32),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                width: deviceWidth(context),
                alignment: Alignment.bottomCenter,
                margin: const EdgeInsets.only(bottom: 16),
                child: Text(
                  "send request combine".tr(),
                  style: style_title_page,
                ),
              ),
              Text('container'.tr(), style: style_text_detail),
              const SizedBox(
                height: 10,
              ),
              Container(
                decoration: BoxDecoration(
                  color: white,
                  border: Border.all(color: blue.withOpacity(.4), width: .5),
                  boxShadow: [
                    BoxShadow(
                        offset: const Offset(0, 6),
                        color: blue.withOpacity(.1),
                        blurRadius: 12)
                  ],
                  borderRadius: BorderRadius.circular(8),
                ),
                padding: const EdgeInsets.all(16),
                // margin: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      border: Border.all(color: Colors.black45)),
                  child: ListTile(
                    leading: const Icon(Icons.calendar_view_week_rounded),
                    title: TextField(
                      controller: _input_cntr,
                      decoration: InputDecoration(
                          hintText: 'container'.tr(), border: InputBorder.none),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Text('attach picture'.tr(), style: style_text_detail),
              const SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: haian,
                        shape: const RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(10)))),
                    onPressed: () {
                      getImage(ImageSource.gallery);
                    },
                    child: Container(
                      padding: EdgeInsets.all(7),
                      child: Row(
                        children: [
                          const Icon(Icons.image),
                          SizedBox(
                            width: 10,
                          ),
                          Text(
                            'upload picture'.tr(),
                            style: TextStyle(color: light),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
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
                                size: 20,
                              ),
                              onPressed: () => setState(() {
                                    numberImage = 0;
                                    _listImage = null;
                                  })))
                    ])
                  : const SizedBox(),
              const SizedBox(
                height: 20,
              ),
              Text('customer requests'.tr(), style: style_text_detail),
              const SizedBox(
                height: 10,
              ),
              Container(
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: Color(0xFFe8e8ea),
                  border: Border.all(color: Colors.black26),
                  borderRadius: BorderRadius.circular(5),
                ),
                child: Text(
                  NameRequest,
                  style: style_text_box,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Text('customer commitments'.tr(), style: style_text_detail),
              const SizedBox(
                height: 10,
              ),
              Container(
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.black26),
                    borderRadius: BorderRadius.circular(5)),
                child: TextField(
                  controller: _input_camKet,
                  style: style_textfield,
                  textCapitalization: TextCapitalization.sentences,
                  minLines: 1,
                  maxLines: 10,
                  keyboardType: TextInputType.multiline,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Text('status request'.tr(), style: style_text_detail),
              const SizedBox(
                height: 10,
              ),
              Container(
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: Color(0xFFe8e8ea),
                  border: Border.all(color: Colors.black26),
                  borderRadius: BorderRadius.circular(5),
                ),
                child: Text(
                  StatusRequest,
                  style: style_text_box,
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              Center(
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: haian,
                          shape: const RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10)))),
                      onPressed: () {
                        setState(() {
                          _bool_error_request_exist = false;
                          _bool_error_cntr = false;
                          _bool_error_null_cntr = false;
                          PostRequest(_input_cntr.text);
                        });
                      },
                      child: Container(
                        padding:
                            EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                        child: Text('send request'.tr(),
                            style: style_text_box_button),
                      ))),
              const SizedBox(height: 20),
              _bool_error_cntr == false
                  ? SizedBox()
                  : Center(
                      child: Text('cont number not exist'.tr(),
                          style: style_text_red),
                    ),
              _bool_error_request_exist == false
                  ? SizedBox()
                  : Center(
                      child: Text('cont number duplicate'.tr(),
                          style: style_text_red),
                    ),
              _bool_error_null_cntr == false
                  ? SizedBox()
                  : Center(
                      child:
                          Text('cont number null'.tr(), style: style_text_red),
                    ),
            ],
          ),
        ),
      ),
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
          formData.appendBlob('Files', blob, file.name);
        }
      }
      formData.append('TenYeuCau', NameRequest);
      formData.append('NoiDung', _input_camKet.text);
      formData.append('Cntrno', cntr.toUpperCase());
      formData.append('NguoiGui', tokenLogin);

      final request = html.HttpRequest();
      request.open(
        'POST',
        URL_REQUEST,
      );
      request.send(formData);
      request.onLoad.listen((html.ProgressEvent event) {
        if (request.status == 200) {
          print('Send request');
          // EasyLoading.dismiss();
          numberImage = 0;
          savecntr = '';
          sideBarController.index.value = 2;
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
