
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:monitor_me/backend/classes.dart';
import 'package:provider/provider.dart';

// admin login
Future<bool> fetchHeadData( BuildContext context, String pin) async {
  bool state = false;
  final usersnap = FirebaseFirestore.instance
      .collection('schools');

  final adminorg = await usersnap.where('uniqueId', isEqualTo: "head").get();

  if(adminorg.docs.isNotEmpty && adminorg.docs.first['pin'] == pin){
    HeadTeacher teacher = HeadTeacher();
    teacher.headTeacherInfo = adminorg.docs.first.data();
    try{
    final teachers = await  usersnap.doc(adminorg.docs.first.id).collection('teachers').get();
    teacher.teachers = teachers.docs.where((doc) => doc.id != 'default').map((doc){return doc.data();}).toList();
    final subjects = await  usersnap.doc(adminorg.docs.first.id).collection('subjects').get();
    teacher.subjects = subjects.docs.where((doc) => doc.id != 'default').map((doc){return doc.data();}).toList();
    }catch(e){
      debugPrint("Error fetching admin data: $e");
    }

    Provider.of<HeadTeacherProvider>(context,listen:false).setCurrentTeacher(teacher);
    state = true;
    
  }
  debugPrint("State value: $state");
  return state;
}


// admin login
Future<bool> fetchTeacherData(BuildContext context, String pin) async {
  bool state = false;
  final usersnap = FirebaseFirestore.instance.collection('schools');

  final adminorg = await usersnap.doc('berekuso').collection('teachers').get();
  debugPrint("Before filtering for pin");

  // Filter out documents with ID "default" and find the one that matches the provided pin
  final matchingDoc = adminorg.docs
      .where((doc) => doc.id != 'default' && doc['pin'] == pin)
      .toList();

  if (matchingDoc.isNotEmpty) {
    debugPrint("Document with matching pin found");

    // Populate Teacher object
    Teacher teacher = Teacher();
    teacher.teacherInfo = matchingDoc.first.data();

    final subs = await usersnap
        .doc('berekuso')
        .collection('teachers')
        .doc(teacher.teacherInfo!['docId'])
        .collection('subjects')
        .get();

    final subsData = subs.docs
        .where((doc) => doc.id != 'default')
        .map((doc) => doc.data())
        .toList();
    debugPrint('SubsData: $subsData');

    try {
      final subjects = await usersnap
          .doc('berekuso')
          .collection('subjects')
          .get();
      debugPrint('subjects collection: $subjects');
      teacher.subjects ??= [];
      for (Map<String, dynamic> sub in subsData) {
        subjects.docs
            .where((doc) => doc['name'] == sub['name'])
            .forEach((doc) {
          teacher.subjects!.add(doc.data());
          debugPrint('subject fetched: ${doc.data()}');
        });
      }
    } catch (e) {
      debugPrint("Error fetching admin data: $e");
    }

    Provider.of<TeacherProvider>(context, listen: false).setCurrentTeacher(teacher);
    state = true;
  } else {
    debugPrint("No document with matching pin found.");
  }

  debugPrint("Teacher State value: $state");
  return state;
}



// adding new subject to the system
Future<void> addNewSubject(String subjectName)async {
  
  final newSubDoc = FirebaseFirestore.instance.collection('schools').doc('berekuso')
  .collection('subjects').doc(subjectName.toLowerCase().replaceAll(" ", "_"));
  await newSubDoc.set({
    "name": subjectName,
  });

  await newSubDoc.collection('tutors').doc('default').set({"name":"default"});
  await newSubDoc.collection('topics').doc('default').set({"name":"default"});
}


Future<void> addNewTeacher(String firstname,lastname)async {
  final fullname = '${firstname}_'+lastname;
  final newTeachDoc = FirebaseFirestore.instance.collection('schools').doc('berekuso')
  .collection('teachers').doc(fullname.toLowerCase());
  await newTeachDoc.set({
    "firstname": firstname,
    "lastname": lastname,
    "docId": fullname.toLowerCase(),
  });

  await newTeachDoc.collection('subjects').doc('default').set({"name":"default"});
}

// Assign teacher to subject

// remove teacher from subject

//create subject topic

// create subtopic for a subject

//edit subject name

//edit teacher details

// edit subtopic

//edit headmaster name

// edit headmaster contact

// edit teacher name

// edit teacher contact

// update subtopic completion status



//delete a teacher

//delete a subject

// delete a topic

// delete a subtopic



