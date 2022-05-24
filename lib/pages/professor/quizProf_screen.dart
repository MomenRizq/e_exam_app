import 'package:flutter/material.dart';

class quizeProfScreen extends StatefulWidget {
  final List<String> Questions;

  final List<String> answer1;

  final List<String> answer2;

  final List<String> answer3;

  final List<String> answer4;

  final List<String> correctanswer;

  quizeProfScreen(
      {required this.Questions,
        required this.answer1,
        required this.answer2,
        required this.answer3,
        required this.answer4,
        required this.correctanswer});

  @override
  _quizeProfScreenState createState() => _quizeProfScreenState();
}

class _quizeProfScreenState extends State<quizeProfScreen> {
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
            for(int i = 0 ; i < widget.Questions.length ; i++ )
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
}