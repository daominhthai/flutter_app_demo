import 'package:flutter/material.dart';
import 'package:flutter_app_demo/core/util/utils.dart';
import 'package:flutter_app_demo/ui/constrants/app_colors.dart';
import 'package:flutter_app_demo/ui/widgets/dm_text.dart';

class DMButton extends StatelessWidget {
  final String text;
  final Function onPress;
  final EdgeInsets margin;
  final Color borderColor;
  final Color textColor;
  final double width;
  final double height;
  final double borderRatio;

  DMButton(this.text,
      {this.onPress,
        this.margin,
        this.textColor = Colors.white,
        this.borderColor = Colors.transparent,
        this.width = 50,
        this.height = 50,
        this.borderRatio = 5.0});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      onTap: onPress,
      child: Container(
        margin: margin,
        width: width,
        height: height,
        child: LayoutBuilder(
          builder: (context, constraint) {
            return Center(
              child: DMText(
                text,
                tkFont: TKFont.BOLD,
                style: TextStyle(
                    color: textColor,
                    fontSize: Utils.resizeHeightUtil(
                        context, constraint.maxHeight * 0.4)),
              ),
            );
          },
        ),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(borderRatio),
            gradient: LinearGradient(
              colors: [start_gradient_color,end_gradient_color],
              stops: [0.0,1]
            ),
            border: Border.all(width: 1, color: borderColor)),
      ),
    );
  }
}
