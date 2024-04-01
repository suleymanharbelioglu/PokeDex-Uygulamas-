import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:v201/constants/constants.dart';
import 'package:v201/constants/ui_helper.dart';

class AppTitle extends StatelessWidget {
  const AppTitle({super.key});
  final String pokeballImageUrl = "images/pokeball.png";

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      // color: Colors.red,
      height: UIHelper.getAppTitleWidgetHeigth(),
      child: Stack(
        children: [
          Padding(
            padding: UIHelper.getDefultPadding(),
            child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  Constants.title,
                  style: Constants.getTitleTextStyle(),
                )),
          ),
          Align(
            alignment: Alignment.topRight,
            child: Image.asset(
              pokeballImageUrl,
              width: (ScreenUtil().orientation == Orientation.portrait)
                  ? 0.2.sh
                  : 0.2.sw,
              fit: BoxFit.fitWidth,
            ),
          ),
        ],
      ),
    );
  }
}
