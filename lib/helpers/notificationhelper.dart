part of 'helpers.dart';

class NotificationHelper {
  static final FlutterLocalNotificationsPlugin _notificationsPlugin =
      FlutterLocalNotificationsPlugin();

  static void initialize() {
    const InitializationSettings initializationSettings =
        InitializationSettings(
            android: AndroidInitializationSettings("@mipmap/ic_launcher"));

    _notificationsPlugin.initialize(initializationSettings,
        onSelectNotification: (String? route) async {
      if (route != null) {
        Get.toNamed(route);
      }
    });
  }

  static void display(RemoteMessage message) async {
    try {
      final id = DateTime.now().millisecondsSinceEpoch ~/ 1000;

      const NotificationDetails notificationDetails = NotificationDetails(
          android: AndroidNotificationDetails(
        "konten",
        "konten channel",
        channelDescription: "this is our channel",
        icon: "@mipmap/ic_launcher",
        sound: RawResourceAndroidNotificationSound('a_long_cold_sting'),
        largeIcon: DrawableResourceAndroidBitmap("@mipmap/ic_launcher"),
        importance: Importance.max,
        priority: Priority.high,
      ));

      await _notificationsPlugin.show(
        id,
        message.notification!.title,
        message.notification!.body,
        notificationDetails,
        payload: message.data["konten"],
      );
    } on Exception catch (e) {
      print(e);
    }
  }

  void scheduleAlarm(tz.TZDateTime scheduledNotificationDateTime, String title,
      String body) async {
    const NotificationDetails notificationDetails = NotificationDetails(
        android: AndroidNotificationDetails(
      "sholat",
      "sholat channel",
      channelDescription: "this is our channel",
      icon: "@mipmap/ic_launcher",
      sound: RawResourceAndroidNotificationSound('a_long_cold_sting'),
      largeIcon: DrawableResourceAndroidBitmap("@mipmap/ic_launcher"),
      importance: Importance.max,
      priority: Priority.high,
    ));

    await _notificationsPlugin.zonedSchedule(
        0, title, body, scheduledNotificationDateTime, notificationDetails,
        uiLocalNotificationDateInterpretation:
            UILocalNotificationDateInterpretation.absoluteTime,
        androidAllowWhileIdle: true);
  }
}
