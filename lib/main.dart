 import 'package:clock_app/home_page/view/enum.dart';
import 'package:clock_app/home_page/view/menu_info.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:provider/provider.dart';

import 'home_page/view/home_view.dart';

final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
    FlutterLocalNotificationsPlugin();

 void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  var initializationSettingsAndroid =
  AndroidInitializationSettings('icon_logo');
  var initializationSettingsIOS = IOSInitializationSettings(
      requestAlertPermission: true,
      requestBadgePermission: true,
      requestSoundPermission: true,
      onDidReceiveLocalNotification:
          (int id, String? title, String? body, String? payload) async {});
  var initializationSettings = InitializationSettings(
      android: initializationSettingsAndroid, iOS: initializationSettingsIOS);
  await flutterLocalNotificationsPlugin.initialize(initializationSettings,
      onSelectNotification: (String? payload) async {
        if (payload != null) {
          debugPrint('notification payload: ' + payload);
        }
      });
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: ChangeNotifierProvider<MenuInfo>(
          create: (context) =>
              MenuInfo(MenuType.clock, title: '', imageSource: ''),
          child: HomeView(),
        ));
  }
}
