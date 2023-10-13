import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:web_booking/assets/constants/variable.dart';
import 'package:web_booking/assets/utils/project/routes/app_route_config.dart';
import 'package:web_booking/page/default/widgets/dropdownLeaguage.dart';
import 'package:easy_localization/easy_localization.dart';

import '../../../assets/constants/color.dart';
import '../../../assets/constants/style.dart';

class appbar extends StatelessWidget {
  const appbar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: deviceWidth(context),
      height: 40,
      alignment: Alignment.center,
      color: haian,
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          // mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding: EdgeInsets.only(left: 50),
              width: 1296,
              child: Text(
                'welcome'.tr(),
                style: style14_white,
                textAlign: TextAlign.left,
              ),
            ),
            const DropdownLeaguage(),
            SizedBox(width: 30,),
            InkWell(
              onTap: () {
                context.go(AppRoutes.SignInRoute);
              },
              child: Container(
                width: 70,
                child: Text('signin'.tr(), style: style14_white,)),
            ),
            SizedBox(width: 30,),
            // InkWell(
            //   onTap: () {
            //     context.go(AppRoutes.TestRoute);
            //   },
            //   child: Container(
            //     width: 70,
            //     child: Text('Test', style: style14_white,)),
            // )
          ],
        ),
      ),
    );
  }
}
