import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:web_booking/constants/color.dart';
import 'package:web_booking/constants/variable.dart';
import 'package:web_booking/model/booking/model_create_booking.dart';
import 'package:web_booking/model/booking/storage_controller/create_booking_controller.dart';
import 'package:web_booking/model/new_login/model_newlogin.dart';

import 'checkPrice.dart';

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
    final List<DropdownMenuEntry<DataTable5s>> commodityEntries =
        <DropdownMenuEntry<DataTable5s>>[];
    List listCommodity = box
        .read(commodityList_signin)
        .map((e) => DataTable5s.fromJson(e))
        .toList();
    ;
    for (final commodity in listCommodity) {
      commodityEntries.add(
        DropdownMenuEntry<DataTable5s>(
          value: commodity,
          label: commodity.commodityName,
        ),
      );
    }
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
              DropdownMenu<DataTable5s>(
                width: 700,
                controller: createBookingController.commodity_controller.value,
                // enableFilter: true,
                // enableSearch: true,
                label: Text('Commodity'.tr),
                dropdownMenuEntries: commodityEntries,
                onSelected: (DataTable5s? commodity) {
                  // setState(() {
                  selectCommodity = commodity;
                  createBookingController.commodityId.value =
                      selectCommodity?.commodityId ?? '';
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
                  width: 400,
                  child: Row(
                    children: [
                      Container(
                          margin: EdgeInsets.only(left: 50),
                          width: 90,
                          child: Text('Size')),
                      DropdownMenu<String>(
                        width: 110,
                        initialSelection: createBookingController.size.value,
                        onSelected: (String? value) {
                          createBookingController.size.value = value!;
                          createBookingController.checkPrice.value =
                              checkPrice();
                        },
                        dropdownMenuEntries: createBookingController
                            .listSizeContainer
                            .map<DropdownMenuEntry<String>>((String value) {
                          return DropdownMenuEntry<String>(
                              value: value, label: value);
                        }).toList(),
                      ),
                      DropdownMenu<String>(
                        width: 110,
                        initialSelection: createBookingController.type.value,
                        onSelected: (String? value) {
                          createBookingController.type.value = value!;
                          createBookingController.checkPrice.value =
                              checkPrice();
                        },
                        dropdownMenuEntries: createBookingController.listType
                            .map<DropdownMenuEntry<String>>((String value) {
                          return DropdownMenuEntry<String>(
                              value: value, label: value);
                        }).toList(),
                      ),
                    ],
                  )),
              Container(
                  width: 230,
                  margin: EdgeInsets.only(left: 10),
                  child: Row(
                    children: [
                      Container(
                          margin: EdgeInsets.only(left: 10),
                          width: 70,
                          child: Text('Type')),
                      DropdownMenu<String>(
                        width: 120,
                        label: Text('Type'.tr),
                        initialSelection:
                            createBookingController.currentTypeContainer.value,
                        onSelected: (String? value) {
                          createBookingController.currentTypeContainer.value =
                              value!;
                          switch (createBookingController
                              .currentTypeContainer.value) {
                            case 'DRY':
                              createBookingController.reefer.value = false;
                              break;
                            case 'REEFER':
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
                  margin: EdgeInsets.only(left: 20),
                  child: Row(
                    children: [
                      Text('Status'),
                      SizedBox(
                        width: 20,
                      ),
                      DropdownMenu<String>(
                        width: 120,
                        label: Text('Status'.tr),
                        initialSelection: createBookingController.status.value,
                        onSelected: (String? value) {
                          createBookingController.status.value = value!;
                          createBookingController.checkPrice.value =
                              checkPrice();
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
          createBookingController.checkPrice.value != 0
              ? Container(
                  alignment: Alignment.bottomLeft,
                  margin: EdgeInsets.symmetric(vertical: 10, horizontal: 140),
                  child: Text(
                    'Ocean Freight: ' +
                        createBookingController.checkPrice.value.toString() +
                        ' VND/Container',
                    style: TextStyle(color: red),
                  ),
                )
              : SizedBox(
                  height: 20,
                ),
          // SizedBox(
          //   height: 10,
          // ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                  width: 400,
                  child: Row(
                    children: [
                      Container(
                          margin: EdgeInsets.only(left: 50),
                          width: 90,
                          child: Text('Volume')),
                      Container(
                        width: 220,
                        child: TextFormField(
                          controller:
                              createBookingController.volume_controller.value,
                          inputFormatters: [
                            FilteringTextInputFormatter.digitsOnly
                          ],
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: 'Volume',
                            labelStyle: TextStyle(fontSize: 14),
                          ),
                        ),
                      ),
                    ],
                  )),
              createBookingController.status.value == 'F'
                  ? Row(
                      children: [
                        Container(
                            width: 230,
                            margin: EdgeInsets.only(left: 10),
                            child: Row(
                              children: [
                                Container(
                                    margin: EdgeInsets.only(left: 10),
                                    width: 70,
                                    child: Text('Weight')),
                                Container(
                                  width: 120,
                                  child: TextFormField(
                                    controller: createBookingController
                                        .weight_controller.value,
                                    inputFormatters: [
                                      FilteringTextInputFormatter.digitsOnly
                                    ],
                                    decoration: InputDecoration(
                                      border: OutlineInputBorder(),
                                      labelText: 'Weight (KG)',
                                      labelStyle: TextStyle(fontSize: 14),
                                    ),
                                  ),
                                )
                              ],
                            )),
                        createBookingController.reefer.value == true
                            ? Container(
                                width: 200,
                                child: Row(
                                  children: [
                                    Container(width: 60, child: Text('Temp.')),
                                    Container(
                                      width: 120,
                                      child: TextFormField(
                                        controller: createBookingController
                                            .temp_controller.value,
                                        decoration: InputDecoration(
                                          border: OutlineInputBorder(),
                                          labelText: 'Temp.',
                                          labelStyle: TextStyle(fontSize: 14),
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
                width: 200,
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
                            width: 70,
                            // child: Text('UnNo')),
                            child: Text('DG Remark')),
                        SizedBox(
                          width: 10,
                        ),
                        Container(
                          // width: 120,
                          width: 560,
                          child: TextFormField(
                            controller: createBookingController
                                .dgRemark_controller.value,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              labelText: 'DG Remark',
                              labelStyle: TextStyle(fontSize: 14),
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
                  margin: EdgeInsets.only(left: 30),
                  width: 110,
                  child: Text('Special Request')),
              // SizedBox(width: 20),
              Container(
                width: 700,
                child: TextFormField(
                  controller: createBookingController.remark.value,
                  maxLines: 10,
                  minLines: 1,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Special Request',
                    labelStyle: TextStyle(fontSize: 14),
                  ),
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
                          if ((createBookingController.dg.value == true &&
                                  // createBookingController.inputDGunNo.value.text
                                  //         .trim() ==
                                  //     ''
                                  //     &&
                                  // createBookingController
                                  //         .inputDGClass.value.text
                                  //         .trim() ==
                                  //     ''
                                  createBookingController
                                          .dgRemark_controller.value.text
                                          .trim() ==
                                      '') ||
                              (createBookingController.status.value == 'F' &&
                                  createBookingController
                                          .weight_controller.value.text
                                          .trim() ==
                                      '') ||
                              (createBookingController.status.value == 'F' &&
                                  createBookingController.reefer.value ==
                                      true &&
                                  createBookingController
                                          .temp_controller.value.text
                                          .trim() ==
                                      '') ||
                              (createBookingController
                                      .commodity_controller.value.text
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
                            if (createBookingController.status.value == 'E') {
                              createBookingController.weight_controller.value
                                  .clear();
                              createBookingController.temp_controller.value
                                  .clear();
                            }
                            if (createBookingController.reefer.value == false) {
                              createBookingController.temp_controller.value
                                  .clear();
                            }
                            if (createBookingController.dg.value == false) {
                              // createBookingController.inputDGunNo.value.clear();
                              // createBookingController.inputDGClass.value
                              //     .clear();
                              createBookingController.dgRemark_controller.value
                                  .clear();
                            }
                            if (createBookingController
                                    .weight_controller.value.text ==
                                '') {
                              createBookingController
                                  .weight_controller.value.text = '0';
                            }
                            BookingDetails _listBookingDetails = BookingDetails(
                              commodityId:
                                  createBookingController.commodityId.value,
                              sizeId: createBookingController.size.value,
                              type: createBookingController.type.value,
                              volume: int.parse(createBookingController
                                  .volume_controller.value.text),
                              status: createBookingController.status.value,
                              weight: int.parse(createBookingController
                                  .weight_controller.value.text),
                              edit: 'I',
                            );
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
