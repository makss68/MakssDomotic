import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

void main() => runApp(MyApp());

const Map<String, String> numToTextMapping = {
  "1": "UNI",
  "2": "BI",
  "3": "FAD",
  "4": "RGB",
  "5": "POL",
  "6": "STR",
  "7": "---",
  "8": "TIM",
  "9": "+++",
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
        brightness: Brightness.dark,
        buttonColor: Colors.orange,
        accentColor: Colors.orangeAccent,
        toggleableActiveColor: Colors.deepOrangeAccent,
        floatingActionButtonTheme: FloatingActionButtonThemeData(
          backgroundColor: Colors.orange,
        ),
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
  String srvAddress = "192.168.2.36";
  bool foundFromPref = false;
  String newSrvAddr = "";
  String log = "";

  Future _retrieveInfoFromPref() async {
    SharedPreferences.getInstance().then(
      (prefs) => setState(() {
        srvAddress = prefs.getString('prefs') ?? "192.168.2.36";
        foundFromPref = (prefs.getString('prefs') == null) ? false : true;
      }),
    );
  }

  @override
  void initState() {
    super.initState();
    _retrieveInfoFromPref();
  }

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
        backgroundColor: Colors.transparent,
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                SizedBox(
                  width: 20,
                ),
                NumberedRoundButton(
                    num: "1",
                    onPressed: () {
                      http
                          .get("http://$srvAddress/1")
                          .catchError((e) => setState(() {
                                log += e.toString() + "\n\n";
                              }));
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
                      http
                          .get("http://$srvAddress/2")
                          .catchError((e) => setState(() {
                                log += e.toString() + "\n\n";
                              }));
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
                      http
                          .get("http://$srvAddress/3")
                          .catchError((e) => setState(() {
                                log += e.toString() + "\n\n";
                              }));
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
                      http
                          .get("http://$srvAddress/4")
                          .catchError((e) => setState(() {
                                log += e.toString() + "\n\n";
                              }));
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
                      http
                          .get("http://$srvAddress/5")
                          .catchError((e) => setState(() {
                                log += e.toString() + "\n\n";
                              }));
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
                      http
                          .get("http://$srvAddress/6")
                          .catchError((e) => setState(() {
                                log += e.toString() + "\n\n";
                              }));
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
                      http
                          .get("http://$srvAddress/7")
                          .catchError((e) => setState(() {
                                log += e.toString() + "\n\n";
                              }));
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
                      http
                          .get("http://$srvAddress/8")
                          .catchError((e) => setState(() {
                                log += e.toString() + "\n\n";
                              }));
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
                      http
                          .get("http://$srvAddress/9")
                          .catchError((e) => setState(() {
                                log += e.toString() + "\n\n";
                              }));
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
                      http
                          .get("http://$srvAddress/off")
                          .catchError((e) => setState(() {
                                log += e.toString() + "\n\n";
                              }));
                      setState(() {
                        typedNumber += "*";
                      });
                    }),
                SizedBox(
                  width: 20,
                ),
                GestureDetector(
                  child: NumberedRoundButton(
                      num: "0",
                      onPressed: () {
                        http
                            .get("http://$srvAddress/0")
                            .catchError((e) => setState(() {
                                  log += e.toString() + "\n\n";
                                }));
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
                      http
                          .get("http://$srvAddress/off")
                          .catchError((e) => setState(() {
                                log += e.toString() + "\n\n";
                              }));
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
            ListTile(
              title: Text(srvAddress),
              leading: (foundFromPref) ? Icon(Icons.star) : null,
              trailing: Icon(Icons.edit),
              onTap: () => {
                showDialog(
                    context: context,
                    child: AlertDialog(
                      title: Text("New Server Address"),
                      content: TextFormField(
                        initialValue: srvAddress,
                        keyboardType: TextInputType.numberWithOptions(decimal:true),
                        decoration:
                            InputDecoration(labelText: 'New server address'),
                        onChanged: (input) => newSrvAddr = input,
                      ),
                      actions: <Widget>[
                        new FlatButton(
                          child: new Text('Cancel'),
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                        ),
                        new FlatButton(
                          child: new Text(
                            'Save!',
                            style: TextStyle(
                              color: Colors.deepOrangeAccent,
                            ),
                          ),
                          onPressed: () {
                            srvAddress = newSrvAddr;
                            _updateLocalData();
                            Navigator.of(context).pop();
                          },
                        ),
                      ],
                    ))
              },
            ),
            SizedBox(height: 20),
            Text(log),
          ],
        ),
      ),
    );
  }

  Future _updateLocalData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('srvAddress', srvAddress);
    setState(() {
      log = "";
      foundFromPref = true;
    });
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
      fillColor: Colors.grey.shade800,
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
