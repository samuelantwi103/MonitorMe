
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:monitor_me/backend/classes.dart';

Future<bool> fetchHeadData( BuildContext context, String uid, String pin) async {
  bool state = false;
  final usersnap = FirebaseFirestore.instance
      .collection('schools');

  final adminorg = await usersnap.where('uniqueId', isEqualTo: "head").get();

  if(adminorg.docs.isNotEmpty && adminorg.docs.first['pin'] == pin){
    Teacher teacher = Teacher();
    teacher.teacherInfo = adminorg.docs.first.data();
    final employees = await  usersnap.doc(adminorg.docs.first.id).collection('members').get();
    admin.employees = employees.docs.where((doc) => doc.id != 'default').map((doc){return doc.data();}).toList();
    final tasks = await  usersnap.doc(adminorg.docs.first.id).collection('tasks').get();
    admin.tasks = tasks.docs.where((doc) => doc.id != 'default').map((doc){return doc.data();}).toList();
    Provider.of<AdminProvider>(context,listen:false).setCurrentAdmin(admin);
    state = true;
    
  }
  return state;
}