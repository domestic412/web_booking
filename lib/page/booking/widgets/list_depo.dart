import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:web_booking/constants/variable.dart';
import 'package:web_booking/model/tracking/model_voyage.dart';

// ignore: must_be_immutable

TextEditingController soluongcntr = TextEditingController();

Future<void> ListDepo(BuildContext context) {
  return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Chọn Depot'),
          content: buildDepo(),
        );
      });
}

FutureBuilder<Voyage> buildDepo() {
  return FutureBuilder<Voyage>(
      future: fetchVoyage,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          var data = snapshot.data!;
          return SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: SizedBox(
              height: 500,
              width: 800,
              child: ListView.builder(
                  itemCount: data.depots!.length,
                  itemBuilder: (context, index) {
                    var dataDepo = data.depots![index];
                    nameDepo = dataDepo.depotName;
                    idDepo = dataDepo.depotId;
                    soluongcontDepo = dataDepo.soluong;
                    return Card(
                      child: Container(
                        decoration: BoxDecoration(
                            border: Border.all(),
                            borderRadius: BorderRadius.circular(5)),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  Text(
                                    'Tên depot: $nameDepo',
                                    // style: text_style4,
                                  ),
                                  const SizedBox(
                                    width: 90,
                                  ),
                                  const Text(
                                    'Số lượng container:  ',
                                    // style: text_style4,
                                  ),
                                  SizedBox(
                                    height: 40,
                                    width: 60,
                                    child: TextField(
                                      textAlignVertical: TextAlignVertical.top,
                                      // style: text_style4,
                                      controller: soluongcntr,
                                      keyboardType: TextInputType.number,
                                      textAlign: TextAlign.center,
                                      inputFormatters: <TextInputFormatter>[
                                        LengthLimitingTextInputFormatter(4),
                                        FilteringTextInputFormatter.digitsOnly
                                      ],
                                      decoration: const InputDecoration(
                                        border: OutlineInputBorder(
                                            borderSide: BorderSide(
                                                color: Colors.black, width: 5)),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 50,
                                  ),
                                  const Text(
                                    'Size: ',
                                    // style: text_style4,
                                  ),
                                  const SizedBox(
                                    width: 5,
                                  ),
                                  // DropDownButtonSize(),
                                ],
                              ),
                              const SizedBox(
                                height: 15,
                              ),
                              // Row(
                              //   mainAxisAlignment: MainAxisAlignment.start,
                              //   children: [
                              //     Text('Số lượng container rỗng: ' + soluongcontDepo.toString(), style: text_style4,),
                              //     SizedBox(width: 450,),
                              //     Container(
                              //       height: 35,
                              //       width: 90,
                              //       decoration: BoxDecoration(
                              //         color: blue,
                              //         border: Border.all(),
                              //         borderRadius: BorderRadius.circular(5)
                              //       ),
                              //       child: InkWell(
                              //         onTap: (){
                              //           int s = int.parse(soluongcntr.text);
                              //           int a = int.parse(soluongcontDepo.toString());
                              //           if (s == 0) {

                              //           }
                              //           if ( s > a) {
                              //             Text('Error');
                              //           }
                              //           else {
                              //             Navigator.push(context, MaterialPageRoute(builder: (context) => EndScreen()));
                              //           }
                              //         },
                              //         child: Container(
                              //           child: Row(
                              //             mainAxisAlignment: MainAxisAlignment.center,
                              //             children: [
                              //               Text('Next',style: text_style3,),
                              //               SizedBox(width: 5,),
                              //               Icon(Icons.arrow_right_alt, color: white,)
                              //             ],
                              //           ),
                              //         ),
                              //       ),
                              //     ),
                              // ],),
                            ],
                          ),
                        ),
                      ),
                    );
                  }),
            ),
          );
        }
        return const Text('');
      });
}
