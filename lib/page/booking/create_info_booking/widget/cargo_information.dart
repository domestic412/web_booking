import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:web_booking/constants/variable.dart';
import 'package:web_booking/model/booking/model_create_booking.dart';
import 'package:web_booking/model/booking/storage_controller/create_booking_controller.dart';
import 'package:web_booking/model/new_login/model_newlogin.dart';

class CargoInformation extends StatefulWidget {
  const CargoInformation({
    super.key,
  });

  @override
  State<CargoInformation> createState() => _CargoInformationState();
}

class _CargoInformationState extends State<CargoInformation> {
  DataTable5s? selectCommodity;

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
              SizedBox(width: 20),
              // Container(
              //   width: 760,
              //   child: TextField(
              //     controller: createBookingController.inputCommodity.value,
              //     decoration: InputDecoration(border: OutlineInputBorder()),
              //   ),
              // )
              DropdownMenu<DataTable5s>(
                  menuHeight: 500,
                  controller: createBookingController.commodity_controller.value,
                  enableFilter: true,
                  enableSearch: true,
                  label: Text('commodity'.tr),
                  dropdownMenuEntries: box.read(commodityList_signin),
                  onSelected: (DataTable5s? commodity) {
                    // setState(() {
                      selectCommodity = commodity;
                      createBookingController.commodityId.value = selectCommodity?.commodityId ?? '';
                    // });
                  },
                ),
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
                        width: 60,
                        initialSelection:
                            createBookingController.sizeId.value,
                        onSelected: (String? value) {
                          createBookingController.sizeId.value =
                              value!;
                        },
                        dropdownMenuEntries: createBookingController
                            .listSizeContainer
                            .map<DropdownMenuEntry<String>>((String value) {
                          return DropdownMenuEntry<String>(
                              value: value, label: value);
                        }).toList(),
                      ),
                      DropdownMenu<String>(
                        width: 60,
                        initialSelection:
                            createBookingController.type.value,
                        onSelected: (String? value) {
                          createBookingController.type.value =
                              value!;
                        },
                        dropdownMenuEntries: createBookingController
                            .listType
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
                          switch (createBookingController.currentTypeContainer.value) {
                            case 'DRY':
                              createBookingController.reefer.value = false;
                              break;
                            case  'REEFER':
                              createBookingController.reefer.value = true;
                              break;
                            default:
                              break;
                          }
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
                            .status.value,
                        onSelected: (String? value) {
                          createBookingController.status.value =
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
                          controller: createBookingController.volume_controller.value,
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
              createBookingController.status.value == 'F'
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
                                        .weight_controller.value,
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
                        createBookingController.reefer.value ==
                                true
                            ? Container(
                                width: 200,
                                child: Row(
                                  children: [
                                    Container(width: 60, child: Text('Temp.')),
                                    Container(
                                      width: 120,
                                      child: TextField(
                                        controller: createBookingController
                                            .temp_controller.value,
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
                        value: createBookingController.dg.value,
                        onChanged: (value) {
                          // setState(() {
                          createBookingController.dg.value =
                              !createBookingController.dg.value;
                          // });
                        },
                      ),
                    ),
                  ],
                ),
              ),
              createBookingController.dg.value == false
                  ? SizedBox.shrink()
                  : Row(
                      children: [
                        Container(
                            margin: EdgeInsets.only(left: 10),
                            width: 70,
                            // child: Text('UnNo')),
                            child: Text('DG Remark')),
                        Container(
                          // width: 120,
                          width: 300,
                          child: TextField(
                            controller:
                                createBookingController.dgRemark_controller.value,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(),
                            ),
                          ),
                        ),
                        // Container(
                        //     margin: EdgeInsets.only(left: 30),
                        //     width: 60,
                        //     child: Text('Class')),
                        // Container(
                        //   width: 120,
                        //   child: TextField(
                        //     controller:
                        //         createBookingController.inputDGClass.value,
                        //     decoration: InputDecoration(
                        //       border: OutlineInputBorder(),
                        //     ),
                        //   ),
                        // ),
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
                  controller: createBookingController.remark.value,
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
                                          .dg.value ==
                                      true &&
                                  // createBookingController.inputDGunNo.value.text
                                  //         .trim() ==
                                  //     '' 
                                  //     &&
                                  // createBookingController
                                  //         .inputDGClass.value.text
                                  //         .trim() ==
                                  //     ''
                                  createBookingController.dgRemark_controller.value.text
                                          .trim() ==
                                      '' 
                                      ) 
                                      ||
                              (createBookingController
                                          .status.value ==
                                      'F' &&
                                  createBookingController.weight_controller.value.text
                                          .trim() ==
                                      '') ||
                              (createBookingController
                                          .status.value ==
                                      'F' &&
                                  createBookingController
                                          .reefer.value ==
                                      true &&
                                  createBookingController.temp_controller.value.text
                                          .trim() ==
                                      '') ||
                              (createBookingController.commodity_controller.value.text
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
                                    .status.value ==
                                'E') {
                              createBookingController.weight_controller.value.clear();
                              createBookingController.temp_controller.value.clear();
                            }
                            if (createBookingController
                                    .reefer.value ==
                                false) {
                              createBookingController.temp_controller.value.clear();
                            }
                            if (createBookingController
                                    .dg.value ==
                                false) {
                              // createBookingController.inputDGunNo.value.clear();
                              // createBookingController.inputDGClass.value
                              //     .clear();
                              createBookingController.dgRemark_controller.value.clear();
                            }
                            BookingDetails _listBookingDetails = BookingDetails(
                                commodityId: createBookingController
                                    .commodity_controller.value.text,
                                sizeId: createBookingController
                                    .sizeId.value,
                                type: createBookingController
                                    .type.value,
                                volume: int.parse(createBookingController
                                    .volume_controller.value.text),
                                status: createBookingController
                                    .status.value,
                                weight: int.parse(createBookingController
                                    .weight_controller.value.text),
                                edit: 'I',);
                            // add info cont to list
                            createBookingController.listInfoContainer
                                .add(_listBookingDetails);
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
