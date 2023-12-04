import 'package:flutter/material.dart';
import 'package:web_booking/constants/color.dart';
import 'package:web_booking/constants/variable.dart';
// import 'package:easy_localization/easy_localization.dart';
import 'package:web_booking/model/schedule/model_voyage.dart';

class SelectDepoSize extends StatefulWidget {
  const SelectDepoSize({super.key});

  @override
  State<SelectDepoSize> createState() => _SelectDepoSizeState();
}

class _SelectDepoSizeState extends State<SelectDepoSize> {
  TextEditingController _input_depo = TextEditingController();
  TextEditingController _input_size = TextEditingController();
  TextEditingController _input_quanlity = TextEditingController();
  TextEditingController _input_size2 = TextEditingController();
  TextEditingController _input_quanlity2 = TextEditingController();
  TextEditingController _input_size3 = TextEditingController();
  TextEditingController _input_quanlity3 = TextEditingController();
  TextEditingController _input_size4 = TextEditingController();
  TextEditingController _input_quanlity4 = TextEditingController();
  Depots? selectDepo;
  String? idDepo1;
  Depots? selectSize;
  String? sizeDepo;
  Depots? selectSize2;
  String? sizeDepo2;
  Depots? selectSize3;
  String? sizeDepo3;
  Depots? selectSize4;
  String? sizeDepo4;
  bool? addsize;
  Color? colorBoxSize;

