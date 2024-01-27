import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:web_booking/model/booking/model_create_booking.dart';
import 'package:web_booking/model/booking/storage_controller/create_booking_controller.dart';
import 'package:web_booking/page/booking/create_info_booking/create_booking_page.dart';
import 'package:web_booking/page/booking/create_info_booking/variabl_add_cont.dart';

class CargoInformation extends StatefulWidget {
  const CargoInformation({
    super.key,
  });

  @override
  State<CargoInformation> createState() => _CargoInformationState();
}

class _CargoInformationState extends State<CargoInformation> {
  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                  margin: EdgeInsets.only(left: 50),
                  width: 90,
                  child: Text('Commodity')),
              // SizedBox(width: 20),
              Container(
                // height: 50,
                width: 800,
                child: TextField(
                  controller: createBookingController.inputCommodity.value,
                  decoration: InputDecoration(border: OutlineInputBorder()),
                ),
              )
            ],
          ),
          SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                  width: 300,
                  child: Row(
                    children: [
                      Container(
                          margin: EdgeInsets.only(left: 50),
                          width: 90,
                          child: Text('Size')),
                      DropdownMenu<String>(
                        width: 120,
                        initialSelection:
                            createBookingController.currentSizeContainer.value,
                        onSelected: (String? value) {
                          createBookingController.currentSizeContainer.value =
                              value!;
                        },
                        dropdownMenuEntries: createBookingController
                            .listSizeContainer
                            .map<DropdownMenuEntry<String>>((String value) {
                          return DropdownMenuEntry<String>(
                              value: value, label: value);
                        }).toList(),
                      ),
                    ],
                  )),
              Container(
                  width: 230,
                  child: Row(
                    children: [
                      Container(
                          margin: EdgeInsets.only(left: 10),
                          width: 70,
                          child: Text('Type')),
                      DropdownMenu<String>(
                        width: 120,
                        initialSelection:
                            createBookingController.currentTypeContainer.value,
                        onSelected: (String? value) {
                          createBookingController.currentTypeContainer.value =
                              value!;
                        },
                        dropdownMenuEntries: createBookingController
                            .listTypeContainer
                            .map<DropdownMenuEntry<String>>((String value) {
                          return DropdownMenuEntry<String>(
                              value: value, label: value);
                        }).toList(),
                      ),
                    ],
                  )),
              Container(
                  width: 200,
                  child: Row(
                    children: [
                      Text('Status'),
                      SizedBox(
                        width: 20,
                      ),
                      DropdownMenu<String>(
                        width: 120,
                        initialSelection: createBookingController
                            .currentStatusContainer.value,
                        onSelected: (String? value) {
                          createBookingController.currentStatusContainer.value =
                              value!;
                        },
                        dropdownMenuEntries: createBookingController
                            .listStatusContainer
                            .map<DropdownMenuEntry<String>>((String value) {
                          return DropdownMenuEntry<String>(
                              value: value, label: value);
                        }).toList(),
                      ),
                    ],
                  )),
            ],
          ),
          SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              // Container(
              //     width: 300,
              //     child: Row(
              //       children: [
              //         Container(
              //             margin: EdgeInsets.only(left: 50),
              //             width: 90,
              //             child: Text('Quality')),
              //         DropdownMenu<String>(
              //           width: 120,
              //           initialSelection: currentQualityContainer,
              //           onSelected: (String? value) {
              //             currentQualityContainer = value!;
              //             // This is called when the user selects an item.
              //           },
              //           dropdownMenuEntries: listQuality
              //               .map<DropdownMenuEntry<String>>((String value) {
              //             return DropdownMenuEntry<String>(
              //                 value: value, label: value);
              //           }).toList(),
              //         ),
              //       ],
              //     )),
              Container(
                  width: 300,
                  child: Row(
                    children: [
                      Container(
                          margin: EdgeInsets.only(left: 50),
                          width: 90,
                          child: Text('Volume')),
                      Container(
                        width: 120,
                        child: TextField(
                          controller: createBookingController.inputVolume.value,
                          inputFormatters: [
                            FilteringTextInputFormatter.digitsOnly
                          ],
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                          ),
                        ),
                      )
                    ],
                  )),
              createBookingController.currentStatusContainer.value == 'F'
                  ? Row(
                      children: [
                        Container(
                            width: 230,
                            child: Row(
                              children: [
                                Container(
                                    margin: EdgeInsets.only(left: 10),
                                    width: 70,
                                    child: Text('Weight')),
                                Container(
                                  width: 120,
                                  child: TextField(
                                    controller: createBookingController
                                        .inputWeight.value,
                                    inputFormatters: [
                                      FilteringTextInputFormatter.digitsOnly
                                    ],
                                    decoration: InputDecoration(
                                      border: OutlineInputBorder(),
                                    ),
                                  ),
                                )
                              ],
                            )),
                        createBookingController.currentTypeContainer.value ==
                                'REEFER'
                            ? Container(
                                width: 200,
                                child: Row(
                                  children: [
                                    Text('Temp.'),
                                    Container(
                                      width: 110,
                                      child: TextField(
                                        controller: createBookingController
                                            .inputTemp.value,
                                        decoration: InputDecoration(
                                          border: OutlineInputBorder(),
                                        ),
                                      ),
                                    )
                                  ],
                                ))
                            : SizedBox.shrink(),
                      ],
                    )
                  : SizedBox.shrink(),
            ],
          ),
          SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                width: 300,
                child: Row(
                  children: [
                    Container(
                      margin: EdgeInsets.only(left: 50),
                      child: Text(
                        'Dangerous',
                        style: TextStyle(color: Colors.red),
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    SizedBox(
                      height: 50,
                      width: 50,
                      child: Checkbox(
                        value: createBookingController.boolContDangerous.value,
                        onChanged: (newValue) {
                          setState(() {
                            createBookingController.boolContDangerous.value =
                                !createBookingController
                                    .boolContDangerous.value;
                          });
                        },
                      ),
                    ),
                  ],
                ),
              ),
              createBookingController.boolContDangerous.value == false
                  ? SizedBox.shrink()
                  : Row(
                      children: [
                        Container(
                            margin: EdgeInsets.only(left: 10),
                            width: 70,
                            child: Text('UnNo')),
                        Container(
                          width: 120,
                          child: TextField(
                            controller:
                                createBookingController.inputDGunNo.value,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(),
                            ),
                          ),
                        ),
                        Container(
                            margin: EdgeInsets.only(left: 30),
                            width: 60,
                            child: Text('Class')),
                        Container(
                          width: 120,
                          child: TextField(
                            controller:
                                createBookingController.inputDGClass.value,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(),
                            ),
                          ),
                        ),
                      ],
                    ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                margin: EdgeInsets.only(top: 10, right: 50),
                child: Row(
                  children: [
                    createBookingController.boolError.value == true
                        ? Text(
                            'Please fill in the information in the empty box',
                            style: TextStyle(color: Colors.red),
                          )
                        : SizedBox.shrink(),
                    ElevatedButton(
                        onPressed: () {
                          if ((createBookingController
                                          .boolContDangerous.value ==
                                      true &&
                                  createBookingController.inputDGunNo.value.text
                                          .trim() ==
                                      '' &&
                                  createBookingController
                                          .inputDGClass.value.text
                                          .trim() ==
                                      '') ||
                              (createBookingController
                                          .currentStatusContainer.value ==
                                      'F' &&
                                  createBookingController.inputWeight.value.text
                                          .trim() ==
                                      '') ||
                              (createBookingController
                                          .currentStatusContainer.value ==
                                      'F' &&
                                  createBookingController
                                          .currentTypeContainer.value ==
                                      'REEFER' &&
                                  createBookingController.inputTemp.value.text
                                          .trim() ==
                                      '') ||
                              (createBookingController.inputCommodity.value.text
                                      .trim() ==
                                  '') ||
                              (createBookingController.inputCommodity.value.text
                                      .trim() ==
                                  '')) {
                            setState(() {
                              bool_error = true;
                            });
                          } else {
                            setState(() {
                              // bool_add_cont = true;
                              // bool_error = false;
                              // test_no = '1';
                              // test_commodity = input_commodity.text;
                              // test_size = currentSizeContainer;
                              // test_type = currentTypeContainer;
                              // test_status = currentStatusContainer;
                              // test_quality = currentQualityContainer;
                              // test_volume = input_volume.text;
                              // test_weight = input_weight.text;
                              // bool_type_container == true
                              //     ? test_temp = input_temp.text
                              //     : test_temp = '';
                              // bool_cont_dangerous == true
                              //     ? test_dangerous = 'Yes'
                              //     : test_dangerous = 'No';
                              // bool_cont_dangerous == true
                              //     ? test_rem = input_rem.text
                              //     : test_rem = '';
                              createBookingController.listInfoContainer!.value.add('abc', );
                              Volumes abc = Volumes(commodityConts: 'abc', typeConts: )
                            });
                          }
                        },
                        child: Text('ADD CONTAINER')),
                  ],
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
