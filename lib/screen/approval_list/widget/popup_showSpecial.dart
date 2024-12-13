import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'package:web_booking/constants/variable.dart';
import 'package:web_booking/model/notification/firebase_message.dart';
import 'package:web_booking/screen/notifications/fetch_notfication.dart';

void showSpecialList(BuildContext context) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text(
          'Special List',
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.blue),
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        content: SingleChildScrollView(
          // scrollDirection: Axis.horizontal,
          child: Table(
            border: TableBorder.all(color: Colors.black, width: 1),
            columnWidths: {
              0: FlexColumnWidth(3),
              1: FlexColumnWidth(3),
              2: FlexColumnWidth(2),
            },
            children: [
              // Dòng tiêu đề
              TableRow(
                decoration: BoxDecoration(color: Colors.grey[300]),
                children: [
                  Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text('Shipper',
                        style: TextStyle(fontWeight: FontWeight.bold)),
                  ),
                  Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text('Loại B/C',
                        style: TextStyle(fontWeight: FontWeight.bold)),
                  ),
                  Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text('Loại A',
                        style: TextStyle(fontWeight: FontWeight.bold)),
                  ),
                ],
              ),
              // Dữ liệu
              TableRow(children: [
                Padding(padding: EdgeInsets.all(8.0), child: Text('HAAL')),
                Padding(padding: EdgeInsets.all(8.0), child: Text('8')),
                Padding(padding: EdgeInsets.all(8.0), child: Text('7')),
              ]),
              TableRow(children: [
                Padding(padding: EdgeInsets.all(8.0), child: Text('MLA')),
                Padding(padding: EdgeInsets.all(8.0), child: Text('8')),
                Padding(padding: EdgeInsets.all(8.0), child: Text('7')),
              ]),
              TableRow(children: [
                Padding(padding: EdgeInsets.all(8.0), child: Text('HAFC')),
                Padding(padding: EdgeInsets.all(8.0), child: Text('8')),
                Padding(padding: EdgeInsets.all(8.0), child: Text('7')),
              ]),
              TableRow(children: [
                Padding(padding: EdgeInsets.all(8.0), child: Text('Nam Hải')),
                Padding(padding: EdgeInsets.all(8.0), child: Text('7')),
                Padding(padding: EdgeInsets.all(8.0), child: Text('3')),
              ]),
              TableRow(children: [
                Padding(
                    padding: EdgeInsets.all(8.0), child: Text('Nam Hoa Sơn')),
                Padding(padding: EdgeInsets.all(8.0), child: Text('6')),
                Padding(padding: EdgeInsets.all(8.0), child: Text('3')),
              ]),
              TableRow(children: [
                Padding(padding: EdgeInsets.all(8.0), child: Text('Tân Biển')),
                Padding(padding: EdgeInsets.all(8.0), child: Text('5')),
                Padding(padding: EdgeInsets.all(8.0), child: Text('3')),
              ]),
              TableRow(children: [
                Padding(padding: EdgeInsets.all(8.0), child: Text('Kioway')),
                Padding(padding: EdgeInsets.all(8.0), child: Text('5')),
                Padding(padding: EdgeInsets.all(8.0), child: Text('3')),
              ]),
              TableRow(children: [
                Padding(padding: EdgeInsets.all(8.0), child: Text('Đại Dương')),
                Padding(padding: EdgeInsets.all(8.0), child: Text('4')),
                Padding(padding: EdgeInsets.all(8.0), child: Text('3')),
              ]),
              TableRow(children: [
                Padding(padding: EdgeInsets.all(8.0), child: Text('Việt Á')),
                Padding(padding: EdgeInsets.all(8.0), child: Text('4')),
                Padding(padding: EdgeInsets.all(8.0), child: Text('3')),
              ]),
              TableRow(children: [
                Padding(padding: EdgeInsets.all(8.0), child: Text('Minh Tân')),
                Padding(padding: EdgeInsets.all(8.0), child: Text('5')),
                Padding(padding: EdgeInsets.all(8.0), child: Text('3')),
              ]),
              TableRow(children: [
                Padding(
                    padding: EdgeInsets.all(8.0), child: Text('Việt Phong HN')),
                Padding(padding: EdgeInsets.all(8.0), child: Text('10')),
                Padding(padding: EdgeInsets.all(8.0), child: Text('10')),
              ]),
              TableRow(children: [
                Padding(padding: EdgeInsets.all(8.0), child: Text('Đông Á')),
                Padding(padding: EdgeInsets.all(8.0), child: Text('7')),
                Padding(padding: EdgeInsets.all(8.0), child: Text('3')),
              ]),
              TableRow(children: [
                Padding(padding: EdgeInsets.all(8.0), child: Text('Việt Hưng')),
                Padding(padding: EdgeInsets.all(8.0), child: Text('5')),
                Padding(padding: EdgeInsets.all(8.0), child: Text('3')),
              ]),
              TableRow(children: [
                Padding(
                    padding: EdgeInsets.all(8.0), child: Text('HH Ngân Trí')),
                Padding(padding: EdgeInsets.all(8.0), child: Text('4')),
                Padding(padding: EdgeInsets.all(8.0), child: Text('3')),
              ]),
              TableRow(children: [
                Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text('Thái Bình Minh')),
                Padding(padding: EdgeInsets.all(8.0), child: Text('7')),
                Padding(padding: EdgeInsets.all(8.0), child: Text('3')),
              ]),
              TableRow(children: [
                Padding(padding: EdgeInsets.all(8.0), child: Text('TMS 2')),
                Padding(padding: EdgeInsets.all(8.0), child: Text('6')),
                Padding(padding: EdgeInsets.all(8.0), child: Text('5')),
              ]),
              TableRow(children: [
                Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text('Đại Quang Minh')),
                Padding(padding: EdgeInsets.all(8.0), child: Text('4')),
                Padding(padding: EdgeInsets.all(8.0), child: Text('3')),
              ]),
              TableRow(children: [
                Padding(padding: EdgeInsets.all(8.0), child: Text('Việt Công')),
                Padding(padding: EdgeInsets.all(8.0), child: Text('4')),
                Padding(padding: EdgeInsets.all(8.0), child: Text('3')),
              ]),
            ],
          ),
        ),
        // content: Container(
        //   // Giới hạn chiều cao cho hộp thoại
        //   width: deviceWidth(context) - 200,
        //   height: deviceHeight(context) - 200,
        //   child: ListView(
        //     shrinkWrap: true,
        //     children: [
        //       ListTile(
        //         title: Text('MLA'),
        //         subtitle: Text('Times: 8, Loại A: 7'),
        //       ),
        //       ListTile(
        //         title: Text('HAFC'),
        //         subtitle: Text('Times: 8, Loại A: 7'),
        //       ),
        //       ListTile(
        //         title: Text('Nam Hai'),
        //         subtitle: Text('Times: 7, Loại A: 3'),
        //       ),
        //       ListTile(
        //         title: Text('Nam Hai'),
        //         subtitle: Text('Times: 7, Loại A: 3'),
        //       ),
        //       ListTile(
        //         title: Text('Nam Hai'),
        //         subtitle: Text('Times: 7, Loại A: 3'),
        //       ),
        //       ListTile(
        //         title: Text('Nam Hai'),
        //         subtitle: Text('Times: 7, Loại A: 3'),
        //       ),
        //     ],
        //   ),
        // ),
        actions: [
          TextButton(
            child: Text('Close'),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ],
      );
    },
  );
}

