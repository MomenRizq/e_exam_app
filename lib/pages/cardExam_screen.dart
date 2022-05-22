import 'package:flutter/material.dart';

class cardExams extends StatelessWidget {
  final String idExam ;
  final String nameOfExam;
  final int timer ;
  final int Score;

  const cardExams({required this.idExam, required this.nameOfExam,required this.timer, required this.Score});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            "Exams",
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
            padding: EdgeInsets.all(25),
            gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
              maxCrossAxisExtent: 300,
              childAspectRatio: 3 /1.25,
              crossAxisSpacing: 15,
              mainAxisSpacing: 15,
            ),
            children: [
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
                  child: ListTile(
                    title: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10.0),
                      child: Text(
                        nameOfExam,
                        style: TextStyle(
                            fontSize: 23,
                            fontWeight: FontWeight.bold,
                            color: Colors.white
                        ),
                        textAlign: TextAlign.start,
                      ),
                    ),
                    subtitle: Padding(
                      padding: const EdgeInsets.only(left:2),
                      child: Text(
                        "Time : ${timer}  Score:${Score}",
                        style: TextStyle(fontSize: 12, color: Colors.white ,),
                      ),
                    ),
                    trailing: IconButton(
                      onPressed: () {},
                      icon: Icon(Icons.play_arrow , size: 50,color: Colors.white,),
                    ),
                  ),
                ),

              ),
            ]));
  }
}
