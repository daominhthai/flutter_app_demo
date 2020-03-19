import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_demo/core/util/utils.dart';
import 'package:flutter_app_demo/ui/constrants/app_strings.dart';
import 'package:flutter_app_demo/ui/widgets/dm_button.dart';
import 'package:flutter_app_demo/ui/widgets/dm_text.dart';

showLoadingDialog(BuildContext context) => showDialog(
    context: context,
    barrierDismissible: false,
    builder: (BuildContext context) {
      return WillPopScope(
          onWillPop: () async => false,
          child:
          SimpleDialog(backgroundColor: Colors.black54, children: <Widget>[
            Center(
              child: Column(children: [
                CircularProgressIndicator(),
                SizedBox(
                  height: 10,
                ),
                Text(
                  "Please Wait....",
                  style: TextStyle(color: Colors.blueAccent),
                )
              ]),
            )
          ]));
    });

showMessageDialog(BuildContext context,
    {String title = 'Thông báo',
      String description = '',
      Function onPress,
      Widget childContent,
      String buttonText = txt_ok}) =>
    showDialog(
        barrierDismissible: false,
        context: context,
        builder: (context) {
          return WillPopScope(
              child: Dialog(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(7),
                ),
                elevation: 0.0,
                backgroundColor: Colors.white,
                child: Stack(
                  children: <Widget>[
                    Container(
                        width: MediaQuery.of(context).size.width * 0.8,
                        height: MediaQuery.of(context).size.height * 0.3,
                        child: Center(
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: <Widget>[
                              DMText(title,
                                  textAlign: TextAlign.center,
                                  style: TextStyle(fontSize: 20),
                                  tkFont: TKFont.MEDIUM),
                              description.isEmpty
                                  ? childContent
                                  : Container(
                                margin: EdgeInsets.only(top: 10),
                                child: DMText(
                                  description,
                                  style: TextStyle(fontSize: 18),
                                ),
                              ),
                              DMButton(Utils.getString(context, buttonText),
                                  width:
                                  MediaQuery.of(context).size.width * 0.3,
                                  margin: EdgeInsets.only(top: 15),
                                  onPress: onPress),
                            ].where((child) => child != null).toList(),
                          ),
                        )),
                    Positioned(
                        right: 10,
                        top: 10,
                        child: GestureDetector(
                          behavior: HitTestBehavior.translucent,
                          onTap: () => Navigator.of(context).pop(),
                          child: Icon(
                            Icons.clear,
                            color: Colors.grey,
                            size: 20,
                          ),
                        ))
                  ],
                ),
              ),
              onWillPop: () async => false);
        });
