


import 'package:flutter/material.dart';

//==================Teacher Class with Provider=============
class Teacher {
  
  Map<String, dynamic>? teacherInfo;
  bool isHead = false;
  List<String>? subNames;
  List<Map<String, dynamic>>? subjects;

  Teacher();

  // Future<void> updateData(double value) async{
  //   memberInfo!['completedscores'] += value;
  //   await FirebaseFirestore.instance
  //     .collection('organisations')
  //     .doc(getFirstThreeLetters(memberInfo!['uniquecode']))
  //     .collection('members')
  //     .doc(memberInfo!['uniquecode'])
  //     .update(memberInfo!);
      
}


//-----------Teacher Provider-------------
class TeacherProvider extends ChangeNotifier {
  Teacher? _currentTeacher;

  Teacher? get currentTeacher => _currentTeacher;

  void setCurrentTeacher(Teacher teacher) {
    _currentTeacher = teacher;
    notifyListeners();
  }
}


//======================subject with Provider=============
class Subject{

  String? name, totalTopics,totalTeachers;
  List<Map<String,dynamic>>? topics;

  Subject();

  void increaseTopicsCount(){
    int newValue = int.parse(totalTopics!) + 1;
    totalTopics = newValue.toString();
    
  }

  void increaseTeachersCount(){
    int newValue = int.parse(totalTeachers!) + 1;
    totalTeachers = newValue.toString();
    
  }

  void updateSubjectName(String newName){
    name = newName;
  }

}

//----------Provider for subject
class SubjectProvider extends ChangeNotifier {
  Subject? _currentSubject;

  Subject? get currentTeacher => _currentSubject;

  void setCurrentTeacher(Subject subject) {
    _currentSubject = subject;
    notifyListeners();
  }
}


//============Topic class with provider=========
class Topic{

  String? title,totalSubtopics;
  List<Map<String,dynamic>>? subTopics;

  Topic();

  void increaseTopicsCount(){
    int newValue = int.parse(totalSubtopics!) + 1;
    totalSubtopics = newValue.toString();
    
  }

  int getCompletedCount(){
    int count = subTopics?.where((map) => map['completed']).length ?? 0;

    return count;
  }
  

}

//-------Topic provider
class TopicProvider extends ChangeNotifier {
  Topic? _currentTopic;

  Topic? get currentTeacher => _currentTopic;

  void setCurrentTeacher(Topic topic) {
    _currentTopic = topic;
    notifyListeners();
  }
}



//==================Head Teacher Class with Provider=============
class HeadTeacher {
  
  Map<String, dynamic>? headTeacherInfo;
  bool isHead = true;
  List<Map<String, dynamic>>? teachers;
  List<Map<String, dynamic>>? subjects;

  HeadTeacher();

  // Future<void> updateData(double value) async{
  //   memberInfo!['completedscores'] += value;
  //   await FirebaseFirestore.instance
  //     .collection('organisations')
  //     .doc(getFirstThreeLetters(memberInfo!['uniquecode']))
  //     .collection('members')
  //     .doc(memberInfo!['uniquecode'])
  //     .update(memberInfo!);
      
}


//-----------Head Teacher Provider-------------
class HeadTeacherProvider extends ChangeNotifier {
  HeadTeacher? _currentTeacher;

  HeadTeacher? get currentTeacher => _currentTeacher;

  void setCurrentTeacher(HeadTeacher teacher) {
    _currentTeacher = teacher;
    notifyListeners();
  }
}