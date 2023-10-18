import 'package:flutter/material.dart';
import 'package:web_booking/constants/text.dart';
import 'package:web_booking/constants/variable.dart';
import 'package:web_booking/model/tracking/model_voyage.dart';
import 'package:web_booking/page/booking/widgets/list_depo.dart';

class ListVoyage extends StatefulWidget {
  const ListVoyage({super.key});

  @override
  State<ListVoyage> createState() => _ListVoyageState();
}

class _ListVoyageState extends State<ListVoyage> {
  @override
  Widget build(BuildContext context) {
    return buildVoyage();
  }
  
  FutureBuilder<Voyage> buildVoyage() {
    return FutureBuilder<Voyage>(
        future: fetchVoyage,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const CircularProgressIndicator();
          } else if (snapshot.hasError) {
            return Text('Error: ${snapshot.error}');
          } else if (snapshot.hasData) {
            return SizedBox(
              height: 700,
              width: 900,
              child: ListView.builder(
                  itemCount: snapshot.data!.listBookingVoys?.length,
                  itemBuilder: (context, index) {
                    var dataVoyage = snapshot.data!.listBookingVoys?[index];
                    nameVoyage = dataVoyage?.voyId;
                    dateVoyage = dataVoyage?.etd;
                    idVoyage = dataVoyage?.voyDetail;
                    // bool? isVi$index;
                    // if (isVi$index == null) {
                    //   isVi$index = false;
                    // } else {
                    //   isVi$index = isVi$index;
                    // }
                    return Card(
                      elevation: 0,
                      child: Padding(
                        padding: const EdgeInsets.only(top: 8),
                        child: Container(
                          decoration: BoxDecoration(
                              border: Border.all(),
                              borderRadius: BorderRadius.circular(10)),
                          child: InkWell(
                            onTap: () {
                              ListDepo(context);
                              // setState(() {
                              //   isVi$index = !isVi$index!;
                              // });
                              // print(isVisible);
                            },
                            child: Row(
                              children: [
                                const SizedBox(
                                  height: 100,
                                  width: 20,
                                ),
                                Container(
                                  width: 500,
                                  alignment: Alignment.bottomLeft,
                                  child: Text(
                                    nameVoyage.toString(),
                                    style: text_style2,
                                  ),
                                ),
                                Container(
                                  width: 300,
                                  alignment: Alignment.bottomRight,
                                  child: Text(
                                    dateVoyage.toString().substring(8, 10)+'/'
                                    + dateVoyage.toString().substring(5, 7)+'/'
                                    + dateVoyage.toString().substring(0, 4),
                                    style: text_style2,
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
          return const Text('');
        });
  }  
}