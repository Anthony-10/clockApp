import 'package:clock_app/home_page/constants/theme_data.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';

import 'data.dart';

class AlarmPage extends StatefulWidget {
  const AlarmPage({Key? key}) : super(key: key);

  @override
  _AlarmPageState createState() => _AlarmPageState();
}

class _AlarmPageState extends State<AlarmPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 32.0, vertical: 64.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Alarm',
            style: TextStyle(
                fontFamily: 'avenir',
                fontWeight: FontWeight.w700,
                color: CustomColors.primaryTextColor,
                fontSize: 24),
          ),
          Expanded(
            child: ListView(
              children: alarms.map<Widget>((alarm) {
                return Container(
                  margin: EdgeInsets.only(bottom: 32.0),
                  padding: const EdgeInsets.symmetric(
                      horizontal: 16.0, vertical: 8.0),
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                        colors: alarm.gradientColors,
                        begin: Alignment.centerLeft,
                        end: Alignment.centerRight),
                    boxShadow: [
                      BoxShadow(
                          color: alarm.gradientColors.last.withOpacity(0.4),
                          blurRadius: 8.0,
                          spreadRadius: 2,
                          offset: Offset(4, 4)),
                    ],
                    borderRadius: BorderRadius.all(Radius.circular(24.0)),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Icon(
                                Icons.label,
                                color: Colors.white,
                                size: 24.0,
                              ),
                              SizedBox(
                                width: 8.0,
                              ),
                              Text(
                                'Office',
                                style: TextStyle(
                                    color: Colors.white, fontFamily: 'avenir'),
                              ),
                            ],
                          ),
                          Switch(
                            value: true,
                            onChanged: (bool value) {},
                            activeColor: Colors.white,
                          )
                        ],
                      ),
                      Text(
                        'Mon-Fri',
                        style: TextStyle(
                          fontFamily: 'avenir',
                          color: Colors.white,
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            '07:00 AM',
                            style: TextStyle(
                                fontFamily: 'avenir',
                                fontWeight: FontWeight.w700,
                                color: Colors.white,
                                fontSize: 24),
                          ),
                          Icon(
                            Icons.keyboard_arrow_down,
                            size: 36.0,
                            color: Colors.white,
                          )
                        ],
                      ),
                    ],
                  ),
                );
              }).followedBy([
                DottedBorder(
                  strokeWidth: 3.0,
                  color: CustomColors.clockOutline,
                  borderType: BorderType.RRect,
                  radius: Radius.circular(24.0),
                  child: Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: CustomColors.clockBG,
                      borderRadius: BorderRadius.all(Radius.circular(24.0)),
                    ),
                    child: FlatButton(
                      padding: EdgeInsets.symmetric(
                          horizontal: 32.0, vertical: 16.0),
                      onPressed: () {},
                      child: Column(
                        children: [
                          Image.asset(
                            'assets/add_alarm.png',
                            scale: 1.5,
                          ),
                          Text(
                            'Add Alarm',
                            style: TextStyle(
                                color: Colors.white, fontFamily: 'avenir'),
                          )
                        ],
                      ),
                    ),
                  ),
                )
              ]).toList(),
            ),
          ),
        ],
      ),
    );
  }
}
