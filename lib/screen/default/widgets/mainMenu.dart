import 'package:flutter/material.dart';

class mainMenu extends StatefulWidget {
  const mainMenu({
    super.key,
  });

  @override
  State<mainMenu> createState() => _mainMenuState();
}

class _mainMenuState extends State<mainMenu> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      color: Colors.white54,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
              width: 200,
              padding: const EdgeInsets.all(15),
              child: Image.asset('lib/assets/images/hats_logo.png')),
          Container(
            // width: 1300,
            width: 900,
          )
        ],
      ),
    );
  }
}
