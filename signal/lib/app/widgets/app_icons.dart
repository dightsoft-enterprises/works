import 'dart:html';

import 'package:flutter/material.dart';
import 'package:get/get_utils/src/platform/platform.dart';

class AppIcon{
  static Icons dottedIcon =  (GetPlatform.isAndroid ? Icons.more_vert : Icons.more_horiz) as Icons;
}