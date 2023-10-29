import 'package:quiz_app2/models/test_model.dart';
import 'package:quiz_app2/models/utils.dart';

import '../tools/images.dart';

class LessonModel {
  String icon;
  String name;
  List<TestModel> test;

  LessonModel({
    required this.icon,
    required this.name,
    required this.test
});
}
List<LessonModel> lessons = [
  LessonModel(icon: Images1.assetImage1, name: "C++", test: cppQuestions),
  LessonModel(icon: Images1.assetImage2, name: "Java", test: javaQuestions),
  LessonModel(icon: Images1.assetImage3, name: "Python", test: pythonQuestions),
];