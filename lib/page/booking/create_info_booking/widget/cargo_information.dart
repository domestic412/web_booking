import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:web_booking/model/booking/model_create_booking.dart';
import 'package:web_booking/model/booking/storage_controller/create_booking_controller.dart';

class CargoInformation extends StatefulWidget {
  const CargoInformation({
    super.key,
  });

  @override
  State<CargoInformation> createState() => _CargoInformationState();
}

class _CargoInformationState extends State<CargoInformation> {
  // String? contDangerous;
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
                width: 760,
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
                                    Container(width: 60, child: Text('Temp.')),
                                    Container(
                                      width: 120,
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
                      child: const Text(
                        'Dangerous',
                        style: TextStyle(color: Colors.red),
                      ),
                    ),
                    const SizedBox(width: 10),
                    SizedBox(
                      height: 50,
                      width: 50,
                      child: Checkbox(
                        value: createBookingController.boolContDangerous.value,
                        onChanged: (newValue) {
                          // setState(() {
                          createBookingController.boolContDangerous.value =
                              !createBookingController.boolContDangerous.value;
                          // });
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
          SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                  margin: EdgeInsets.only(left: 50),
                  width: 90,
                  child: Text('Note Request')),
              // SizedBox(width: 20),
              Container(
                width: 760,
                child: TextField(
                  controller: createBookingController.inputNoteRequest.value,
                  decoration: InputDecoration(border: OutlineInputBorder()),
                ),
              )
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                margin: EdgeInsets.only(top: 10, right: 50),
                child: Row(
                  children: [
                    createBookingController.boolErrorAdd.value == true
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
                            //miss field input
                            createBookingController.boolErrorAdd.value = true;
                          } else {
                            //accept add cont
                            createBookingController.boolErrorAdd.value = false;
                            //accept send request
                            createBookingController
                                .boolErrorBookingRequest.value = false;
                            //count row cont
                            createBookingController.countRowContainer.value =
                                createBookingController
                                        .countRowContainer.value +
                                    1;
                            if (createBookingController
                                    .currentStatusContainer.value ==
                                'E') {
                              createBookingController.inputWeight.value.clear();
                              createBookingController.inputTemp.value.clear();
                            }
                            if (createBookingController
                                    .currentTypeContainer.value ==
                                'DRY') {
                              createBookingController.inputTemp.value.clear();
                            }
                            if (createBookingController
                                    .boolContDangerous.value ==
                                false) {
                              createBookingController.inputDGunNo.value.clear();
                              createBookingController.inputDGClass.value
                                  .clear();
                            }
                            switch (
                                '${createBookingController.currentSizeContainer.value}-${createBookingController.currentTypeContainer.value}') {
                              case '20-DRY':
                                createBookingController
                                    .realSizeContainer.value = '20DC';
                              case '40-DRY':
                                createBookingController
                                    .realSizeContainer.value = '40HC';
                              case '45-DRY':
                                createBookingController
                                    .realSizeContainer.value = '45HC';
                              case '53-DRY':
                                createBookingController
                                    .realSizeContainer.value = '53HC';
                              case '20-REEFER':
                                createBookingController
                                    .realSizeContainer.value = '20RF';
                              case '40-REEFER':
                                createBookingController
                                    .realSizeContainer.value = '40RF';
                              case '45-REEFER':
                                createBookingController
                                    .realSizeContainer.value = '45RF';
                              case '53-REEFER':
                                createBookingController
                                    .realSizeContainer.value = '53RF';
                              default:
                                createBookingController
                                    .realSizeContainer.value = 'unknown';
                            }
                            Volumes _listInfoContainer = Volumes(
                                commodityConts: createBookingController
                                    .inputCommodity.value.text,
                                sizeConts: createBookingController
                                    .realSizeContainer.value,
                                statusConts: createBookingController
                                    .currentStatusContainer.value,
                                volumeConts: createBookingController
                                    .inputVolume.value.text,
                                weightConts: createBookingController
                                    .inputWeight.value.text,
                                temperatureConts: createBookingController
                                    .inputTemp.value.text,
                                dg: createBookingController
                                    .boolContDangerous.value
                                    .toString(),
                                dgUnNo: createBookingController
                                    .inputDGunNo.value.text,
                                dgClass: createBookingController
                                    .inputDGClass.value.text);
                            // add info cont to list
                            createBookingController.listInfoContainer
                                .add(_listInfoContainer);
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
