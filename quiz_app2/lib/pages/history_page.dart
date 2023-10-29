import 'package:audioplayers/audioplayers.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:quiz_app2/models/hive_repo.dart';

class HistoryPage extends StatefulWidget {
  const HistoryPage({super.key});

  @override
  State<HistoryPage> createState() => _HistoryPageState();
}

class _HistoryPageState extends State<HistoryPage> {
  HiveRepo hiveRepo = HiveRepo();
  List<String> cpp = [];
  List<String> java = [];
  List<String> python = [];
  List<String> cppTime = [];
  List<String> javaTime = [];
  List<String> pythonTime = [];
  int controller = 0;
  final player = AudioPlayer();

  @override
  void initState() {
    cpp = hiveRepo.getResultCpp();
    java = hiveRepo.getResultJava();
    python = hiveRepo.getResultPy();
    cppTime = hiveRepo.getTimeCpp();
    javaTime = hiveRepo.getTimeJava();
    pythonTime = hiveRepo.getTimePy();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        bottom: false,
        child: Scaffold(
          body: Stack(
            children: [
              controller == 0 ? const Image(image: AssetImage('assets/image/c++.png')) :
                  controller == 1 ? const Image(image: AssetImage('assets/image/java.png')) :
                      const Image(image: AssetImage('assets/image/python.png')),
              Padding(padding: const EdgeInsets.only(top: 20, left: 15),
                child: IconButton(
                  onPressed: () {
                    player.play(AssetSource('assets/audio/drone.mp3'));
                    Navigator.pop(context);
                    HapticFeedback.vibrate();
                  },
                  icon: const Icon(Icons.arrow_circle_left_outlined,color: Colors.white,size: 35,),
                ),
              ),
              Padding(padding: const EdgeInsets.only(top: 300),
                child: Align(
                  alignment: Alignment.topCenter,
                  child: Text(controller == 0 ? 'C++ Results'
                      : controller == 1 ? 'Java Results' : 'Python Results',
                    style: const TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.w700,
                      color: Colors.cyanAccent
                    ),
                  ),
                ),
              ),
              Padding(padding: const EdgeInsets.only(top: 380,left: 20),
                child: Align(
                  alignment: Alignment.center,
                  child: SizedBox(
                    height: 500,
                    width: double.infinity,
                    child: ListView.builder(itemBuilder: (context, index) {
                      return SizedBox(
                        height: 60,
                        child: controller == 0 ? Text('Result: ${cpp[index]} ${cppTime[index]}',
                          style: const TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.w500,
                            color: Colors.cyanAccent
                          ),
                        )
                            : controller == 1 ? Text('Result:  ${java[index]} ${javaTime[index]}',
                          style: const TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.w500,
                              color: Colors.cyanAccent
                          ),
                        )
                            : Text('Result:  ${python[index]} ${pythonTime[index]}',
                          style: const TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.w500,
                              color: Colors.cyanAccent
                          ),
                        )
                      );
                    },
                    itemCount: controller == 0 ? cpp.length
                        : controller == 1 ? java.length
                      : python.length,
                    ),
                  ),
                ),
              )
            ],
          ),
          bottomNavigationBar: CurvedNavigationBar(
            index: 2,
            onTap: (index) {
            setState(() {
              HapticFeedback.vibrate();
              controller = index;
            });
          },
            backgroundColor: Colors.white,
            color: const Color(0xff5B1CAE),

            items: const <Widget>[
              Image(image: AssetImage('assets/image/img_3.png'),height: 50,width: 50,),
              Image(image: AssetImage('assets/image/img_4.png'),height: 50,width: 50,),
              Image(image: AssetImage('assets/image/img_5.png'), height: 50, width: 50,)
            ],

          ),
        )
    );
  }
}