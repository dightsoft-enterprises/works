import 'package:get/get_navigation/get_navigation.dart';
import 'en_US/en_US_translation.dart';
import 'es_MX/es_mx_translation.dart';

 class AppTranslations extends Translations {
   @override
  Map<String, Map<String, String>> get keys =>{
     'en_US': enUs, // English (United States)
     'es_MX': esMx, // Spanish (Mexico)

  };
}