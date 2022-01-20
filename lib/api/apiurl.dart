part of 'api.dart';

class ApiUrl {
  static const methodToday = 'today';
  static const methodWeek = 'this_week';
  static const methodMonth = 'this_month';

  static Future<String> jadwalShalat(
    var method,
    var latitude,
    var longitude,
  ) async {
    return 'https://api.pray.zone/v2/times/$method.json?longitude=$longitude&latitude=$latitude';
  }
}
