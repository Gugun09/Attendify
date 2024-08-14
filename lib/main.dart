import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'app/routes/app_pages.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  initializeDateFormatting('id_ID');
  final prefs = await SharedPreferences.getInstance();
  bool? isLoggedIn = prefs.getBool('isLoggedIn') ?? false;

  runApp(
    GetMaterialApp(
      title: "Application",
      initialRoute: isLoggedIn ? Routes.HOME : Routes.LOGIN,
      getPages: AppPages.routes,
    ),
  );
}
