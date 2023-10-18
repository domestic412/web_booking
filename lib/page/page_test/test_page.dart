import 'package:flutter/material.dart';
import 'package:web_booking/widgets/appbar/appbar.dart';
import '../default/widgets/mainMenu/mainMenu.dart';

class TestPage extends StatefulWidget {
  @override
  State<TestPage> createState() => _TestPageState();
}

class _TestPageState extends State<TestPage> {
  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: Scaffold(
        body: Center(
          child: Column(
            children: [
                  appbar(),
                  mainMenu(),
            ],
          ),
        ),
        // bottomSheet: Footer(),
      ),
    );
  }
}
