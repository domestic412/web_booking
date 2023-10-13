import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'package:http/http.dart' as http;
import 'package:web_booking/page/booking/widgets/list_port.dart';
import 'package:web_booking/page/default/widgets/appbar.dart';

import '../../constants/color.dart';
import '../../constants/global.dart';
import '../../constants/style.dart';
import '../../constants/variable.dart';
import '../../model/model_port.dart';
import '../../model/model_voyage.dart';

class BookingPage extends StatefulWidget {
  @override
  State<BookingPage> createState() => _BookingPageState();
}

class _BookingPageState extends State<BookingPage> {
  TextEditingController date_select = TextEditingController();
  TextEditingController port_select1 = TextEditingController();
  TextEditingController port_select2 = TextEditingController();
  TextEditingController soluongcntr = TextEditingController();
  Ports? selectPort1;
  Ports? selectPort2;
  String? idPort1;
  String? idPort2;
  String? dateSelect;
  // AlertSelectPort alertSelectPort = AlertSelectPort();
  Future<Voyage>? fetchVoyage;
  bool isVisible = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            appbar(),
            Container(
              margin: EdgeInsets.fromLTRB(10, 10, 10, 40),
              decoration: BoxDecoration(
                  color: contentColor, borderRadius: BorderRadius.circular(10)),
              width: 1004,
              padding: const EdgeInsets.fromLTRB(5, 10, 5, 10),
              child: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Column(
                  children: [
                    SelectableText(
                      'Booking Request',
                      style: style20_blue,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Divider(
                      color: normalColor,
                      height: 1,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const ListPort(),
                        const SizedBox(width: 20),
                        SizedBox(
                          height: 50,
                          width: 250,
                          child: TextField(
                            controller: date_select,
                            decoration: const InputDecoration(
                              border: OutlineInputBorder(),
                              labelText: 'Chọn ngày đi',
                              icon: Icon(Icons.calendar_month),
                            ),
                            onTap: () async {
                              DateTime? pickeddate = await showDatePicker(
                                  context: context,
                                  initialDate: DateTime.now(),
                                  firstDate: DateTime.now(),
                                  lastDate: DateTime(2123));
                              if (pickeddate != null) {
                                setState(() {
                                  date_select.text = DateFormat('MM/dd/yyyy')
                                      .format(pickeddate);
                                  dateSelect = date_select.text.toString();
                                });
                              }
                            },
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Container(
                      width: 840,
                      alignment: Alignment.bottomRight,
                      child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              backgroundColor: Color(0xFF09227e),
                              minimumSize: Size(180, 45),
                              shape: const RoundedRectangleBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10)))),
                          onPressed: () {
                            if (idPort1 == idPort2) {
                              // alertSelectPort.showAlertSamePort(context);
                            } else if (idPort1 == null || idPort2 == null) {
                              // alertSelectPort.showAlertPort(context);
                            } else {
                              // fetchDataVoyage(idPort1.toString(), idPort2.toString(), date_select.text);
                              // setState(() {
                              //   fetchVoyage = fetchDataVoyage(
                              //       idPort1.toString(),
                              //       idPort2.toString(),
                              //       date_select.text);
                              // });
                            }
                          },
                          child: Text(
                            'Tìm chuyến tàu',
                            // style: text_style3
                          )),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                      //test
                      width: 840,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'ID POL:             $idPort1',
                            // style: text_style4
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Text(
                            'ID POD:             $idPort2',
                            // style: text_style4
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Text(
                            'Date:               $dateSelect',
                            // style: text_style4,
                          )
                        ],
                      ),
                    ),
                    buildVoyage(),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  // FutureBuilder<List<Ports>> buildPort() {
  //   return FutureBuilder<List<Ports>> (
  //     future: fetchPorts(),
  //     builder: (context, snapshot) {
  //       if (snapshot.hasData) {
  //         List listports = snapshot.data!;
  //         final List<DropdownMenuEntry<Ports>> portEntries =
  //       <DropdownMenuEntry<Ports>>[];
  //   for (final portId in listports) {
  //     portEntries.add(
  //       DropdownMenuEntry<Ports>(
  //           value: portId, label: portId.portName,
  //           ),
  //     );
  //   }
  //         return Row(
  //           mainAxisAlignment: MainAxisAlignment.center,
  //           children: [
  //             SizedBox(
  //               height: 50,
  //               width: 275,
  //               child: DropdownMenu<Ports>(
  //                 menuHeight: 500,
  //                 controller: port_select1,
  //                 enableFilter: true,
  //                 label: const Text('Cảng đi '),
  //                 dropdownMenuEntries: portEntries,
  //                 onSelected: (Ports? id) {
  //                   setState(() {
  //                     selectPort1 = id;
  //                     idPort1 = selectPort1?.portId;
  //                   });
  //                 },
  //                 ),
  //             ),
  //             const SizedBox(width: 10,),
  //             const Icon(Icons.arrow_right_alt),
  //             const SizedBox(width: 10,),
  //             SizedBox(
  //               height: 50,
  //               width: 275,
  //               child: DropdownMenu<Ports>(
  //                 menuHeight: 500,
  //                 controller: port_select2,
  //                 enableFilter: true,
  //                 label: const Text('Cảng đến '),
  //                 dropdownMenuEntries: portEntries,
  //                 onSelected: (Ports? id) {
  //                   setState(() {
  //                     selectPort2 = id;
  //                     idPort2 = selectPort2?.portId;
  //                   });
  //                 },
  //                 ),
  //             )
  //           ],
  //         );
  //       } return Text('Error');
  //     });
  // }

  // Future<Voyage> fetchDataVoyage(String pol, String pod, String etd) async {
  //   // var url = '$S/Booking?POLId=$pol&PODId=$pod&ETD=$etd';
  //   var data = {'POLId': pol, 'PODId': pod, 'ETD': etd};
  //   var body = json.encode(data);
  //   if (pol.isNotEmpty & pod.isNotEmpty & etd.isNotEmpty) {
  //     final response = await http.post(Uri.parse(url),
  //         headers: {"Content-Type": "application/json"}, body: body);
  //     if (response.statusCode == 200) {
  //       var body = response.body;
  //       // List dataVoyage = json.decode(body);
  //       // return dataVoyage.map((data) => Voyage.fromJson(data)).toList();
  //       final dataVoyage = json.decode(body);
  //       return Voyage.fromJson(dataVoyage);
  //     } else
  //       throw Exception('Error');
  //   } else {
  //     throw Exception('Error');
  //   }
  // }

  FutureBuilder<Voyage> buildVoyage() {
    return FutureBuilder<Voyage>(
        future: fetchVoyage,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return CircularProgressIndicator();
          } else if (snapshot.hasError) {
            return Text('Error: ${snapshot.error}');
          } else if (snapshot.hasData) {
            return Container(
              height: 700,
              width: 900,
              child: ListView.builder(
                  itemCount: snapshot.data!.listBookingVoys?.length,
                  itemBuilder: (context, index) {
                    var _dataVoyage = snapshot.data!.listBookingVoys?[index];
                    nameVoyage = _dataVoyage?.voyId;
                    dateVoyage = _dataVoyage?.etd;
                    idVoyage = _dataVoyage?.voyDetail;
                    // bool? isVi$index;
                    // if (isVi$index == null) {
                    //   isVi$index = false;
                    // } else {
                    //   isVi$index = isVi$index;
                    // }
                    return Card(
                      elevation: 0,
                      child: Padding(
                        padding: EdgeInsets.only(top: 8),
                        child: Container(
                          decoration: BoxDecoration(
                              border: Border.all(),
                              borderRadius: BorderRadius.circular(10)),
                          child: InkWell(
                            onTap: () {
                              showDialog(
                                  context: context,
                                  builder: (BuildContext context) {
                                    return AlertDialog(
                                      title: Text('Chon Depo'),
                                      content: buildDepo(),
                                    );
                                  });
                              // setState(() {
                              //   isVi$index = !isVi$index!;
                              // });
                              // print(isVisible);
                            },
                            child: Row(
                              children: [
                                SizedBox(
                                  height: 100,
                                  width: 20,
                                ),
                                Container(
                                  width: 500,
                                  alignment: Alignment.bottomLeft,
                                  child: Text(
                                    nameVoyage.toString(),
                                    // style: text_style4,
                                  ),
                                ),
                                Container(
                                  width: 300,
                                  alignment: Alignment.bottomRight,
                                  child: Text(
                                    dateVoyage.toString().substring(0, 10),
                                    // style: text_style4,
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                    );
                  }),
            );
          }
          return Text('');
        });
  }

  FutureBuilder<Voyage> buildDepo() {
    return FutureBuilder<Voyage>(
        future: fetchVoyage,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            var _data = snapshot.data!;
            return SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: SizedBox(
                height: 500,
                width: 800,
                child: ListView.builder(
                    itemCount: _data.depots!.length,
                    itemBuilder: (context, index) {
                      var _dataDepo = _data.depots![index];
                      nameDepo = _dataDepo.depotName;
                      idDepo = _dataDepo.depotId;
                      soluongcontDepo = _dataDepo.soluong;
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
                                      'Tên depo: ' + nameDepo.toString(),
                                      // style: text_style4,
                                    ),
                                    SizedBox(
                                      width: 90,
                                    ),
                                    Text(
                                      'Số lượng container:  ',
                                      // style: text_style4,
                                    ),
                                    Container(
                                      height: 40,
                                      width: 60,
                                      child: TextField(
                                        textAlignVertical:
                                            TextAlignVertical.top,
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
                                                  color: Colors.black,
                                                  width: 5)),
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      width: 50,
                                    ),
                                    Text(
                                      'Size: ',
                                      // style: text_style4,
                                    ),
                                    SizedBox(
                                      width: 5,
                                    ),
                                    // DropDownButtonSize(),
                                  ],
                                ),
                                SizedBox(
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
          return Text('');
        });
  }
}
