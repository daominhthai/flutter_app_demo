import 'package:flutter/material.dart';
import 'package:flutter_app_demo/core/util/utils.dart';
import 'package:flutter_app_demo/core/viewmodels/views/home_view_model.dart';
import 'package:flutter_app_demo/ui/constrants/app_colors.dart';
import 'package:flutter_app_demo/ui/constrants/app_strings.dart';
import 'package:flutter_app_demo/ui/widgets/app_bar_custom.dart';
import 'package:flutter_app_demo/ui/widgets/dialog_custom.dart';

class HomeView extends StatefulWidget {
  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Stack(
      children: <Widget>[
        Column(
          children: <Widget>[
            Container(
              width: double.infinity,
              height: MediaQuery.of(context).size.height * 0.4,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                    colors: [start_gradient_color, end_gradient_color],
                    stops: [0.0,1.0]
                )
              ),
            ),
            Container(
              height: MediaQuery.of(context).size.height * 0.6,
              color: Colors.white,
            )
          ],
        ),
        Scaffold(
          appBar: appBarCustom(context,
                  () => {},
                  () => showMessageDialog(context,
                      description: Utils.getString(context, txt_request_logout),
                    onPress: () => HomeViewModel(context).logout()
                  ),
              'Đào Minh Thái', Icons.sort, Icons.exit_to_app),
          backgroundColor: Colors.transparent,
          body: Container(),
        )
      ],
    );
  }
}