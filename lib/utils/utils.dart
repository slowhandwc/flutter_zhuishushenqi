

import 'package:flutter/material.dart';
import 'package:flutter_zhuishushenqi/config/service_url.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:intl/intl.dart';

import 'custom_color.dart';

showToast(String msg){
  Fluttertoast.showToast(
      msg: msg,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIos: 1,
      backgroundColor: CustomColor.blackA99,
      textColor: Colors.white,
      fontSize: 16.0
  );
}
///获取图片地址
getImageUrl(String url){
  return imageBaseUrl + url;
}

///获取当前时间(小时分钟)的格式化字符串
String getTimeNowFormatString(){
  return DateFormat.Hm().format(DateTime.now());
}