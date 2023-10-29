import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:quiz_app2/models/lesson_models.dart';
import 'package:quiz_app2/models/test_model.dart';
import 'package:quiz_app2/models/utils.dart';
import 'package:quiz_app2/pages/cpp_page.dart';
import 'package:quiz_app2/pages/java_page.dart';
import 'package:quiz_app2/pages/python_page.dart';

class QuizPage extends StatefulWidget {
  const QuizPage({super.key});

  @override
  State<QuizPage> createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  int currentIndex = 0;
  late TestModel currentTest;
  String selected = '';
  int score = 0;
  final player = AudioPlayer();
  final player1 = AudioPlayer();
  final player2 = AudioPlayer();

  @override
  void initState() {
    super.initState();
    playMusic();
  }

  @override
  void dispose() {
    super.dispose();
    stopMusic();
  }

  void playMusic() async {
    await player.setSourceAsset('assets/audio/epic.mp3');
    await player1.setReleaseMode(ReleaseMode.loop);
    await player2.play(AssetSource('assets/audio/drone.mp3'));
  }

  void stopMusic() async {
    await player.stop();
    await player.release();
    await player1.stop();
    await player1.release();
    await player2.stop();
    await player2.release();
  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.blue,
        body: Stack(children: [
          Image.asset('assets/image/img_1.png'),
          Padding(
            padding: const EdgeInsets.only(top: 15, left: 10),
            child: IconButton(
              onPressed: () {
                HapticFeedback.vibrate();
                Navigator.pop(context);
              },
              icon: const Icon(
                Icons.arrow_back_rounded,
                color: Colors.white,
                size: 30,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 309),
            child: ListView.builder(
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.only(top: 26, left: 56, right: 39),
                  child: Container(
                    height: 130,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(14),
                        boxShadow: const [
                          BoxShadow(
                              blurRadius: 10,
                              blurStyle: BlurStyle.outer,
                              color: Colors.deepPurple)
                        ]),
                    child: MaterialButton(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(14)),
                      onPressed: () {
                        HapticFeedback.vibrate();
                        setState(() {
                          if (lessons[index].name == 'C++' && lessons[index].test == cppQuestions) {
                            setState(() {
                              player.play(AssetSource('assets/audio/click.mp3'));
                              Navigator.push(
                                  context,
                                  CupertinoPageRoute(
                                    builder: (context) => const CppPage(),
                                  ));
                            });
                          } else if (lessons[index].name == 'Java' && lessons[index].test == javaQuestions) {
                            setState(() {
                              player1.play(AssetSource('assets/audio/epic.mp3'));
                              Navigator.push(
                                  context,
                                  CupertinoPageRoute(
                                    builder: (context) => const JavaPage(),
                                  ));
                            });
                          } else if (lessons[index].name == 'Python' && lessons[index].test == pythonQuestions) {
                            setState(() {
                              player2.play(AssetSource('assets/audio/history.mp3'));
                              Navigator.push(
                                  context,
                                  CupertinoPageRoute(
                                    builder: (context) => const PythonPage(),
                                  ));
                            });
                          }
                        });
                      },
                      child: Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 25),
                            child: Image.asset(
                              lessons[index].icon,
                              height: 85,
                              width: 85,
                            ),
                          ),
                          SizedBox(
                            height: 45,
                            width: 170,
                            child: Center(
                              child: Text(
                                lessons[index].name,
                                style: const TextStyle(
                                    color: Color(0xff5B1CAE),
                                    fontWeight: FontWeight.w500,
                                    fontSize: 35),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                );
              },
              itemCount: lessons.length,
            ),
          ),
        ]),
      ),
    );
  }
}
