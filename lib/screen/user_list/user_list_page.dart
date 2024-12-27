// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:web_booking/constants/color.dart';
// import 'package:web_booking/constants/global.dart';
// import 'package:web_booking/constants/style.dart';
// import 'package:web_booking/constants/variable.dart';
// import 'package:web_booking/controllers/sidebar_controller.dart';
// import 'package:web_booking/model/list_user/model_user.dart';
// import 'package:web_booking/model/list_user/storage_controller/user_controller.dart';
// import 'package:web_booking/screen/user_list/data/data_user_list.dart';

// // ignore: must_be_immutable
// class UserListPage extends StatefulWidget {
//   @override
//   State<UserListPage> createState() => _UserListPageState();
// }

// class _UserListPageState extends State<UserListPage> {
//   DataTableUser _dataUser = DataTableUser(data: []);

//   @override
//   void initState() {
//     super.initState();
//     UserList().fetchUserList().then((data) {
//       setState(() {
//         _dataUser = DataTableUser(data: data);
//         // print('initial data user');
//       });
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return SizedBox(
//       // use sizedbox to content always start on top
//       height: deviceHeight(context),
//       child: SingleChildScrollView(
//         scrollDirection: Axis.vertical,
//         child: Padding(
//           padding: const EdgeInsets.all(32.0),
//           child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               mainAxisAlignment: MainAxisAlignment.start,
//               children: <Widget>[
//                 Container(
//                   width: deviceWidth(context),
//                   alignment: Alignment.center,
//                   child: Text(
//                     "title user list".tr,
//                     style: style_title_page,
//                   ),
//                 ),
//                 ElevatedButton(
//                     style: ElevatedButton.styleFrom(
//                         backgroundColor: haian,
//                         shape: const RoundedRectangleBorder(
//                             borderRadius:
//                                 BorderRadius.all(Radius.circular(10)))),
//                     onPressed: () {
//                       // id_user = 0;
//                       // maNV_user = '';
//                       // tenNv_user = '';
//                       // dienthoai_user = '';
//                       // email_user = '';
//                       // author_user = '';
//                       // codeValue = '';
//                       userController.updateUserController(
//                           id: 0.obs,
//                           maNv: ''.obs,
//                           tenNv: ''.obs,
//                           dienThoai: ''.obs,
//                           email: ''.obs,
//                           code: ''.obs,
//                           author: ''.obs);

//                       title_user = 'create user'.tr;
//                       text_button_CUD = 'save'.tr;
//                       URL_USER = '$SERVER/User/Create';
//                       color_button_CUD = haian;
//                       CUD = 1;
//                       // sideBarController.index.value = 16;
//                       // controller.changeWidget(SideBarController.cudUser);
//                       controller.selectWidget.value = cudUser;
//                     },
//                     child: Container(
//                       padding:
//                           EdgeInsets.symmetric(horizontal: 15, vertical: 10),
//                       child: Text('create'.tr, style: style_text_box_button),
//                     )),
//                 Container(
//                   width: deviceWidth(context),
//                   decoration: BoxDecoration(
//                     color: white,
//                     border: Border.all(color: blue.withOpacity(.4), width: .5),
//                     boxShadow: [
//                       BoxShadow(
//                           offset: const Offset(0, 6),
//                           color: blue.withOpacity(.1),
//                           blurRadius: 12)
//                     ],
//                     borderRadius: BorderRadius.circular(8),
//                   ),
//                   margin: const EdgeInsets.symmetric(vertical: 16),
//                   child: PaginatedDataTable(
//                       // headingRowColor:
//                       //     MaterialStateColor.resolveWith((states) => lightGrey),
//                       sortColumnIndex: 0,
//                       // sortAscending: true,
//                       columnSpacing: 20,
//                       columns: [
//                         DataColumn(
//                           label: SizedBox(
//                             width: 40,
//                             child: Text(
//                               'seq'.tr,
//                               textAlign: TextAlign.center,
//                               style: style_text_Table_small_bold,
//                             ),
//                           ),
//                         ),
//                         DataColumn(
//                           label: Expanded(
//                             child: Text(
//                               'user code'.tr,
//                               style: style_text_Table_small_bold,
//                             ),
//                           ),
//                         ),
//                         DataColumn(
//                           label: Expanded(
//                             child: Text('user name'.tr,
//                                 style: style_text_Table_small_bold),
//                           ),
//                         ),
//                         DataColumn(
//                           label: Expanded(
//                             child: Text(
//                               'customer code'.tr,
//                               style: style_text_Table_small_bold,
//                             ),
//                           ),
//                         ),
//                         DataColumn(
//                           label: Expanded(
//                             child: Text(
//                               'email'.tr,
//                               style: style_text_Table_small_bold,
//                             ),
//                           ),
//                         ),
//                         DataColumn(
//                           label: Expanded(
//                             child: Text(
//                               'tel no'.tr,
//                               style: style_text_Table_small_bold,
//                             ),
//                           ),
//                         ),
//                         DataColumn(
//                           label: Expanded(
//                             child: Text(
//                               'updateTime'.tr,
//                               style: style_text_Table_small_bold,
//                             ),
//                           ),
//                         ),
//                         DataColumn(
//                           label: Expanded(
//                             child: Center(
//                               child: Center(
//                                   child: Text('###',
//                                       style: style_text_Table_small_bold)),
//                             ),
//                           ),
//                         ),
//                       ],
//                       source: _dataUser),
//                 ),
//               ]),
//         ),
//       ),
//     );
//   }
// }
