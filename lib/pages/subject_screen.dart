import 'dart:convert';
import 'dart:io';
import 'dart:math';

import 'package:dio/dio.dart';
import 'package:e_exam_app/common/theme_helper.dart';
import 'package:e_exam_app/pages/exam_box_Screen.dart';
import 'package:e_exam_app/pages/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'widgets/subjectItems.dart';
import 'package:e_exam_app/Data.dart';
import 'package:http/http.dart' as http;

class subjectScreen extends StatefulWidget {
  final List SubjectsName;
  final List SubjectsId;
  final token;

  const subjectScreen(this.SubjectsName, this.SubjectsId, this.token);

  @override
  State<subjectScreen> createState() => _subjectScreenState();
}

class _subjectScreenState extends State<subjectScreen> {
  String? id;

  var random_array;

  bool _isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Subject",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        elevation: 0.5,
        iconTheme: IconThemeData(color: Colors.white),
        flexibleSpace: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: <Color>[
                Theme.of(context).primaryColor,
                Theme.of(context).accentColor,
              ])),
        ),
      ),
      body: GridView(
          padding: EdgeInsets.all(25.0),
          gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: 300,
            childAspectRatio: 3 / 0.95,
            crossAxisSpacing: 13,
            mainAxisSpacing: 13,
          ),
          children: <Widget>[
            for (int i = 0; i < widget.SubjectsName.length; i++)
              InkWell(
                child: Container(
                  padding: EdgeInsets.all(25),
                  decoration: BoxDecoration(
                    color: Theme.of(context).primaryColor,
                    borderRadius: BorderRadius.circular(15),
                    gradient: LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        colors: [
                          Theme.of(context).primaryColor,
                          Theme.of(context).accentColor
                        ]),
                  ),
                  child: Text(
                    widget.SubjectsName[i],
                    style: TextStyle(
                        fontSize: 23,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                    textAlign: TextAlign.center,
                  ),
                ),
                onTap: () {
                  id = widget.SubjectsId[i];
                  Ex(id!, widget.token);
                  print(widget.SubjectsName.toString());
                  print(id);
                },
              )
          ]),
    );
  }

  Ex(String id, String token) async {
    var jsonData = null;

    Map<String, String> queryParams = {
      'subject': id,
    };
    Map<String, String> header = {
      HttpHeaders.authorizationHeader: "Bearer $token",
      HttpHeaders.contentTypeHeader: "application/json"
    };
    String url = "https://app-e-exam.herokuapp.com/getSpacificExam";
    var uri = Uri(
      scheme: 'https',
      host: 'app-e-exam.herokuapp.com',
      path: 'getSpacificExam/$id',
      queryParameters: queryParams
    );

    var response = await http.get(uri,headers: header);
    if (response.statusCode == 200) {
      var json = jsonDecode(response.body);
      print(response.body);
      // Do whatever you want to do with json.
    }
     else {
      print(response.body);
      // message = jsonData["message"] ;
      //Future.delayed(const Duration(milliseconds: 2000), () {
      //showAlertDialog(context);
      //});
    }
  }
}
