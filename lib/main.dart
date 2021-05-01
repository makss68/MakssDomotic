import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
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
  String srvAddress = "192.168.1.9";
  bool foundFromPref = false;
  String newSrvAddr = "";
  String log = "";
  bool keyBoardType = false;
  double _currentBrightness = 100;
  double _currentSpeed = 5;
  double _currentTempo = 5;

  Future _retrieveInfoFromPref() async {
    SharedPreferences.getInstance().then(
      (prefs) => setState(() {
        foundFromPref = (prefs.getString('ip') == null) ? false : true;
        srvAddress = prefs.getString('ip') ?? "192.168.1.9";
        _currentBrightness = prefs.getDouble("_currentBrightness") ?? 100;
        _currentSpeed = prefs.getDouble("_currentSpeed") ?? 5;
        _currentTempo = prefs.getDouble("_currentTempo") ?? 5;
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
        actions: [
          keyBoardType
              ? IconButton(
                  icon: Icon(Icons.speed_outlined),
                  onPressed: () => setState(() {
                        keyBoardType = false;
                      }))
              : IconButton(
                  icon: Icon(Icons.keyboard_rounded),
                  onPressed: () => setState(() {
                    keyBoardType = true;
                  }),
                )
        ],
        backgroundColor: Colors.transparent,
      ),
      body: SingleChildScrollView(
          child: keyBoardType ? keyBoardWidget() : slidersWidget()),
    );
  }

  ///
  /// Content of sliders widget
  Widget slidersWidget() {
    return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Wrap(
            direction: Axis.horizontal,
            alignment: WrapAlignment.center,
            children: [
              // OFF
              ElevatedButton(
                child: Container(
                  child: Text("OFF"),
                ),
                onPressed: () {
                  HapticFeedback.lightImpact();
                  http
                      .get("http://$srvAddress/OFF")
                      .catchError((e) => setState(() {
                            HapticFeedback.vibrate();
                            log += e.toString() + "\n\n";
                          }));
                },
              ),
              SizedBox(
                width: 4,
              ),
              // ON
              ElevatedButton(
                child: Container(
                  child: Text("ON"),
                ),
                onPressed: () {
                  HapticFeedback.lightImpact();
                  http
                      .get("http://$srvAddress/ON")
                      .catchError((e) => setState(() {
                            HapticFeedback.vibrate();
                            log += e.toString() + "\n\n";
                          }));
                },
              ),
              SizedBox(
                width: 4,
              ),
              ElevatedButton(
                child: Container(
                  child: Text("RED"),
                ),
                onPressed: () {
                  HapticFeedback.lightImpact();
                  http
                      .get("http://$srvAddress/RED")
                      .catchError((e) => setState(() {
                            HapticFeedback.vibrate();
                            log += e.toString() + "\n\n";
                          }));
                },
              ),
              SizedBox(
                width: 4,
              ),
              ElevatedButton(
                child: Container(
                  child: Text("GREEN"),
                ),
                onPressed: () {
                  HapticFeedback.lightImpact();
                  http
                      .get("http://$srvAddress/GREEN")
                      .catchError((e) => setState(() {
                            HapticFeedback.vibrate();
                            log += e.toString() + "\n\n";
                          }));
                },
              ),
              SizedBox(
                width: 4,
              ),
              ElevatedButton(
                child: Container(
                  child: Text("BLUE"),
                ),
                onPressed: () {
                  HapticFeedback.lightImpact();
                  http
                      .get("http://$srvAddress/BLUE")
                      .catchError((e) => setState(() {
                            HapticFeedback.vibrate();
                            log += e.toString() + "\n\n";
                          }));
                },
              ),
              SizedBox(
                width: 4,
              ),
              ElevatedButton(
                child: Container(
                  child: Text("RAINBOW"),
                ),
                onPressed: () {
                  HapticFeedback.lightImpact();
                  http
                      .get("http://$srvAddress/RAINBOW")
                      .catchError((e) => setState(() {
                            HapticFeedback.vibrate();
                            log += e.toString() + "\n\n";
                          }));
                },
              ),
              SizedBox(
                width: 4,
              ),
              ElevatedButton(
                child: Container(
                  child: Text("COLORFADE"),
                ),
                onPressed: () {
                  HapticFeedback.lightImpact();
                  http
                      .get("http://$srvAddress/FADE")
                      .catchError((e) => setState(() {
                            HapticFeedback.vibrate();
                            log += e.toString() + "\n\n";
                          }));
                },
              ),
              SizedBox(
                width: 4,
              ),
              ElevatedButton(
                child: Container(
                  child: Text("FRANCE"),
                ),
                onPressed: () {
                  HapticFeedback.lightImpact();
                  http
                      .get("http://$srvAddress/FRANCE")
                      .catchError((e) => setState(() {
                            HapticFeedback.vibrate();
                            log += e.toString() + "\n\n";
                          }));
                },
              ),
              ElevatedButton(
                child: Container(
                  child: Text("PINGPONG"),
                ),
                onPressed: () {
                  HapticFeedback.lightImpact();
                  http
                      .get("http://$srvAddress/PINGPONG")
                      .catchError((e) => setState(() {
                            HapticFeedback.vibrate();
                            log += e.toString() + "\n\n";
                          }));
                },
              ),
            ],
          ),

          //
          // Brightness
          Slider(
            value: _currentBrightness,
            min: 1,
            max: 255,
            divisions: 255,
            label: _currentBrightness.round().toString(),
            onChanged: (double value) {
              setState(() {
                _currentBrightness = value;
                _saveInPrefs("_currentBrightness", _currentBrightness);
              });
            },
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 24.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Brightness"),
                SizedBox(width: 15),
                IconButton(
                  onPressed: () {
                    HapticFeedback.lightImpact();
                    http
                        .get("http://$srvAddress/BRI=" +
                            _currentBrightness.round().toString())
                        .catchError((e) => setState(() {
                              HapticFeedback.vibrate();
                              log += e.toString() + "\n\n";
                            }));
                  },
                  icon: Icon(Icons.send),
                )
              ],
            ),
          ),

          //
          // Speed
          Slider(
            value: _currentSpeed,
            min: 1,
            max: 15,
            divisions: 15,
            label: _currentSpeed.round().toString(),
            onChanged: (double value) {
              setState(() {
                _currentSpeed = value;
                _saveInPrefs("_currentSpeed", _currentSpeed);
              });
            },
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 24.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Speed"),
                SizedBox(width: 15),
                IconButton(
                  onPressed: () {
                    HapticFeedback.lightImpact();
                    http
                        .get("http://$srvAddress/SPEED=" +
                            _currentSpeed.round().toString())
                        .catchError((e) => setState(() {
                              HapticFeedback.vibrate();
                              log += e.toString() + "\n\n";
                            }));
                  },
                  icon: Icon(Icons.send),
                )
              ],
            ),
          ),

          //
          // Tempo
          Slider(
            value: _currentTempo,
            min: 1,
            max: 25,
            divisions: 25,
            label: _currentTempo.round().toString(),
            onChanged: (double value) {
              setState(() {
                _currentTempo = value;
                _saveInPrefs("_currentTempo", _currentTempo);
              });
            },
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 24.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Tempo"),
                SizedBox(width: 15),
                IconButton(
                  onPressed: () {
                    HapticFeedback.lightImpact();
                    http
                        .get("http://$srvAddress/TEMPO=" +
                            _currentTempo.round().toString())
                        .catchError((e) => setState(() {
                              HapticFeedback.vibrate();
                              log += e.toString() + "\n\n";
                            }));
                  },
                  icon: Icon(Icons.send),
                )
              ],
            ),
          ),
          ...bottomSettings(),
        ]);
  }

  ///
  /// Content of keyboard widget
  Widget keyBoardWidget() {
    return Column(
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
                  HapticFeedback.lightImpact();
                  http
                      .get("http://$srvAddress/1")
                      .catchError((e) => setState(() {
                            HapticFeedback.vibrate();
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
                  HapticFeedback.lightImpact();
                  http
                      .get("http://$srvAddress/2")
                      .catchError((e) => setState(() {
                            HapticFeedback.vibrate();
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
                  HapticFeedback.lightImpact();
                  http
                      .get("http://$srvAddress/3")
                      .catchError((e) => setState(() {
                            HapticFeedback.vibrate();
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
                  HapticFeedback.lightImpact();
                  http
                      .get("http://$srvAddress/4")
                      .catchError((e) => setState(() {
                            HapticFeedback.vibrate();
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
                  HapticFeedback.lightImpact();
                  http
                      .get("http://$srvAddress/5")
                      .catchError((e) => setState(() {
                            HapticFeedback.vibrate();
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
                  HapticFeedback.lightImpact();
                  http
                      .get("http://$srvAddress/6")
                      .catchError((e) => setState(() {
                            HapticFeedback.vibrate();
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
                  HapticFeedback.lightImpact();
                  http
                      .get("http://$srvAddress/7")
                      .catchError((e) => setState(() {
                            HapticFeedback.vibrate();
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
                  HapticFeedback.lightImpact();
                  http
                      .get("http://$srvAddress/8")
                      .catchError((e) => setState(() {
                            HapticFeedback.vibrate();
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
                  HapticFeedback.lightImpact();
                  http
                      .get("http://$srvAddress/9")
                      .catchError((e) => setState(() {
                            HapticFeedback.vibrate();
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
                  HapticFeedback.lightImpact();
                  http
                      .get("http://$srvAddress/off")
                      .catchError((e) => setState(() {
                            HapticFeedback.vibrate();
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
                    HapticFeedback.lightImpact();
                    http
                        .get("http://$srvAddress/0")
                        .catchError((e) => setState(() {
                              HapticFeedback.vibrate();
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
                  HapticFeedback.lightImpact();
                  http
                      .get("http://$srvAddress/off")
                      .catchError((e) => setState(() {
                            HapticFeedback.vibrate();
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
        ...bottomSettings(),
      ],
    );
  }

  ///
  /// Save IP Address
  Future _updateLocalData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('ip', srvAddress);
    setState(() {
      log = "";
      foundFromPref = true;
    });
  }

  ///
  /// Save value in local store
  Future _saveInPrefs(String key, double value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setDouble(key, value);
  }

  List<Widget> bottomSettings() {
    return [
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
                  keyboardType: TextInputType.numberWithOptions(decimal: true),
                  decoration: InputDecoration(labelText: 'New server address'),
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
                      HapticFeedback.lightImpact();
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
      Text(log)
    ];
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
