import 'package:hive/hive.dart';

import 'lesson_models.dart';

class HiveRepo{
  final Box _box = Hive.box("name");

  final Box _time = Hive.box('result');

  saveNames(String satr){
    _box.put("lessonName", satr);
  }

  getNames() => _box.get("lessonName",defaultValue: '');

  saveTimeCpp(List<String> list) {
    _box.put('cppTime', list);
  }
  getTimeCpp() => _box.get('cppTime',defaultValue: <String> []);

  saveTimeJava(List<String> list) {
    _box.put('javaTime', list);
  }

  getTimeJava() => _box.get('javaTime',defaultValue: <String> []);

  saveTimePy(List<String> list) {
    _box.put('pythonTime', list);
  }

  getTimePy() => _box.get('pythonTime',defaultValue: <String> []);

  saveResultCpp(List<String> list) {
    _time.put('c++', list);
  }

  getResultCpp() => _time.get('c++',defaultValue: <String> []);

  saveResultJava(List<String> list) {
    _time.put('java', list);
  }

  getResultJava() => _time.get('java',defaultValue: <String> []);

  saveResultPy(List<String> list) {
    _time.put('pythonResult', list);
  }

  getResultPy() => _time.get('pythonResult',defaultValue: <String> []);

}