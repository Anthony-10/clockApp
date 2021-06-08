import 'package:clock_app/home_page/constants/theme_data.dart';
import 'package:clock_app/home_page/view/alarm_clock.dart';
import 'package:clock_app/home_page/view/clock_page.dart';
import 'package:clock_app/home_page/view/enum.dart';
import 'package:clock_app/home_page/view/menu_info.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'data.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF2D2F41),
      body: Row(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: menuItems
                .map((currentMenuInfo) => buildMenuButton(currentMenuInfo))
                .toList(),
          ),
          VerticalDivider(
            color: Colors.white54,
            width: 1,
          ),
          Expanded(
            child: Consumer<MenuInfo>(
              builder: (BuildContext context, value, Widget? child) {
                if (value.menuType == MenuType.clock)
                  return ClockPage();
                else if (value.menuType == MenuType.alarm)
                  return AlarmPage();
                else
                  return Container(
                      child: RichText(
                    text: TextSpan(
                        style: TextStyle(fontSize: 20),
                        children: <TextSpan>[
                          TextSpan(text: 'Updated Soon\n'),
                          TextSpan(
                              text: value.title,
                              style: TextStyle(fontSize: 48.0))
                        ]),
                  ));
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget buildMenuButton(MenuInfo currentMenuInfo) {
    return Consumer<MenuInfo>(
      builder: (BuildContext context, value, Widget? child) {
        return FlatButton(
            shape: RoundedRectangleBorder(
                borderRadius:
                    BorderRadius.only(topRight: Radius.circular(32.0))),
            padding:
                const EdgeInsets.symmetric(vertical: 16.0, horizontal: 0.0),
            color: currentMenuInfo.menuType == value.menuType
                ? CustomColors.menuBackgroundColor
                : Colors.transparent,
            onPressed: () {
              var menuInfo = Provider.of<MenuInfo>(context, listen: false);
              menuInfo.updateMenu(currentMenuInfo);
            },
            child: Column(
              children: [
                Image.asset(
                  currentMenuInfo.imageSource,
                  scale: 1.5,
                ),
                Text(
                  currentMenuInfo.title ?? '',
                  style: TextStyle(
                      fontFamily: 'avenir',
                      color: Colors.white,
                      fontSize: 14.0),
                )
              ],
            ));
      },
    );
  }
}
