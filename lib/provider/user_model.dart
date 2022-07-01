import 'package:assistantflutter/common/common.dart';
import 'package:assistantflutter/model/user.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sp_util/sp_util.dart';
import 'dart:convert' as convert;

class UserModel extends ChangeNotifier {
  User _user;
  bool get hasUser => _user != null;
  User get user => _user;

  UserModel() {
    String str = SpUtil.getString(Constant.user);
    Map<String, dynamic> userJson;
    if(str == ''){
      _user = null;
    }else{
      userJson = convert.jsonDecode(str);
      User tmp = User.fromJson(userJson);
      _user = tmp;
    }
  }


  saveUser(User user) {
    _user = user;
    notifyListeners();
    String json = convert.jsonEncode(user.toJson());
    print("用户信息"+json);
    SpUtil.putString(Constant.user,json);
  }

  /// 清除持久化的用户数据
  clearUser() {
    _user = null;
    notifyListeners();
    SpUtil.remove(Constant.user);
  }
}
