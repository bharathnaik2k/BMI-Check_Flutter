import 'package:flutter/material.dart';
import 'package:package_info_plus/package_info_plus.dart';

class SettingsController extends ChangeNotifier {
  String appVersion = '1.0.0';
  Future<void> appVersionCheck() async {
    PackageInfo packageInfo = await PackageInfo.fromPlatform();
    appVersion = packageInfo.version;
    notifyListeners();
  }
}
