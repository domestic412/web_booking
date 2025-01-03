// import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:web_booking/constants/variable.dart';
import 'package:web_booking/model/tracking/model_tracking.dart';
import 'package:web_booking/screen/tracking1/data%20bk/data_table_tracking_container.dart';
import 'package:web_booking/screen/tracking1/data%20bk/header_table_tracking_container.dart';
import 'package:web_booking/screen/tracking1/data%20container/data_table_tracking_zim.dart';
import 'package:web_booking/screen/tracking1/data%20container/header_table_tracking_zim.dart';
import 'package:web_booking/screen/tracking1/widgets/container_details1.dart';

// ignore: must_be_immutable
class ListContainer1 extends StatelessWidget {
  ListContainer1(this.inputTracking1);
  String? inputTracking1;

  late List<TrackingZims> _data_cntr;

  late DataTrackingContainerSource _dataTrackingContainerSource;

  @override
  Widget build(BuildContext context) {
    return dataBooking();
  }

  FutureBuilder<ContainerTracking> dataBooking() {
    return FutureBuilder<ContainerTracking>(
      future: containerTracking,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        } else if (snapshot.hasData) {
          var data_bk = snapshot.data!.trackingContainers;
          var data_cntr_en = snapshot.data!.trackingZimsEN;
          var data_cntr_vn = snapshot.data!.trackingZimsVN;
          if (data_bk.toString() != [].toString()) {
            _dataTrackingContainerSource = DataTrackingContainerSource(
                data_bk!, context, data_cntr_en!, data_cntr_vn!);
            return Expanded(
                child: TableTrackingContainer(_dataTrackingContainerSource));
          } else {
            if (data_cntr_en.toString() != [].toString()) {
              bool_lang == false
                  ? _data_cntr = data_cntr_en!
                  : _data_cntr = data_cntr_vn!;
              DataTrackingZimSource _dataTrackingZimSource =
                  DataTrackingZimSource(_data_cntr, context);
              // if (bool_lang == false) {
              //   list_filter = data_cntr_en!
              //       .where((item) => item.container!.contains(cntr_no!))
              //       .toList();
              // } else {
              //   list_filter = data_cntr_vn!
              //       .where((item) => item.container!.contains(cntr_no!))
              //       .toList();
              // }
              return TableTrackingZim(_dataTrackingZimSource);
            } else {
              return const Center(
                child: Text('Not found data!'),
              );
            }
          }
        }
        return const SizedBox();
      },
    );
  }
}
