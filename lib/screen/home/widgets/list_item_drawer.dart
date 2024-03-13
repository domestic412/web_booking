import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:web_booking/constants/color.dart';
import 'package:web_booking/controllers/sidebar_controller.dart';
import 'package:web_booking/page/signin/controller_signin.dart/info_signin_controller.dart';

class DrawItems extends StatefulWidget {
  const DrawItems({super.key});

  @override
  State<DrawItems> createState() => _DrawItemsState();
}

class _DrawItemsState extends State<DrawItems> {
  bool _bool_dropdown_management = false;
  bool _bool_dropdown_services = false;
  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.all(20),
        child: Obx(
          () => Wrap(
            runSpacing: 10,
            children: [
              inforUserController.author.value == 'admin'
                  ? ExpansionTile(
                      title: Text('Management', style: TextStyle(color: white)),
                      leading: Icon(
                        (Icons.supervised_user_circle_sharp),
                        color: white,
                      ),
                      initiallyExpanded: true,
                      trailing: Icon(
                        _bool_dropdown_management
                            ? Icons.arrow_drop_up
                            : Icons.arrow_drop_down,
                        color: _bool_dropdown_management ? blue : white,
                      ),
                      children: [
                        ListTile(
                            title: Text('User List',
                                style: TextStyle(color: white)),
                            onTap: () {
                              // Get.toNamed(GetRoutes.UserList);
                              controller.selectWidget.value = userList;
                            }),
                        ListTile(
                            title: Text('Release Booking List',
                                style: TextStyle(color: white)),
                            onTap: () {
                              // Get.toNamed(GetRoutes.ApprovalList);
                              controller.selectWidget.value =
                                  releaseBookingList;
                            }),
                        ListTile(
                            title: Text('Approval List',
                                style: TextStyle(color: white)),
                            onTap: () {
                              // Get.toNamed(GetRoutes.ApprovalList);
                              controller.selectWidget.value = approvalList;
                            }),
                        ListTile(
                            title: Text('Quality List',
                                style: TextStyle(color: white)),
                            onTap: () {
                              // Get.toNamed(GetRoutes.QualityList);
                              controller.selectWidget.value = qualityList;
                            }),
                        ListTile(
                            title: Text('Special Policy List',
                                style: TextStyle(color: white)),
                            onTap: () {
                              // Get.toNamed(GetRoutes.SpecialPolicyList);
                              controller.selectWidget.value = specialPolicyList;
                            }),
                        ListTile(
                            title: Text('History List',
                                style: TextStyle(color: white)),
                            onTap: () {
                              // Get.toNamed(GetRoutes.HistoryList);
                              controller.selectWidget.value = historyList;
                            }),
                        ListTile(
                            title: Text('Container Stock',
                                style: TextStyle(color: white)),
                            onTap: () {
                              // Get.toNamed(GetRoutes.ContainerStock);
                              controller.selectWidget.value = containerStock;
                            })
                      ],
                      onExpansionChanged: (bool expanded) {
                        setState(() {
                          _bool_dropdown_management = expanded;
                        });
                      },
                    )
                  : const SizedBox(),
              ExpansionTile(
                  leading: Icon(
                    (Icons.window),
                    color: white,
                  ),
                  title: Text(
                    'Services',
                    style: TextStyle(color: white),
                  ),
                  trailing: Icon(
                    _bool_dropdown_services
                        ? Icons.arrow_drop_up
                        : Icons.arrow_drop_down,
                    color: _bool_dropdown_services ? blue : white,
                  ),
                  initiallyExpanded: inforUserController.author.value == 'admin'
                      ? false
                      : true,
                  onExpansionChanged: (bool expanded) {
                    setState(() {
                      _bool_dropdown_services = expanded;
                    });
                  },
                  children: [
                    ListTile(
                        title: Text('Booking Request List',
                            style: TextStyle(color: white)),
                        onTap: () {
                          // Get.toNamed(GetRoutes.RequestList);
                          controller.selectWidget.value = bookingRequestList;
                        }),
                    ListTile(
                        title: Text('Request List',
                            style: TextStyle(color: white)),
                        onTap: () {
                          // Get.toNamed(GetRoutes.RequestList);
                          controller.selectWidget.value = requestList;
                        }),
                    ListTile(
                        title: Text('Send Request',
                            style: TextStyle(color: white)),
                        onTap: () {
                          // Get.toNamed(GetRoutes.SendRequest);
                          controller.selectWidget.value = sendRequest;
                        }),
                    ListTile(
                        title: Text('Checking Combine',
                            style: TextStyle(color: white)),
                        onTap: () {
                          // Get.toNamed(GetRoutes.CheckingCombine);
                          controller.selectWidget.value = checkingCombine;
                        }),
                    ListTile(
                        title: Text('Tracking Container',
                            style: TextStyle(color: white)),
                        onTap: () {
                          // Get.toNamed(GetRoutes.Tracking1);
                          controller.selectWidget.value = tracking1;
                        }),
                  ]),
            ],
          ),
        ));
  }
}
