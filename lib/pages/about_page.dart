import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';


class AboutPage extends StatelessWidget {
  AboutPage({super.key});
  final player1 = AudioPlayer();

  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(

      body: Stack(
        children: [
          Image.asset('assets/image/img.png',height: double.infinity,width: double.infinity,fit: BoxFit.fill,),

          Padding(
            padding: const EdgeInsets.only(top: 60,left: 30),
            child: Align(
                alignment: Alignment.topLeft,
                child: Image.asset('assets/image/imgapp.jpg',height: 150,width: 150)),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 15,left: 10),
            child: IconButton(
                onPressed: (){
                  HapticFeedback.vibrate();
                  player1.play(AssetSource("audio/bottom.mp3"));
                  Navigator.pop(context);
                },
                icon: const Icon(Icons.arrow_back_ios_new,color: Colors.white,size: 30,)
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(left: 20,right: 10,top: 200),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text("This Quiz game is made by Nodirbek Eshboyev in 2023/10/23"
                  " this game is so interesting and useful if you play it you will definitely learn a lot of"
                  " knowledge about programming language in this game you should choose one of programming languages"
                  " after that there are questions and A,B,C,D answer tests you must select one of them when you finish"
                  " selecting all test after submiting you can see your result",
                style: TextStyle(color: Colors.white,fontWeight: FontWeight.w500,fontSize: 22),),
            ),
          )
        ],
      ),

    ));
  }
}
