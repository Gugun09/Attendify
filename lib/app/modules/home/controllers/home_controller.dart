import 'dart:async';

import 'package:attendify/app/routes/app_pages.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:timezone/data/latest.dart' as tz;
import 'package:timezone/timezone.dart' as tz;

class HomeController extends GetxController {
  var formattedTime = ''.obs;
  var timezoneAbbreviation = 'WIB'.obs; // Default to WIB

  Timer? _timer;

  @override
  void onInit() {
    super.onInit();
    tz.initializeTimeZones();
    _updateTime();
    _timer = Timer.periodic(Duration(seconds: 1), (Timer t) => _updateTime());
  }

  @override
  void onClose() {
    _timer?.cancel();
    super.onClose();
  }

  void _updateTime() {
    final nowUtc = DateTime.now().toUtc();
    final location =
        tz.getLocation('Asia/Jakarta'); // Set location according to your needs
    final nowInLocation = tz.TZDateTime.from(nowUtc, location);

    final formatter = DateFormat('HH:mm');
    final time = formatter.format(nowInLocation);

    // Determine the time zone abbreviation based on the offset
    timezoneAbbreviation.value = _getTimezoneAbbreviation(nowInLocation);

    formattedTime.value = '$time ${timezoneAbbreviation.value}';
  }

  String _getTimezoneAbbreviation(tz.TZDateTime dateTime) {
    final offset = dateTime.timeZoneOffset.inHours;
    if (offset == 7) return 'WIB'; // WIB (UTC+7)
    if (offset == 8) return 'WITA'; // WITA (UTC+8)
    if (offset == 9) return 'WIT'; // WIT (UTC+9)
    return 'Unknown';
  }

  Future<void> logout() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('isLoggedIn', false); // Hapus status login
    Get.offNamed(Routes.LOGIN); // Kembali ke halaman login
  }
}
