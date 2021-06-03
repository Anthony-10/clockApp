import 'package:clock_app/home_page/view/clock_view.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    var now = DateTime.now();
    var formattedTime = DateFormat('HH:mm').format(now);
    var formattedDate = DateFormat('EEE, d MMM').format(now);
    var timezoneString = now.timeZoneOffset.toString().split('.').first;
    var offsetSign = '';
    if (!timezoneString.startsWith('-')) offsetSign = '+';
    print(timezoneString);

    return Scaffold(
      backgroundColor: Color(0xFF2D2F41),
      body: Row(
        children: [
          /*Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              FlatButton(
                  onPressed: () {},
                  child: Column(
                    children: [
                      FlutterLogo(),
                      Text(
                        'Clock',
                        style: TextStyle(color: Colors.white, fontSize: 14.0),
                      )
                    ],
                  ))
            ],
          ),*/
          /*VerticalDivider(
            color: Colors.white54,
            width: 1,
          ),*/
          Flexible(
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 32, vertical: 64),
              child:
                  Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                Text(
                  'Clock',
                  style: TextStyle(color: Colors.white, fontSize: 24),
                ),
                SizedBox(height: 32.0,),
                Text(
                  formattedTime,
                  style: TextStyle(color: Colors.white, fontSize: 64),
                ),
                Text(
                  formattedDate,
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
                ClockView(),
                Text(
                  'Timezone',
                  style: TextStyle(color: Colors.white, fontSize: 24),
                ),
                SizedBox(height: 16.0,),
                Row(
                  children: [
                    Icon(Icons.language, color: Colors.white),
                    Text(
                      'UTC' + offsetSign + timezoneString,
                      style: TextStyle(color: Colors.white, fontSize: 24),
                    ),
                  ],
                ),
              ]),
            ),
          ),
        ],
      ),
    );
  }
}
