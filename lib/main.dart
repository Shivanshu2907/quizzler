import 'package:flutter/material.dart';
import 'quiz_brain.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'QUIZZLER'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<Icon> scoreKeeper = [];
  QuizBrain quizbrain = QuizBrain();
  void checkanswer(bool useranswer) {
    if (quizbrain.isFinished()) {
      Alert(
        context: context,
        type: AlertType.error,
        title: "ALERT!!!",
        desc: "You have finished the quiz",
        buttons: [
          DialogButton(
            child: Text(
              "okay",
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
            onPressed: () {
              setState(() {
                scoreKeeper.clear();
                quizbrain.cl();
              });
              Navigator.pop(context);
            },
            width: 120,
          )
        ],
      ).show();
    } else {
      bool answ = quizbrain.getanswer();
      if (answ == useranswer) {
        setState(() {
          scoreKeeper.add(Icon(
            Icons.check,
            color: Colors.green,
          ));
        });
      } else {
        setState(() {
          scoreKeeper.add(Icon(
            Icons.close,
            color: Colors.red,
          ));
        });
      }
      quizbrain.nextquestion();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  FlatButton(
                      color: Colors.black,
                      onPressed: () {
                        setState(() {
                          scoreKeeper.clear();
                          quizbrain.cl();
                        });
                      },
                      child: Text(
                        'RESET',
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.white,
                        ),
                      )),
                ],
              ),
            ),
            Expanded(
              flex: 5,
              child: Center(
                child: Text(
                  quizbrain.getquestiontext(),
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 40,
                  ),
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: FlatButton(
                  minWidth: 150,
                  color: Colors.green,
                  onPressed: () {
                    checkanswer(true);
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Text(
                      'TRUE',
                      style: TextStyle(fontSize: 30),
                    ),
                  ),
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: FlatButton(
                  minWidth: 150,
                  color: Colors.red,
                  onPressed: () {
                    checkanswer(false);
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Text(
                      'FALSE',
                      style: TextStyle(fontSize: 30),
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 32,
              child: Row(
                children: scoreKeeper,
              ),
            )
          ],
        ),
      ),
    );
  }
}