  @override
  void initState() {
    super.initState();
    addsize = false;
    colorBoxSize = Colors.black12;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 1004,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          buildDepo(),
          SizedBox(
            width: 30,
          ),
          buildSize(),
          SizedBox(
            width: 30,
          ),
          addsize == false ? SizedBox() : buildSize2(),
          addSizeCont(),
          SizedBox(
            width: 30,
          )
        ],
      ),
    );
  }

  FutureBuilder<Voyage> buildDepo() {
    return FutureBuilder<Voyage>(
        future: fetchVoyage,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          }
          if (snapshot.hasData) {
            List<Depots>? listdepo = snapshot.data!.depots;
            final List<DropdownMenuEntry<Depots>> DepoEntries =
                <DropdownMenuEntry<Depots>>[];
            for (final depo in listdepo!) {
              //add phan tu tiep theo cho DepoEntries
              if (DepoEntries.length != 0) {
                // add value datalist when depotName duplicate with DepoEntries[label]
                List datalist = DepoEntries.where(
                    (item) => item.label.contains(depo.depotName!)).toList();
                // datalist != 0 when depotName duplicate DepoEntries[label]
                if (datalist.length != 0) {
                  // print('Label exist');
                } else {
                  // add element for DepoEntries when depotName != DepoEntries[label]
                  DepoEntries.add(
                    DropdownMenuEntry<Depots>(
                      value: depo,
                      label: depo.depotName!,
                    ),
                  );
                }
              } else {
                // add first element for DepoEntries
                DepoEntries.add(
                  DropdownMenuEntry<Depots>(
                    value: depo,
                    label: depo.depotName!,
                  ),
                );
              }
            }
            return Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                DropdownMenu<Depots>(
                  menuHeight: 500,
                  enableFilter: true,
                  enableSearch: true,
                  controller: _input_depo,
                  label: Text('Depot'),
                  dropdownMenuEntries: DepoEntries,
                  onSelected: (Depots? Depo) {
                    setState(() {
                      selectDepo = Depo;
                      idDepo1 = selectDepo?.depotId;
                      print('${selectDepo?.depotName}');
                      _input_size.clear();
                      _input_size2.clear();
                      _input_size3.clear();
                      _input_size4.clear();
                      _input_quanlity.clear();
                      _input_quanlity2.clear();
                      _input_quanlity3.clear();
                      _input_quanlity4.clear();
                    });
                  },
                ),
              ],
            );
          }
          return Text('Error');
        });
  }

  FutureBuilder<Voyage> buildSize() {
    return FutureBuilder<Voyage>(
        future: fetchVoyage,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          }
          if (snapshot.hasData) {
            List<Depots>? listdepo = snapshot.data!.depots;
            final List<DropdownMenuEntry<Depots>> SizeEntries =
                <DropdownMenuEntry<Depots>>[];
            for (final size in listdepo!) {
              //add phan tu tiep theo cho DepoEntries
              if (size.depotId == idDepo1) {
                SizeEntries.add(
                  DropdownMenuEntry<Depots>(
                    value: size,
                    label: size.size!,
                  ),
                );
              }
            }
            return Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  decoration: BoxDecoration(
                      border: Border.all(color: colorBoxSize!),
                      borderRadius: BorderRadius.circular(4)),
                  child: DropdownMenu<Depots>(
                    // menuHeight: 500,
                    width: 110,
                    enableFilter: true,
                    enableSearch: true,
                    controller: _input_size,
                    label: Text('Size'),
                    dropdownMenuEntries: SizeEntries,
                    onSelected: (Depots? Size) {
                      setState(() {
                        selectSize = Size;
                        sizeDepo = selectSize?.size;
                        // print('${selectSize?.size}');
                        if (_input_size.text == _input_size2.text) {
                          colorBoxSize = red;
                        } else {
                          colorBoxSize = Colors.black12;
                        }
                      });
                    },
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Container(
                  height: 50,
                  width: 110,
                  child: TextField(
                    controller: _input_quanlity,
                    decoration: const InputDecoration(
                        border: OutlineInputBorder(), label: Text('Quanlity')),
                  ),
                )
              ],
            );
          }
          return Text('Error');
        });
  }

  FutureBuilder<Voyage> buildSize2() {
    return FutureBuilder<Voyage>(
        future: fetchVoyage,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          }
          if (snapshot.hasData) {
            List<Depots>? listdepo = snapshot.data!.depots;
            final List<DropdownMenuEntry<Depots>> SizeEntries =
                <DropdownMenuEntry<Depots>>[];
            for (final size in listdepo!) {
              //add phan tu tiep theo cho DepoEntries
              if (size.depotId == idDepo1) {
                SizeEntries.add(
                  DropdownMenuEntry<Depots>(
                    value: size,
                    label: size.size!,
                  ),
                );
              }
            }
            return Row(children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    decoration: BoxDecoration(
                        border: Border.all(color: colorBoxSize!),
                        borderRadius: BorderRadius.circular(4)),
                    child: DropdownMenu<Depots>(
                      // menuHeight: 500,
                      enableFilter: true,
                      enableSearch: true,
                      controller: _input_size2,
                      label: Text('Size'),
                      dropdownMenuEntries: SizeEntries,
                      onSelected: (Depots? Size) {
                        setState(() {
                          selectSize2 = Size;
                          sizeDepo2 = selectSize?.size;
                          // print('${selectSize?.size}');
                          if (_input_size.text == _input_size2.text) {
                            colorBoxSize = red;
                          } else {
                            colorBoxSize = Colors.black12;
                          }
                        });
                      },
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Container(
                    height: 50,
                    width: 110,
                    child: TextField(
                      controller: _input_quanlity2,
                      decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          label: Text('Quanlity')),
                    ),
                  )
                ],
              ),
              SizedBox(
                width: 30,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    decoration: BoxDecoration(
                        border: Border.all(color: colorBoxSize!),
                        borderRadius: BorderRadius.circular(4)),
                    child: DropdownMenu<Depots>(
                      // menuHeight: 500,
                      enableFilter: true,
                      enableSearch: true,
                      controller: _input_size3,
                      label: Text('Size'),
                      dropdownMenuEntries: SizeEntries,
                      onSelected: (Depots? Size) {
                        setState(() {
                          selectSize3 = Size;
                          sizeDepo3 = selectSize?.size;
                          // print('${selectSize?.size}');
                          if (_input_size.text == _input_size3.text) {
                            colorBoxSize = red;
                          } else {
                            colorBoxSize = Colors.black12;
                          }
                        });
                      },
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Container(
                    height: 50,
                    width: 110,
                    child: TextField(
                      controller: _input_quanlity3,
                      decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          label: Text('Quanlity')),
                    ),
                  ),
                ],
              ),
              SizedBox(
                width: 30,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    decoration: BoxDecoration(
                        border: Border.all(color: colorBoxSize!),
                        borderRadius: BorderRadius.circular(4)),
                    child: DropdownMenu<Depots>(
                      // menuHeight: 500,
                      enableFilter: true,
                      enableSearch: true,
                      controller: _input_size4,
                      label: Text('Size'),
                      dropdownMenuEntries: SizeEntries,
                      onSelected: (Depots? Size) {
                        setState(() {
                          selectSize4 = Size;
                          sizeDepo4 = selectSize?.size;
                          // print('${selectSize?.size}');
                          if (_input_size.text == _input_size4.text) {
                            colorBoxSize = red;
                          } else {
                            colorBoxSize = Colors.black12;
                          }
                        });
                      },
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Container(
                    height: 50,
                    width: 110,
                    child: TextField(
                      controller: _input_quanlity4,
                      decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          label: Text('Quanlity')),
                    ),
                  )
                ],
              ),
            ]);
          }
          return Text('Error');
        });
  }

  addSizeCont() {
    return InkWell(
      onTap: () {
        setState(() {
          addsize = !addsize!;
          if (addsize == false) {
            _input_size2.clear();
            _input_quanlity2.clear();
          }
        });
      },
      child: addsize == false
          ? Icon(
              Icons.add_circle_sharp,
              color: Colors.green,
              size: 50,
            )
          : Icon(
              Icons.remove_circle,
              color: red,
              size: 50,
            ),
    );
  }
}
