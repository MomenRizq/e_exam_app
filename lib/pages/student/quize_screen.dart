import 'package:e_exam_app/pages/student/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class quizeScreen extends StatefulWidget {
  final List<String> Questions;

  final List<String> answer1;

  final List<String> answer2;

  final List<String> answer3;

  final List<String> answer4;

  final List<String> correctanswer;

  final String idExam ;
  final String token ;
  final String? Email ;
  final String? pass ;

  quizeScreen(
      {required this.Questions,
        required this.answer1,
        required this.answer2,
        required this.answer3,
        required this.answer4,
        required this.correctanswer,   required this.idExam,required this.token , this.Email ,this.pass });

  @override
  _quizeScreenState createState() => _quizeScreenState();
}

class _quizeScreenState extends State<quizeScreen> {
  int j = 0;

  int grade = 0;

  bool disableAnswer = false;

 String allAnswers = "" ;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'E exam',
        ),
      ),
      body: ListView(
        children: [
          if(j !=widget.Questions.length)
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                if (j < widget.Questions.length)
                  MaterialButton(
                    onPressed: () => {
                      setState(() {
                      })
                    },
                    child: Text(
                      widget.Questions[j],
                      style: TextStyle(
                        color: Colors.black,
                        fontFamily: "Alike",
                        fontSize: 20.0,
                      ),

                    ),
                    splashColor: Colors.indigo[700],
                    highlightColor: Colors.indigo[700],
                    minWidth: 200.0,
                    height: 200.0,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20.0)),
                  ),
                Container(
                  width: double.infinity,
                  padding: EdgeInsets.all(25),
                  decoration: BoxDecoration(
                    color: Theme.of(context).primaryColor,
                    borderRadius: BorderRadius.circular(10),
                    gradient: LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        colors: [
                          Theme.of(context).primaryColor,
                          Theme.of(context).accentColor
                        ]),
                  ),
                  child: InkWell(
                    onTap: () {
                      allAnswers= widget.answer1[j];
                      checkanswer(allAnswers);
                      setState(() {
                        // quizeScreen(Questions: widget.Questions, answer1: widget.answer1, answer2: widget.answer2, answer3: widget.answer3, answer4: widget.answer4, correctanswer: widget.correctanswer);
                      });

                    },
                    child: Text(
                      widget.answer1[j],
                      style: TextStyle(
                          fontSize: 15,
                          color: Colors.white),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
                SizedBox(height: 10,),
                Container(
                  width: double.infinity,
                  padding: EdgeInsets.all(25),
                  decoration: BoxDecoration(
                    color: Theme.of(context).primaryColor,
                    borderRadius: BorderRadius.circular(10),
                    gradient: LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        colors: [
                          Theme.of(context).primaryColor,
                          Theme.of(context).accentColor
                        ]),
                  ),
                  child: InkWell(
                    onTap: () {
                      allAnswers= widget.answer2[j];
                      checkanswer(allAnswers);
                      setState(() {
                        // quizeScreen(Questions: widget.Questions, answer1: widget.answer1, answer2: widget.answer2, answer3: widget.answer3, answer4: widget.answer4, correctanswer: widget.correctanswer);
                      });
                    },
                    child: Text(
                      widget.answer2[j],
                      style: TextStyle(
                          fontSize: 15,
                          color: Colors.white),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
                SizedBox(height: 10,),
                Container(
                  width: double.infinity,
                  padding: EdgeInsets.all(25),
                  decoration: BoxDecoration(
                    color: Theme.of(context).primaryColor,
                    borderRadius: BorderRadius.circular(10),
                    gradient: LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        colors: [
                          Theme.of(context).primaryColor,
                          Theme.of(context).accentColor
                        ]),
                  ),
                  child: InkWell(
                    onTap: (){

                      allAnswers= widget.answer3[j];
                      checkanswer(allAnswers);
                      setState(() {

                        // quizeScreen(Questions: widget.Questions, answer1: widget.answer1, answer2: widget.answer2, answer3: widget.answer3, answer4: widget.answer4, correctanswer: widget.correctanswer);
                      });
                    },
                    child: Text(
                      widget.answer3[j],
                      style: TextStyle(
                          fontSize: 15,
                          color: Colors.white),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
                SizedBox(height: 10,),
                Container(
                  width: double.infinity,
                  padding: EdgeInsets.all(25),
                  decoration: BoxDecoration(
                    color: Theme.of(context).primaryColor,
                    borderRadius: BorderRadius.circular(10),
                    gradient: LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        colors: [
                          Theme.of(context).primaryColor,
                          Theme.of(context).accentColor
                        ]),
                  ),
                  child: InkWell(
                    onTap: () {
                      allAnswers= widget.answer4[j];
                      checkanswer(allAnswers);
                      setState(() {
                      });
                    },
                    child: Text(
                      widget.answer4[j],
                      style: TextStyle(
                          fontSize: 15,
                          color: Colors.white),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
                SizedBox(height: 10,),

              ],
            ),
          ),
          if(j ==widget.Questions.length)
            Center(
              child: Column(
                children: [
                  Text(
                    'Great job !',
                    style: TextStyle(
                        fontSize:30 , fontWeight: FontWeight.bold),
                  ),
                  Text(
                    'Your Degree is ${grade} !',
                    style: TextStyle(color: Colors.grey),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      quizDone(widget.idExam, grade, widget.token);
                    },
                    child: Container(
                      padding: EdgeInsets.all(15),
                      child: Text(
                        'Done ',
                        style: TextStyle(color: Colors.black),
                      ),
                    ),
                    style: ButtonStyle(
                        backgroundColor:
                        MaterialStateProperty.all(Colors.blue),
                        shape: MaterialStateProperty.all(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30),
                          ),
                        )),
                  ),
                ],
              ),
            )
        ],
      ),
    );
  }

  void checkanswer(String k) {
    if (k == widget.correctanswer[j]) {
      setState(() {
        grade += 1;
        print(("true : ${grade}"));
        j++;
        print("j in true $j");
      });
    } else
    setState(() {

      j++;
      print("j in false $j");
    });
  }

  Future<void> quizDone(String idExam , int Grad , String token) async {
    var jsonData = null;
    var uri = 'https://app-e-exam.herokuapp.com/addGrad';
    Map data = {
      "exam":idExam,
      "yourScore": Grad

    };
    var body = json.encode(data);
    var response = await http.post(Uri.parse(uri),
        headers: {
          "Content-Type": "application/json",
          'Authorization': 'Bearer $token'
        },
        body: body);
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    jsonData = json.decode(response.body);
    if (response.statusCode == 200) {
      setState(() {
      });
      print(jsonData);
    } else {
      print(jsonData);
    }
  }
}