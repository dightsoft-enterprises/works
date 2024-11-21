
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../theme/app_colors.dart';

class LoadingIcon extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return
      Center(child: CircularProgressIndicator(
        color: AppColors.appColor,
      ),);
  }
}
