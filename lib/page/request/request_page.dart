// ignore: must_be_immutable
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:web_booking/constants/color.dart';
import 'package:web_booking/constants/global.dart';
import 'package:web_booking/constants/text.dart';
import 'package:web_booking/constants/variable.dart';
import 'package:web_booking/page/request/popUpAlert/alert.dart';
import 'package:http/http.dart' as http;
import 'package:http_parser/http_parser.dart';

class RequestPage extends StatefulWidget {
  @override
  State<RequestPage> createState() => _RequestPageState();
}

class _RequestPageState extends State<RequestPage> {
  TextEditingController CntrNo_Request = TextEditingController();

  List<XFile>? _listImage;

  String? base64image;
  final ImagePicker _picker = ImagePicker();
  int numberImage = 0;

  @override
  void initState() {
    super.initState();
    CntrNo_Request.text = savecntr;
  }

  Future getImage(ImageSource media) async {
    List<XFile> img = await _picker.pickMultiImage(
        // source: media,
        // maxHeight: 650,
        // maxWidth: 650
        ); //get image in media  //not support IOS lower than 14

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
      height: 100,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: numberImage,
        itemBuilder: (BuildContext context, int index) {
          return Container(
            margin: EdgeInsets.only(right: 5),
            child: InkWell(
              onTap: () {
                showDialog(
                  context: context,
                  builder: (_) => InkWell(
                    onTap: () {
                      Navigator.of(context).pop();
                    },
                    child: Image.file(File(_listImage![index].path)),
                  ),
                );
              },
              child: Image.file(File(_listImage![index].path), errorBuilder:
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
    return Container(
      height: deviceHeight(context),
      padding: EdgeInsets.only(
          left: deviceWidth(context) * 0.02,
          right: deviceWidth(context) * 0.03),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const SizedBox(
              height: 15,
            ),
            const Center(
              child: Text(
                'Gửi yêu cầu xin kết hợp',
                style: TextStyle(
                    fontSize: 25,
                    color: Colors.black87,
                    fontWeight: FontWeight.bold),
              ),
            ),
            const Divider(
              color: Colors.black,
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20, top: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text('Số Container', style: text_detail),
                  const SizedBox(
                    height: 8,
                  ),
                  TextField(
                    textCapitalization: TextCapitalization.characters,
                    controller: CntrNo_Request,
                    style: text_style3,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: 'Số Container',
                      hintStyle: text_style4,
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Text('Ảnh đính kèm', style: text_style2),
                  const SizedBox(
                    height: 8,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Expanded(
                        flex: 5,
                        child: ElevatedButton(
                          style:
                              ElevatedButton.styleFrom(backgroundColor: haian),
                          onPressed: () {
                            getImage(ImageSource.gallery);
                          },
                          child: Row(
                            children: [
                              const Icon(Icons.image),
                              Text(
                                'Thư viện ảnh',
                                style: TextStyle(color: light),
                              ),
                            ],
                          ),
                        ),
                      ),
                      const Expanded(flex: 5, child: SizedBox()),
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
                      : const Text(''),
                  const SizedBox(
                    height: 10,
                  ),
                  Text('Ý kiến khách hàng', style: text_style2),
                  const SizedBox(
                    height: 8,
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
                      style: text_style1,
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Text('Cam kết khách hàng', style: text_style2),
                  const SizedBox(
                    height: 8,
                  ),
                  Container(
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: Color(0xFFe8e8ea),
                      border: Border.all(color: Colors.black26),
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: Text(
                      noiDung,
                      style: text_style1,
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Text('Trạng thái gửi', style: text_style2),
                  const SizedBox(
                    height: 8,
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
                      style: text_style1,
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Center(
                      child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              backgroundColor: Color(0xFF09227e),
                              minimumSize: Size(deviceWidth(context) * 0.9, 50),
                              shape: const RoundedRectangleBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10)))),
                          onPressed: () {
                            PostRequest(CntrNo_Request.text);
                          },
                          child: Text('Gửi',
                              style: TextStyle(fontSize: 18, color: light)))),
                  const SizedBox(height: 20)
                ],
              ),
            )
          ],
        ),
      ),
    );
    // );
  }

  Future<void> PostRequest(String cntr) async {
    //PostRequest with multipartFile
    var uri = Uri.parse(URL_REQUEST);
    // var uri = Uri.parse('$SERVER_NAME/Requests/SendRequest1');     // server test
    if (cntr.isNotEmpty) {
      // EasyLoading.show(
      //   status: 'Loading...',
      //   maskType: EasyLoadingMaskType.black,
      //   dismissOnTap: false,
      //   );
      var request = http.MultipartRequest('POST', uri);
      request.fields['TenYeuCau'] = NameRequest;
      request.fields['NoiDung'] = noiDung;
      request.fields['Cntrno'] = cntr.toUpperCase();
      request.fields['NguoiGui'] = tokenLogin!;
      request.fields['Id'] = '0';
      for (int i = 0; i < numberImage; i++) {
        request.files.add(await http.MultipartFile.fromPath(
            'Files', _listImage![i].path,
            contentType: MediaType('image', 'png,jpg,jpeg')));
      }
      var response = await request.send();
      if (response.statusCode == 200) {
        print('Send request');
        // EasyLoading.dismiss();
        numberImage = 0;
        savecntr = '';
        // setState(() {
        // selectedItem(context, 1);
        // Navigator.pushAndRemoveUntil(
        //       context,
        //       MaterialPageRoute(
        //         builder: (context) => DefaultPage()
        //       ),
        //   ModalRoute.withName('/listRequest')
        // );
        // });
      } else {
        // EasyLoading.dismiss();
        RequestContAlert(context);
      }
    } else {
      ScaffoldMessenger.of(context)
          .showSnackBar(const SnackBar(content: Text("Invalid")));
    }
  }
}
