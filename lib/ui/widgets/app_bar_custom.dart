import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_demo/core/util/utils.dart';
import 'package:flutter_app_demo/ui/constrants/app_colors.dart';
import 'package:flutter_app_demo/ui/constrants/app_value.dart';
import 'package:flutter_app_demo/ui/constrants/text_styles.dart';

Widget appBarCustom(BuildContext context, Function leftPress,
    Function rightPress, String title, IconData iconLeft, IconData iconRight) => AppBar(
      flexibleSpace: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: <Color>[
                  start_gradient_color,
                  end_gradient_color
                ])
        ),
      ),
      elevation: 0,
      centerTitle: true,
      leading: InkWell(
        onTap: leftPress,
        child: Icon(
          iconLeft ?? iconLeft,
          color: icon_app_bar_color,
          size: Utils.resizeWidthUtil(context, app_bar_icon_size),
        ),
      ),
      title: Text(title,
          style:
          appBarTextStyle(Utils.resizeWidthUtil(context, app_bar_font_size))),
      actions: <Widget>[
        InkWell(
          child: Icon(iconRight ?? iconRight,
              color: icon_app_bar_color,
              size: Utils.resizeWidthUtil(context, app_bar_icon_size)),
          onTap: rightPress,
        ),
        Container(width: 10.0,)
      ],
    );