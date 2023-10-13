import 'package:flutter/material.dart';

import 'package:web_booking/widgets/sidebar/select_item.dart';

Widget? widgetbody;
String nameAppbar = 'HAI AN Container';

class SideBar extends StatefulWidget {
  const SideBar({super.key});

  @override
  State<SideBar> createState() => _SideBarState();
}

class _SideBarState extends State<SideBar> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: SideMenu(context),
      ),
      body: widgetbody,
    );
  }

  Material SideMenu(BuildContext context) {
    return Material(
      color: Color.fromRGBO(9, 34, 126, 1),
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
              decoration: BoxDecoration(
                  color: Colors.white,
                  image: DecorationImage(
                      image: AssetImage('assets/images/hats.png'),
                      fit: BoxFit.cover)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
              )),
          const SizedBox(
            height: 10,
          ),
          buildMenuItem(
              text: 'Dashboard',
              icon: Icons.home,
              onClicked: () {
                setState(() {
                  selectedItem(context, 0);
                  Navigator.pop(context);
                });
              }),
          const SizedBox(
            height: 16,
          ),
          buildMenuItem(
              text: 'Kiểm tra cont kết hợp',
              icon: Icons.card_membership_rounded,
              onClicked: () {
                setState(() {
                  selectedItem(context, 3);
                  Navigator.pop(context);
                });
              }),
          const SizedBox(
            height: 16,
          ),
          buildMenuItem(
              text: 'Tra cứu vị trí container',
              icon: Icons.search,
              onClicked: () {
                setState(() {
                  selectedItem(context, 4);
                  Navigator.pop(context);
                });
              }),
          const SizedBox(
            height: 16,
          ),
          const Divider(
            color: Colors.white70,
          ),
          buildMenuItem(
            text: 'Đăng Xuất',
            icon: (Icons.logout),
            onClicked: () => selectedItem(context, 5),
          ),
        ],
      ),
    );
  }
}

Widget buildMenuItem({
  required String text,
  required IconData icon,
  GestureTapCallback? onClicked,
}) {
  final color = Colors.white;
  final hoverColor = Colors.white70;
  return ListTile(
    leading: Icon(
      icon,
      color: color,
    ),
    title: Text(
      text,
      style: TextStyle(color: color),
    ),
    hoverColor: hoverColor,
    onTap: onClicked,
  );
}
