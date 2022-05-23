import 'package:flutter/material.dart';

class quizeScreen extends StatefulWidget {
  final List<String> Questions;

  final List<String> answer1;

  final List<String> answer2;

  final List<String> answer3;

  final List<String> answer4;

  final List<String> correctanswer;

  quizeScreen(
      {required this.Questions,
      required this.answer1,
      required this.answer2,
      required this.answer3,
      required this.answer4,
      required this.correctanswer});

  @override
  _quizeScreenState createState() => _quizeScreenState();
}

class _quizeScreenState extends State<quizeScreen> {
  int j = 0;

  int grade = 0;

  bool disableAnswer = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'E exam',
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            if (j < widget.Questions.length)
              MaterialButton(
                onPressed: () => {
                  setState(() {
                    // quizeScreen(Questions: widget.Questions, answer1: widget.answer1, answer2: widget.answer2, answer3: widget.answer3, answer4: widget.answer4, correctanswer: widget.correctanswer);
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
                onTap: () => {
                  setState(() {
                    j++;
                    print(widget.Questions.length);
                    // quizeScreen(Questions: widget.Questions, answer1: widget.answer1, answer2: widget.answer2, answer3: widget.answer3, answer4: widget.answer4, correctanswer: widget.correctanswer);
                  })
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
                onTap: () => {
                  setState(() {
                    j++;
                    print(widget.Questions.length);
                    // quizeScreen(Questions: widget.Questions, answer1: widget.answer1, answer2: widget.answer2, answer3: widget.answer3, answer4: widget.answer4, correctanswer: widget.correctanswer);
                  })
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
                onTap: () => {
                  setState(() {
                    j++;
                    print(widget.Questions.length);
                    // quizeScreen(Questions: widget.Questions, answer1: widget.answer1, answer2: widget.answer2, answer3: widget.answer3, answer4: widget.answer4, correctanswer: widget.correctanswer);
                  })
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
                onTap: () => {
                  setState(() {
                    j++;
                    print(widget.Questions.length);
                    // quizeScreen(Questions: widget.Questions, answer1: widget.answer1, answer2: widget.answer2, answer3: widget.answer3, answer4: widget.answer4, correctanswer: widget.correctanswer);
                  })
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
            Expanded(
              flex: 6,
              child: AbsorbPointer(
                child: Container(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget choicebutton(String k) {
    return Padding(
      padding: EdgeInsets.symmetric(
        vertical: 10.0,
        horizontal: 20.0,
      ),
      child: MaterialButton(
        onPressed: () => checkanswer(k),
        child: Text(
          widget.answer1[j],
          style: TextStyle(
            color: Colors.white,
            fontFamily: "Alike",
            fontSize: 16.0,
          ),
          maxLines: 1,
        ),
        splashColor: Colors.indigo[700],
        highlightColor: Colors.indigo[700],
        minWidth: 200.0,
        height: 45.0,
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
      ),
    );
  }

  void checkanswer(String k) {
    if (widget.answer1[j] == widget.correctanswer[j]) {
      grade += 1;
    } else {}
    setState(() {
      j++;
    });
  }
}
