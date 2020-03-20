import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_demo/core/router/router.dart';
import 'package:flutter_app_demo/core/services/database_services.dart';
import 'package:flutter_app_demo/core/util/utils.dart';
import 'package:flutter_app_demo/ui/constrants/app_strings.dart';
import 'package:flutter_app_demo/ui/widgets/dialog_custom.dart';

class HomeViewModel extends ChangeNotifier{
  BuildContext _context;

  HomeViewModel(BuildContext context) {
    this._context = context;
  }

  logout() async{
    await FirebaseAuth.instance.signOut();
    Navigator.pushNamedAndRemoveUntil(_context, Router.login, (Route<dynamic> route) => false);
  }

  updateUserProfile(String username, String address, String avatar, String lat, String lon) async{
    var data = {
      'username': username,
      'address': address,
      'avatar': avatar,
      'lat': lat,
      'lon': lon
    };
    try{
      await DatabaseServices().updateUserProfile(data);
    }catch(e){
      showMessageDialog(_context,
          description: Utils.getString(_context, txt_update_profile_fail),
          onPress: () => Navigator.pop(_context)
      );
    }
  }
}