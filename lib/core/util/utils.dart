import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_app_demo/core/enums/connectivity_status.dart';
import 'package:flutter_app_demo/core/translation/app_translations.dart';
import 'package:hex/hex.dart';
import 'package:provider/provider.dart';
import 'dart:ui' as ui;

class Utils {
  static Pattern emailPattern = r'^[a-zA-Z0-9]';

  static bool isInDebugMode() {
    bool inDebugMode = false;
    assert(inDebugMode = true);
    return inDebugMode;
  }

  static bool checkNetwork(BuildContext context) {
    var connectionStatus = Provider.of<ConnectivityStatus>(context);
    if (connectionStatus == ConnectivityStatus.Offline) {
      return false;
    }
    return true;
  }

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

  static Future<Uint8List> getBytesFromAsset(String path, int width) async {
    ByteData data = await rootBundle.load(path);
    ui.Codec codec = await ui.instantiateImageCodec(data.buffer.asUint8List(),
        targetWidth: width);
    ui.FrameInfo fi = await codec.getNextFrame();
    return (await fi.image.toByteData(format: ui.ImageByteFormat.png))
        .buffer
        .asUint8List();
  }

  static String getString(BuildContext context, String value) =>
      AppTranslations.of(context).text(value);

  static dynamic encode(dynamic value, {String secCode = 'GSOT'}) {
    //Todo Implement encode features
//    var keyInBytes = utf8.encode(value);
//    var payloadInBytes = utf8.encode(secCode);
//    byteToHex(keyInBytes);
//    var md5 = crypto.Hmac(crypto.md5, keyInBytes);
//    return md5.convert(payloadInBytes);
    return value;
    // return value example: 94ac9949114372a6f05149ee336727d1
  }

  static dynamic byteToHex(Uint8List value) {
    return HEX.encode(value);
    // return value example: 97{0:x2}97{0:x2}97{0:x2}97{0:x2}
  }

  static dynamic decode(dynamic value) {
    //Todo Implement decode features
    return value;
  }
}
