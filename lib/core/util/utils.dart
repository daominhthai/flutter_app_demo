import 'package:flutter/material.dart';
import 'package:flutter_app_demo/core/translation/app_translations.dart';

class Utils {
  static Pattern emailPattern = r'^[a-zA-Z0-9]';

  static void closeKeyboard(BuildContext context) {
    FocusScope.of(context).requestFocus(FocusNode());
  }

  static double resizeWidthUtil(BuildContext context, double value) {
    var screenWidth = MediaQuery.of(context).size.width;
    var screenDesignWidth = 375;
    return (screenWidth * value) / screenDesignWidth;
  }

  static double resizeHeightUtil(BuildContext context, double value) {
    var screenHeight = MediaQuery.of(context).size.height;
    var screenDesignHeight = 812;

    if (screenHeight < 800) {
      return (screenHeight * value) / screenDesignHeight;
    } else {
      return (screenHeight * value) / 980;
    }
  }

  static String getString(BuildContext context, String value) =>
      AppTranslations.of(context).text(value);

}
