import 'package:country_code_picker/country_code_picker.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:language_picker/language_picker_dropdown.dart';
import 'package:language_picker/language_picker_dropdown_controller.dart';
import 'package:language_picker/languages.dart';

import '../theme/app_colors.dart';
import '../theme/app_theme.dart';
import '../util/app_constant.dart';

class AppLanguage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 140,
      padding: const EdgeInsets.only(left: 5),
      margin: const EdgeInsets.only(right: 10),
      color: AppColors.appColor,
      child: DropdownSearch<String>(
        onChanged: (newValue) {
          AppConstant.getLocale(newValue);
        },
        // key: dropDownKey,
        selectedItem: Languages.english.nativeName,
        items: (filter, infiniteScrollProps) => AppConstant.getLocales(),
        decoratorProps:  DropDownDecoratorProps(
          baseStyle: const TextStyle(color: Colors.white),
          decoration: InputDecoration(
            border: OutlineInputBorder(
              borderSide: BorderSide(
                  color: AppColors.appColor),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(
                  color: AppColors.appColor),
            ),

            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(
                  color: AppColors.appColor),
            ),

          ),
        ),
        popupProps:
            const PopupProps.menu(fit: FlexFit.loose, constraints: BoxConstraints()),
      ),

    );
  }
}
