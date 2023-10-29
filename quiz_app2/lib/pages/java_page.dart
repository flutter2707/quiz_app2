import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:quiz_app2/models/hive_repo.dart';
import 'package:quiz_app2/models/utils.dart';
import 'result_page.dart';
import '../tools/audio.dart';
import '../models/test_model.dart';
import '../tools/images.dart';

class JavaPage extends StatefulWidget {
  const JavaPage({super.key});

  @override
  State<JavaPage> createState() => _JavaPageState();
}

class _JavaPageState extends State<JavaPage> {
  HiveRepo hiveRep = HiveRepo();
  List<String> java = [];
  List<String> javaTime = [];
  int index = 0;
  List<TestModel> list = [];
  String answer = '';
  int score = 0;
  String satr = '';
  final player = AudioPlayer();
  final player5 = AudioPlayer();
  final player2 = AudioPlayer();
  final player3 = AudioPlayer();

  @override
  void initState() {
    super.initState();
    satr = hiveRep.getNames();
    java = hiveRep.getResultJava();
    javaTime = hiveRep.getTimeJava();
    list = javaQuestions;
    audio10.play(AssetSource('assets/audio/history.mp3'));
    player3.play(AssetSource(
        'assets/audio/correct.wav'));
    player.play(AssetSource('assets/audio/good.mp3'));
    player2.play(AssetSource('assets/audio/epic.mp3'));
    player5.play(AssetSource('assets/audio/casual.mp3'));
  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          backgroundColor: Colors.blue,
          body: Stack(children: [
            Image.asset(Images1.java),
            Padding(
              padding: const EdgeInsets.only(top: 10, left: 10),
              child: IconButton(
                onPressed: () {
                  HapticFeedback.vibrate();
                  player.pause();
                  showDialog(
                    barrierDismissible: false,
                    context: context,
                    builder: (context) {
                      return Dialog(
                        alignment: Alignment.center,
                        insetPadding: const EdgeInsets.only(top: 250,bottom: 350,right: 50,left: 50),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const SizedBox(
                              height: 30,
                            ),
                            const Center(
                              child: Text(
                                'are you sure to leave quiz',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: Color(0xff5B1CAE),
                                  fontSize: 30,
                                ),
                                maxLines: 3,
                              ),
                            ),
                            const SizedBox(
                              height: 50,
                            ),
                            ClipRRect(
                              borderRadius: BorderRadius.circular(20),
                              child: Padding(
                                padding: const EdgeInsets.only(),
                                child: Row(
                                  mainAxisAlignment:
                                  MainAxisAlignment.spaceBetween,
                                  children: [
                                    Container(
                                      height: 60,
                                      width: 85,
                                      color: Colors.blue,
                                      child: TextButton(
                                          onPressed: () {
                                            HapticFeedback.vibrate();
                                            Navigator.pop(context);
                                            setState(() {
                                              player.resume();
                                            });
                                          },
                                          child: const Text(
                                            'no',
                                            style: TextStyle(
                                                color: Color(0xff5B1CAE),
                                                fontSize: 25),
                                          )),
                                    ),
                                    Container(
                                      height: 60,
                                      width: 85,
                                      color: Colors.blue,
                                      child: TextButton(
                                          onPressed: () {
                                            HapticFeedback.vibrate();
                                            Navigator.pop(context);
                                            Navigator.pop(context);
                                            setState(() {
                                              player.pause();
                                            });
                                          },
                                          child: const Text(
                                            'yes',
                                            style: TextStyle(
                                                color: Color(0xff5B1CAE),
                                                fontSize: 25),
                                          )),
                                    )
                                  ],
                                ),
                              ),
                            )
                          ],
                        ),
                      );
                    },
                  );
                },
                icon: const Icon(Icons.arrow_circle_left_outlined,color: Colors.black,size: 35),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 350, right: 10),
              child: Align(
                alignment: Alignment.topRight,
                child: IconButton(
                  onPressed: () {
                    HapticFeedback.vibrate();
                    setState(() {
                      if(tapMusic == 2) {
                        tapMusic = 1;
                        audio10.pause();
                      } else {
                        tapMusic = 2;
                        audio10.resume();
                      }
                    });
                  },
                  icon: tapMusic == 2 ? const Icon(Icons.music_off,size: 30,) : const Icon(Icons.music_note,size: 30),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 250, left: 50),
              child: Container(
                height: 136,
                width: 316,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(14),
                    boxShadow: const [
                      BoxShadow(
                          blurRadius: 15,
                          blurStyle: BlurStyle.outer,
                          color: Colors.deepPurple)
                    ]),
                child: Center(
                  child: Text(
                    list[index].question,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      color: Colors.deepPurple,
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 450, left: 50),
              child: Container(
                  height: 55,
                  width: 316,
                  decoration: BoxDecoration(
                      color: answer == list[index].answerA
                          ? const Color(0xffC7A8FC)
                          : Colors.white,
                      borderRadius: BorderRadius.circular(14),
                      boxShadow: [
                        BoxShadow(
                            blurStyle: BlurStyle.outer,
                            blurRadius: 15,
                            color: Colors.green,
                            spreadRadius: answer == list[index].answerA ? 2 : 0)
                      ]),
                  child: MaterialButton(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(14)),
                    onPressed: () {
                      HapticFeedback.vibrate();
                      setState(() {
                        answer = list[index].answerA;
                        player.resume();
                      });
                    },
                    child: Row(
                      children: [
                        const SizedBox(
                          width: 5,
                        ),
                        const Text(
                          'A',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontSize: 19, fontWeight: FontWeight.w500),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Expanded(
                          child: Text(
                            list[index].answerA,
                            textAlign: TextAlign.center,
                            maxLines: 3,
                            style: const TextStyle(
                                color: Colors.deepPurple,
                                fontSize: 16,
                                fontWeight: FontWeight.w500),
                          ),
                        ),
                      ],
                    ),
                  )),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 520, left: 50),
              child: Container(
                  height: 55,
                  width: 316,
                  decoration: BoxDecoration(
                      color: answer == list[index].answerB
                          ? const Color(0xffC7A8FC)
                          : Colors.white,
                      borderRadius: BorderRadius.circular(14),
                      boxShadow: const [
                        BoxShadow(
                            blurStyle: BlurStyle.outer,
                            blurRadius: 15,
                            color: Colors.green,
                            spreadRadius: 2)
                      ]),
                  child: MaterialButton(
                    onPressed: () {
                      HapticFeedback.vibrate();
                      setState(() {
                        answer = list[index].answerB;
                        player.resume();
                      });
                    },
                    child: Row(
                      children: [
                        const SizedBox(
                          width: 5,
                        ),
                        const Text(
                          'B',
                          style: TextStyle(
                            fontSize: 19,
                            fontWeight: FontWeight.w500,
                          ),
                          maxLines: 50,
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Expanded(
                          child: Text(
                            list[index].answerB,
                            textAlign: TextAlign.center,
                            maxLines: 3,
                            style: const TextStyle(
                                color: Colors.deepPurple,
                                fontSize: 16,
                                fontWeight: FontWeight.w500),
                          ),
                        ),
                      ],
                    ),
                  )),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 600, left: 50),
              child: Container(
                  height: 55,
                  width: 316,
                  decoration: BoxDecoration(
                      color: answer == list[index].answerC
                          ? const Color(0xffC7A8FC)
                          : Colors.white,
                      borderRadius: BorderRadius.circular(14),
                      boxShadow: const [
                        BoxShadow(
                            blurStyle: BlurStyle.outer,
                            blurRadius: 15,
                            color: Colors.green,
                            spreadRadius: 2)
                      ]),
                  child: MaterialButton(
                    onPressed: () {
                      HapticFeedback.vibrate();
                      setState(() {
                        answer = list[index].answerC;
                        player.resume();
                      });
                    },
                    child: Row(
                      children: [
                        const SizedBox(
                          width: 5,
                        ),
                        const Text(
                          'C',
                          textAlign: TextAlign.center,
                          maxLines: 3,
                          style: TextStyle(
                              fontSize: 19, fontWeight: FontWeight.w500),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Expanded(
                          child: Text(
                            list[index].answerC,
                            textAlign: TextAlign.center,
                            maxLines: 3,
                            style: const TextStyle(
                                color: Colors.deepPurple,
                                fontSize: 16,
                                fontWeight: FontWeight.w500),
                          ),
                        ),
                      ],
                    ),
                  )),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 680, left: 50),
              child: Container(
                  height: 55,
                  width: 316,
                  decoration: BoxDecoration(
                      color: answer == list[index].answerD
                          ? const Color(0xffC7A8FC)
                          : Colors.white,
                      borderRadius: BorderRadius.circular(14),
                      boxShadow: const [
                        BoxShadow(
                            blurStyle: BlurStyle.outer,
                            blurRadius: 15,
                            color: Colors.green,
                            spreadRadius: 2)
                      ]),
                  child: MaterialButton(
                    onPressed: () {
                      HapticFeedback.vibrate();
                      setState(() {
                        answer = list[index].answerD;
                        player.resume();
                      });
                    },
                    child: Row(
                      children: [
                        const SizedBox(
                          width: 5,
                        ),
                        const Text(
                          'D',
                          maxLines: 3,
                          style: TextStyle(
                              fontSize: 19, fontWeight: FontWeight.w500),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Expanded(
                          child: Text(
                            list[index].answerD,
                            textAlign: TextAlign.center,
                            maxLines: 3,
                            style: const TextStyle(
                                color: Colors.deepPurple,
                                fontSize: 16,
                                fontWeight: FontWeight.w500),
                          ),
                        ),
                      ],
                    ),
                  )),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 760, left: 100),
              child: Container(
                height: 70,
                width: 200,
                decoration: BoxDecoration(
                    color: Colors.deepPurple,
                    borderRadius: BorderRadius.circular(14),
                    boxShadow: const [
                      BoxShadow(
                          blurStyle: BlurStyle.outer,
                          blurRadius: 5,
                          color: Colors.red)
                    ]),
                child: MaterialButton(
                    onPressed: () {
                      setState(() {
                        HapticFeedback.vibrate();
                        player2.resume();
                        if (answer.isEmpty) {
                          ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                  content: Text('Select your answer')));
                          return;
                        }
                        java.add('$score/${list.length}');
                        hiveRep.saveResultJava(java);
                        String now = dateTimes();
                        javaTime.add(now);
                        hiveRep.saveTimeJava(javaTime);


                        answer == list[index].correctAnswer
                            ? score++
                            : answer = '';
                        index++;
                        if (index == list.length) {
                          index--;
                          Navigator.pushReplacement(
                              context,
                              CupertinoPageRoute(
                                builder: (context) =>
                                    Result(score: score, count: list.length),
                              ));
                        }
                      });
                    },
                    child: Text(
                      index == list.length - 1 ? 'finish' : 'next',
                      style: const TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.w500),
                    )),
              ),
            ),
          ])),
    );
  }
  dateTimes() {
    DateTime dateTime = DateTime.now();
    String now = dateTime.toString();
    int count = now.indexOf('.');
    now = now.substring(0,count);
    return now;
  }
}
