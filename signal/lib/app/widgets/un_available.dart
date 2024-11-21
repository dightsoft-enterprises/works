
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../theme/app_colors.dart';

class UnAvailable extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return
      Center(child: Text('not_available'.tr),);
  }
}
