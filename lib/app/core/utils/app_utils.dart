import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AppUtils {
  Future saveLocalData({required String key, required String data}) async {
    final SharedPreferences storage = await SharedPreferences.getInstance();
    await storage.setString(key, data);
  }

  Future<String?> getLocalData({required String key}) async {
    final SharedPreferences storage = await SharedPreferences.getInstance();
    return storage.getString(key);
  }

  Future removeLocalData({required String key}) async {
    final SharedPreferences storage = await SharedPreferences.getInstance();
    return await storage.remove(key);
  }

  String priceToCurrency(double price) {
    NumberFormat numberFormat = NumberFormat.simpleCurrency(locale: 'pt_BR');

    return numberFormat.format(price);
  }

  String formatDateTime(DateTime dateTime) {
    initializeDateFormatting();

    DateFormat dateFormat = DateFormat.yMd('pt_BR').add_Hm();
    return dateFormat.format(dateTime);
  }

  void showToast({required String message, bool isError = false}) {
    Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_LONG,
      gravity: ToastGravity.TOP,
      timeInSecForIosWeb: 4,
      backgroundColor: isError ? Colors.red : Colors.green,
      textColor: isError ? Colors.white : Colors.black,
      fontSize: 18,
    );
  }
}
