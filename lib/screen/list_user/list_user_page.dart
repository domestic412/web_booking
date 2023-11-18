import 'package:flutter/material.dart';
import 'package:web_booking/constants/color.dart';
import 'package:web_booking/constants/global.dart';
import 'package:web_booking/constants/style.dart';
import 'package:web_booking/constants/variable.dart';
import 'package:intl/intl.dart';
import 'package:web_booking/model/list_user/model_user.dart';
import 'package:web_booking/screen/home/homepage_screen.dart';

// ignore: must_be_immutable
class ListUserPage extends StatefulWidget {
  @override
  State<ListUserPage> createState() => _ListUserPageState();
}

class _ListUserPageState extends State<ListUserPage> {
  String? _dt;

  @override
  Widget build(BuildContext context) {
    return DataListUser();
  }

  FutureBuilder<List<ListUser>> DataListUser() {
    return FutureBuilder<List<ListUser>>(
      future: ListUser().fetchListUser(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator());
        }
        if (snapshot.hasData) {
          print('show data list User');
          return Container(
            // use sizedbox to content always start on top
            height: deviceHeight(context),
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Padding(
                padding: const EdgeInsets.all(32.0),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Container(
                        width: deviceWidth(context),
                        alignment: Alignment.center,
                        child: Text(
                          "List User",
                          style: style_title_page,
                        ),
                      ),
                      ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              backgroundColor: haian,
                              shape: const RoundedRectangleBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10)))),
                          onPressed: () {
                            id_user = 0;
                            maNV_user = '';
                            tenNv_user = '';
                            dienthoai_user = '';
                            email_user = '';
                            author_user = '';
                            codeValue = '';
                            title_user = 'Create User';
                            text_button_CUD = 'Lưu';
                            URL_USER = '$SERVER/User/Create';
                            color_button_CUD = haian;
                            CUD = 1;
                            sideBarController.index.value = 16;
                          },
                          child: Container(
                            padding: EdgeInsets.symmetric(
                                horizontal: 15, vertical: 10),
                            child: Text('Create', style: style_text_box_button),
                          )),
                      Container(
                        width: deviceWidth(context),
                        decoration: BoxDecoration(
                          color: white,
                          border: Border.all(
                              color: blue.withOpacity(.4), width: .5),
                          boxShadow: [
                            BoxShadow(
                                offset: const Offset(0, 6),
                                color: blue.withOpacity(.1),
                                blurRadius: 12)
                          ],
                          borderRadius: BorderRadius.circular(8),
                        ),
                        margin: const EdgeInsets.symmetric(vertical: 16),
                        child: DataTable(
                            border: const TableBorder(
                                verticalInside:
                                    BorderSide(color: Colors.black12)),
                            sortColumnIndex: 0,
                            // sortAscending: true,
                            columnSpacing: 20,
                            columns: [
                              DataColumn(
                                label: Expanded(
                                  child: Center(
                                    child: Text(
                                      'STT',
                                      textAlign: TextAlign.center,
                                      style: style_text_Table_small_bold,
                                    ),
                                  ),
                                ),
                              ),
                              DataColumn(
                                label: Expanded(
                                  child: Text(
                                    'Mã tài khoản',
                                    style: style_text_Table_small_bold,
                                  ),
                                ),
                              ),
                              DataColumn(
                                label: Expanded(
                                  child: Text('Tên tài khoản',
                                      style: style_text_Table_small_bold),
                                ),
                              ),
                              DataColumn(
                                label: Expanded(
                                  child: Text(
                                    'Mã code khách hàng',
                                    style: style_text_Table_small_bold,
                                  ),
                                ),
                              ),
                              DataColumn(
                                label: Expanded(
                                  child: Text(
                                    'Email',
                                    style: style_text_Table_small_bold,
                                  ),
                                ),
                              ),
                              DataColumn(
                                label: Expanded(
                                  child: Text(
                                    'Điện thoại',
                                    style: style_text_Table_small_bold,
                                  ),
                                ),
                              ),
                              DataColumn(
                                label: Expanded(
                                  child: Text(
                                    'Ngày cập nhật',
                                    style: style_text_Table_small_bold,
                                  ),
                                ),
                              ),
                              DataColumn(
                                label: Expanded(
                                  child: Center(
                                    child: Center(
                                        child: Text('###',
                                            style:
                                                style_text_Table_small_bold)),
                                  ),
                                ),
                              ),
                            ],
                            rows: List.generate(snapshot.data!.length, (index) {
                              var data = snapshot.data![index];
                              data.updatetime == null
                                  ? _dt = ''
                                  : _dt = DateFormat("dd-MM-yyyy  hh:mm a")
                                      .format(DateTime.parse(data.updatetime!));
                              return DataRow(cells: [
                                DataCell(Center(
                                  child: Text(
                                    ' ' + (index + 1).toString(),
                                    style: style_text_Table_small,
                                  ),
                                )),
                                DataCell(SelectableText(data.maNv!,
                                    style: style_text_Table_small)),
                                DataCell(SelectableText(data.tenNv!,
                                    style: style_text_Table_small)),
                                DataCell(SelectableText(data.code!,
                                    style: style_text_Table_small)),
                                DataCell(SelectableText(data.email ?? '',
                                    style: style_text_Table_small)),
                                DataCell(SelectableText(data.dienThoai ?? '',
                                    style: style_text_Table_small)),
                                DataCell(SelectableText(_dt!,
                                    style: style_text_Table_small)),
                                DataCell(Center(
                                    child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    InkWell(
                                      onTap: () {
                                        title_user = 'Update User';
                                        text_button_CUD = 'Cập nhật';
                                        URL_USER = '$SERVER/UserList/Update';
                                        color_button_CUD = haian;
                                        CUD = 2;
                                        id_user = snapshot.data![index].id;
                                        maNV_user = snapshot.data![index].maNv;
                                        tenNv_user =
                                            snapshot.data![index].tenNv;
                                        codeValue = snapshot.data![index].code;
                                        email_user =
                                            snapshot.data?[index].email;
                                        dienthoai_user =
                                            snapshot.data?[index].dienThoai;
                                        author_user =
                                            snapshot.data![index].author;
                                        sideBarController.index.value = 16;
                                      },
                                      child: const Tooltip(
                                        message: 'Sửa',
                                        child: Icon(
                                          Icons.drive_file_rename_outline_sharp,
                                          size: 20,
                                        ),
                                      ),
                                    ),
                                    const SizedBox(
                                      width: 10,
                                    ),
                                    InkWell(
                                      onTap: () {
                                        title_user = 'Delete User';
                                        text_button_CUD = 'Xóa';
                                        URL_USER =
                                            '$SERVER/User/Delete?id=${snapshot.data![index].id}';
                                        color_button_CUD = red;
                                        CUD = 3;
                                        // id_User = snapshot.data![index].id;
                                        maNV_user = snapshot.data![index].maNv;
                                        tenNv_user =
                                            snapshot.data![index].tenNv;
                                        codeValue = snapshot.data![index].code;
                                        email_user =
                                            snapshot.data?[index].email;
                                        dienthoai_user =
                                            snapshot.data?[index].dienThoai;
                                        author_user =
                                            snapshot.data![index].author;
                                        sideBarController.index.value = 16;
                                      },
                                      child: const Tooltip(
                                        message: 'Xóa',
                                        child: Icon(
                                          Icons.delete,
                                          size: 20,
                                        ),
                                      ),
                                    )
                                  ],
                                ))),
                              ]);
                            })),
                      ),
                    ]),
              ),
            ),
          );
        }
        return Text('');
      },
    );
  }
}
