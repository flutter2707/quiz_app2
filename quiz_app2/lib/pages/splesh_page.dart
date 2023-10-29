import 'package:flutter/material.dart';
import 'package:quiz_app2/pages/main_page.dart';

import '../tools/images.dart';

class SpleshPage extends StatefulWidget {
  const SpleshPage({super.key});

  @override
  State<SpleshPage> createState() => _SpleshPageState();
}

class _SpleshPageState extends State<SpleshPage> {

  @override
  void initState() {
    Future.delayed(const Duration(seconds: 3),() {
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const MainPage(),));
    },);
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            Image.asset(Images1.assetImage,height: double.infinity,width: double.infinity,fit: BoxFit.fill,),
            const Center(
                child: Text('QuizApp',style: TextStyle(
                  fontWeight: FontWeight.w900,
                  color: Colors.white,
                  fontSize: 50
                ),)
            )
          ],
        ),
      ),
    );
  }
}
