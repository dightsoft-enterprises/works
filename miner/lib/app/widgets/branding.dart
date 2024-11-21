
import 'package:flutter/material.dart';

import '../theme/app_colors.dart';
import '../theme/app_theme.dart';
import '../util/app_constant.dart';

class Branding extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    return SizedBox(
      width: (MediaQuery.of(context).size.width - 60),
      child: Text(AppConstant.appName,
          textAlign: TextAlign.start,
          softWrap: true,
          style: TextStyle(
            fontWeight: AppConstant.fontWeight,
            letterSpacing: 0.5,
            fontSize: AppConstant.fontHeaderSize,
            color: AppColors.appTopBarColor,
            // fontStyle: FontStyle.italic
          )),
    );
  }
}
