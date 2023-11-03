import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:web_booking/constants/variable.dart';
import 'package:web_booking/model/list_request/model_image_request_detail.dart';

class ImageRequest extends StatefulWidget {
  const ImageRequest({Key? key}) : super(key: key);

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
        future: imageResponse().fetchImage(id_request_for_image!),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          }
          if (snapshot.hasData) {
            var dataImage = snapshot.data!;
            return Container(
              padding: EdgeInsets.only(bottom: 10),
              height: 150,
              width: 630,
              child: ListView.builder(
                  itemCount: dataImage.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (BuildContext context, index) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 5),
                      child: InkWell(
                        onTap: () {
                          showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return Dialog(
                                  child: InkWell(
                                    onTap: () => Navigator.of(context).pop(),
                                    child: Image.memory(base64
                                        .decode(snapshot.data![index].data!)),
                                  ),
                                );
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
