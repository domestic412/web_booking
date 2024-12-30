import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:web_booking/constants/variable.dart';
import 'package:web_booking/model/list_request/model_image_request_detail.dart';
import 'package:web_booking/storage_controller.dart/controller_image.dart';

class ImageRequest extends StatefulWidget {
  @override
  State<ImageRequest> createState() => _ImageRequestState();
}

class _ImageRequestState extends State<ImageRequest> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: ImageResponse(),
    );
  }

  FutureBuilder<List<imageResponse>> ImageResponse() {
    return FutureBuilder<List<imageResponse>>(
        future: imageResponse().fetchImage(imageController.id.value),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          }
          if (snapshot.hasData) {
            var dataImage = snapshot.data!;
            return Container(
              padding: EdgeInsets.only(bottom: 10),
              // height: 150,
              // width: 630,
              height: 200,
              width: deviceWidth(context),
              child: ListView.builder(
                  itemCount: dataImage.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (BuildContext context, index) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 5),
                      child: InkWell(
                        onTap: () {
                          imageController.i.value = index;
                          showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return Dialog(
                                    child:
                                        // InkWell(
                                        //   onTap: () => Navigator.of(context).pop(),
                                        //   child: Image.memory(base64
                                        //       .decode(snapshot.data![index].data!)),
                                        // ),
                                        Obx(
                                  () => Actions(
                                    actions: <Type, Action<Intent>>{
                                      DownIntent: CallbackAction<DownIntent>(
                                        onInvoke: (DownIntent intent) {
                                          if (imageController.i.value == 0) {
                                          } else {
                                            --imageController.i.value;
                                            // quoteController.pathImg.value =
                                            //     files[i]['path'];
                                            // quoteController.nameImg.value =
                                            //     removeBeforeSlash(
                                            //         files[i]['name']);

                                            print(imageController.i.value);
                                          }
                                          return null;
                                        },
                                      ),
                                      UpIntent: CallbackAction<UpIntent>(
                                        onInvoke: (UpIntent intent) {
                                          if (imageController.i.value ==
                                              dataImage.length - 1) {
                                          } else {
                                            ++imageController.i.value;
                                            // quoteController.pathImg.value =
                                            //     files[i]['path'];
                                            // quoteController.nameImg.value =
                                            //     removeBeforeSlash(
                                            //         files[i]['name']);

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
                                        child: Image.memory(base64.decode(
                                            snapshot
                                                .data![imageController.i.value]
                                                .data!)),
                                        // Container(
                                        //   height: fullSizeHeight! * 0.7,
                                        //   width: fullSizeWidth! * 0.5,
                                        //   decoration:
                                        //       BoxDecoration(border: Border.all()),
                                        //   child: Column(
                                        //     children: [
                                        //       Image.network(
                                        //           quoteController.pathImg.value,
                                        //           errorBuilder: (BuildContext
                                        //                   context,
                                        //               Object error,
                                        //               StackTrace? stackTrace) {
                                        //         return const Center(
                                        //           child: Text(
                                        //               'This image type is not supported:'),
                                        //         );
                                        //       }),
                                        //       Center(
                                        //           child: Text(
                                        //         '${i + 1}. ' +
                                        //             quoteController.nameImg.value,
                                        //       ))
                                        //     ],
                                        //   ),
                                        // ),
                                      ),
                                    ),
                                  ),
                                ));
                              });
                        },
                        child: ClipRRect(
                            borderRadius: BorderRadius.circular(8),
                            child: Image.memory(
                                base64.decode(snapshot.data![index].data!))),
                      ),
                    );
                  }),
            );
          } else {
            return Text('');
          }
        });
  }
}

class UpIntent extends Intent {}

class DownIntent extends Intent {}
