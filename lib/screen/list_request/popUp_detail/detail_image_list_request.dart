import 'dart:convert';

import 'package:flutter/material.dart';
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

  FutureBuilder<List<imageRequestDetailResponse>> ImageResponse() {
  return FutureBuilder<List<imageRequestDetailResponse>> (
    future: imageRequestDetailResponse().fetchImageRequestDetail(),
    builder: (context, snapshot) {
      if (snapshot.hasData) {
        var dataImage = snapshot.data!;
        return Container(
          padding: EdgeInsets.only(bottom: 10),
          height: 100,
          width: 590,
          child: ListView.builder(
            itemCount: dataImage.length,
            scrollDirection: Axis.horizontal,
            itemBuilder: (BuildContext context, index) {
              return Padding(
                      padding:
                          const EdgeInsets.symmetric(horizontal: 5),
                      child: InkWell(
                        onTap: () async {
                          await showDialog(
                              context: context,
                              builder: (_) => InkWell(
                                onTap: () {
                                  Navigator.of(context).pop();
                                },
                                  child: Image.memory(base64.decode(snapshot.data![index].data!))));
                        },
                        child: ClipRRect(
                            borderRadius: BorderRadius.circular(8),
                            child: 
                            Image.memory(base64.decode(snapshot.data![index].data!))
                            ),
                      ),
                    );
            }
            ),
        );
      } else {
        return Text('');
      }
    }
    );
  }
}