class NotificationItem extends StatelessWidget {
  final FirebaseMessage item;
  final VoidCallback? callback;

  NotificationItem({Key? key, required this.item, this.callback})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: callback,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          ClipOval(
            child: CircleAvatar(
              backgroundColor: Colors.orange.withOpacity(0.2),
              radius: 25,
              child: SizedBox(
                width: 40,
                height: 40,
                child: Transform.scale(
                  scale: 0.8,
                  child: SvgPicture.asset(item.type.image),
                ),
              ),
            ),
          ),
          SizedBox(height: 80),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Html(data: item.payload),
                if (item.timestamp != null) _buildUpdatedTime(),
              ],
            ),
          ),
          if (!item.isRead)
            const Padding(
              padding: EdgeInsets.only(top: 12.0),
              child: CircleAvatar(radius: 5),
            ),
        ],
      ),
    );
  }

  Widget _buildUpdatedTime() {
    return Padding(
      padding: const EdgeInsets.only(left: 7.0),
      child: Text(
        DateTimeUtils.convertTimeToTimeAgo(item.timestamp),
      ),
    );
  }
}

class DateTimeUtils {
  static String convertTimeToTimeAgo(DateTime? createdDate) {
    if (createdDate == null) return '';
    final result = timeago
            .format(createdDate, locale: 'en')
            .substring(0, 1)
            .toUpperCase() +
        timeago.format(createdDate, locale: 'en').substring(1);
    return result;
  }
}
