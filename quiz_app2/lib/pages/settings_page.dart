import 'package:audioplayers/audioplayers.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {

  final sourse = AudioPlayer();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      bottom: false,
      child: Scaffold(
        body: Stack(
          children: [
            Image.asset('assets/image/settings.png',width: 411,height: 180,alignment: Alignment.topCenter,fit: BoxFit.fill),
            Padding(
              padding: const EdgeInsets.only(top: 15, left: 10),
              child: IconButton(
                onPressed: () {
                  HapticFeedback.vibrate();
                  Navigator.pop(context);
                },
                icon: const Icon(
                  Icons.arrow_circle_left_outlined,
                  color: Colors.white,
                  size: 35,
                ),
              ),
            ),
          ],
        ),
        bottomNavigationBar: CurvedNavigationBar(
          backgroundColor: Colors.white,
          color: Color(0xff5B1CAE),
          index: 2,
          items: const <Widget>[
            Icon(Icons.music_video_sharp,size: 50,color: Colors.white),
            Icon(Icons.timer_outlined,size: 50,color: Colors.white),
            Icon(Icons.font_download,size: 50,color: Colors.white,)
          ],
          onTap: (index) {
            setState(() {
              HapticFeedback.vibrate();
            });
          },
        ),
      ),
    );
  }
}

