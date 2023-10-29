import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:quiz_app2/pages/splesh_page.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  await Hive.openBox("name");
  await Hive.openBox("result");

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SpleshPage(),
    );
  }
}