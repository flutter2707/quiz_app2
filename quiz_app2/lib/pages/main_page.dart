import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:quiz_app2/pages/about_page.dart';
import 'package:quiz_app2/pages/history_page.dart';
import 'package:quiz_app2/pages/quiz_page.dart';
import 'package:quiz_app2/pages/settings_page.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.blue,
        body: Stack(
          children: [
            Image.asset('assets/image/img_1.png'),
            Padding(
                padding: const EdgeInsets.only(bottom: 100),
              child: Align(
                alignment: Alignment.center,
                child: container('Quiz'),
              ),
            ),
            Padding(
                padding: const EdgeInsets.only(top: 130),
              child: Align(
                alignment: Alignment.center,
                child: container('Settings'),
              ),
            ),
            Padding(
                padding: const EdgeInsets.only(top: 370),
              child: Align(
                alignment: Alignment.center,
                child: container('History'),
              ),
            ),
            Padding(
                padding: const EdgeInsets.only(top: 600),
              child: Align(
                alignment: Alignment.center,
                child: container('About'),
              ),
            ),
          ],
        ),
      ),
    );
  }
  Widget container(String satr) {
    return Container(
      height: 95,
      width: 316,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14),
        boxShadow: const [BoxShadow(blurRadius: 5,
            color:  Color(0xff5B1CAE),
            blurStyle: BlurStyle.outer)]
      ),
      child: MaterialButton(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
        onPressed: () {
          HapticFeedback.vibrate();
          if(satr == 'Quiz') {
            Navigator.push(context, CupertinoPageRoute(builder: (context) => const QuizPage(),));
          } else if(satr == 'Settings') {
            Navigator.push(context, CupertinoPageRoute(builder: (context) => const SettingsPage(),));
          } else if(satr == 'History') {
            Navigator.push(context, CupertinoPageRoute(builder: (context) => const HistoryPage(),));
          } else if(satr == 'About') {
            Navigator.push(context, CupertinoPageRoute(builder: (context) => AboutPage(),));
          }
        },
        child: Text(satr,style: const TextStyle(
          fontSize: 30,
          fontWeight: FontWeight.w900,
          color: Color(0xff5B1CAE),
        )),
      ),
    );
  }
}
