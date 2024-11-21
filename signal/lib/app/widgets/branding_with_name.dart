
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_common/get_reset.dart';


class BrandingWithName extends StatelessWidget {
  final String  name;
  BrandingWithName(this.name);
  @override
  Widget build(BuildContext context) {
    return Container(
      width: (MediaQuery.of(context).size.width - 100),
      child: Center(
        child: Text(name,
            style: const TextStyle(
                fontWeight: FontWeight.w500,
                letterSpacing: 0.5,
                fontSize: 19,
                color: Colors.white,
                fontStyle: FontStyle.italic)),
      ),
    );
  }
}
