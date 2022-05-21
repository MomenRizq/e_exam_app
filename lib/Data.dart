import 'package:flutter/material.dart';
import 'package:e_exam_app/pages/home_screen.dart';

class subject{
  final String id;

  final String subjectName;

  subject({ required this.id, required this.subjectName});
}



List<subject> DUMMY_Subject =[
 subject(id:"a1", subjectName:"information technology"),
  subject(id: "a2", subjectName: "computer science"),
  subject(id: "a3", subjectName: "software engineering"),


];
