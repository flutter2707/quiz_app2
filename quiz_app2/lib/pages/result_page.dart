import 'package:flutter/material.dart';
import '../tools/images.dart';
// ignore: must_be_immutable
class Result extends StatelessWidget {
  int score;
  int count;
  Result({super.key,required this.score,required this.count});

  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(
      body: Stack(
        children: [
          Image.asset(Images1.result,
            width: double.infinity,
            height: double.infinity,
            fit: BoxFit.fill,),
          Padding(
            padding: const EdgeInsets.only(top: 550,left: 70),
            child: Image.asset(Images1.resultIn,
              alignment: Alignment.bottomCenter,
              width: 300,
              height: 300,
            ),
          ),
          Align(
            alignment: Alignment.center,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Completed\n  $score/$count',textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 25
                  ),
                ),const SizedBox(height: 20,),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    boxShadow: const [BoxShadow(blurStyle: BlurStyle.outer,blurRadius: 15,color: Colors.deepPurple)]
                  ),
                  child: TextButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    style:  ButtonStyle(
                        shape: MaterialStateProperty.all(LinearBorder.none),
                      textStyle: MaterialStateProperty.all(
                          const TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                              fontStyle: FontStyle.italic
                          ),
                      ),
                      backgroundColor: MaterialStateProperty.all(Colors.white)
                    ),
                      child: const Text('Go Home',
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w500,
                            fontSize: 25),)
                  ),
                )
              ],
            ),
          )
        ],
      ),
    ));
  }
}
