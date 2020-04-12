import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

void main() => runApp(MyApp());

const Map<String, String> numToTextMapping = {
  "1": "UNI",
  "2": "BI",
  "3": "FAD",
  "4": "RGB",
  "5": "POL",
  "6": "STR",
  "7": "+++",
  "8": "TIM",
  "9": "---",
  "0": "ON",
  "*": "OFF",
  "#": "OFF"
};

const kKeyPadNumberTextStyle = TextStyle(
  fontSize: 45,
  fontWeight: FontWeight.w400,
);

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Makss Domotic',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Makss Domotic'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String typedNumber = "";
  String srvAddress = "http://192.168.2.36/";

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              SizedBox(
                width: 20,
              ),
              NumberedRoundButton(
                  num: "1",
                  onPressed: () {
                    http.get("http://192.168.2.36/1");
                    setState(() {
                      typedNumber += "1";
                    });
                  }),
              SizedBox(
                width: 20,
              ),
              NumberedRoundButton(
                  num: "2",
                  onPressed: () {
                    http.get("http://192.168.2.36/2");
                    setState(() {
                      typedNumber += "2";
                    });
                  }),
              SizedBox(
                width: 20,
              ),
              NumberedRoundButton(
                  num: "3",
                  onPressed: () {
                    http.get("http://192.168.2.36/3");
                    setState(() {
                      typedNumber += "3";
                    });
                  }),
              SizedBox(
                width: 20,
              )
            ],
          ),
          SizedBox(
            height: 30,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              SizedBox(
                width: 20,
              ),
              NumberedRoundButton(
                  num: "4",
                  onPressed: () {
                    http.get("http://192.168.2.36/4");
                    setState(() {
                      typedNumber += "4";
                    });
                  }),
              SizedBox(
                width: 20,
              ),
              NumberedRoundButton(
                  num: "5",
                  onPressed: () {
                    http.get("http://192.168.2.36/5");
                    setState(() {
                      typedNumber += "5";
                    });
                  }),
              SizedBox(
                width: 20,
              ),
              NumberedRoundButton(
                  num: "6",
                  onPressed: () {
                    http.get("http://192.168.2.36/6");
                    setState(() {
                      typedNumber += "6";
                    });
                  }),
              SizedBox(
                width: 20,
              )
            ],
          ),
          SizedBox(
            height: 30,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              SizedBox(
                width: 20,
              ),
              NumberedRoundButton(
                  num: "7",
                  onPressed: () {
                    http.get("http://192.168.2.36/7");
                    setState(() {
                      typedNumber += "7";
                    });
                  }),
              SizedBox(
                width: 20,
              ),
              NumberedRoundButton(
                  num: "8",
                  onPressed: () {
                    http.get("http://192.168.2.36/8");
                    setState(() {
                      typedNumber += "8";
                    });
                  }),
              SizedBox(
                width: 20,
              ),
              NumberedRoundButton(
                  num: "9",
                  onPressed: () {
                    http.get("http://192.168.2.36/9");
                    setState(() {
                      typedNumber += "9";
                    });
                  }),
              SizedBox(
                width: 20,
              )
            ],
          ),
          SizedBox(
            height: 30,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              SizedBox(
                width: 20,
              ),
              NumberedRoundButton(
                  num: '*',
                  onPressed: () {
                    http.get("http://192.168.2.36/off");
                    setState(() {
                      typedNumber += "*";
                    });
                  }),
              SizedBox(
                width: 20,
              ),
              GestureDetector(
                /// When doing a long tap on 0 button, we enter +
                onLongPress: () {
                  setState(() {
                    typedNumber += '+';
                  });
                },
                child: NumberedRoundButton(
                    num: "0",
                    onPressed: () {
                    http.get("http://192.168.2.36/0");
                      setState(() {
                        typedNumber += "0";
                      });
                    }),
              ),
              SizedBox(
                width: 20,
              ),
              NumberedRoundButton(
                  num: "#",
                  onPressed: () {
                    http.get("http://192.168.2.36/off");
                    setState(() {
                      typedNumber += "#";
                    });
                  }),
              SizedBox(
                width: 20,
              ),
            ],
          ),
          SizedBox(
            height: 30,
          ),
        ],
      ),
    );

  }
}



class NumberedRoundButton extends StatelessWidget {
  NumberedRoundButton({this.num, this.onPressed});

  final String num;
  final Function onPressed;

  @override
  Widget build(BuildContext context) {
    return RoundButton(
      onPressed: this.onPressed,
      child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text("$num", style: kKeyPadNumberTextStyle),
            Text(
              "${numToTextMapping[num]}",
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
          ]),
    );
  }
}

class RoundButton extends StatelessWidget {
  RoundButton({@required this.child, @required this.onPressed});

  final Widget child;
  final Function onPressed;

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      child: child,
      onPressed: onPressed,
      elevation: 0.0,
      constraints: BoxConstraints.tightFor(
        width: 76.0,
        height: 76.0,
      ),
      shape: CircleBorder(),
      fillColor: Colors.grey.shade300,
    );
  }
}

class RoundIconButton extends StatelessWidget {
  RoundIconButton({@required this.icon, @required this.onPressed});

  final IconData icon;
  final Function onPressed;

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      child: Icon(
        icon,
        size: 45,
        color: Colors.white,
      ),
      onPressed: onPressed,
      elevation: 0.0,
      constraints: BoxConstraints.tightFor(
        width: 76.0,
        height: 76.0,
      ),
      shape: CircleBorder(),
      fillColor: Colors.lightGreenAccent,
    );
  }
}

class DeleteButton extends StatelessWidget {
  DeleteButton({this.onPressed});

  final Function onPressed;

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      child: Icon(
        Icons.backspace,
        size: 45,
        color: Colors.grey.shade300,
      ),
      onPressed: onPressed,
      elevation: 0.0,
      constraints: BoxConstraints.tightFor(
        width: 76.0,
        height: 76.0,
      ),
      shape: CircleBorder(),
      fillColor: null,
    );
  }
}