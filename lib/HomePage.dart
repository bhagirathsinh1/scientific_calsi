import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';
import 'buttons.dart';
import 'nextPage.dart';

var bgColor = Colors.white;
var txtColor = Colors.black;
var btnColor = Colors.blueGrey[50];

class HomePage extends StatefulWidget {
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var userQuestion = '';
  var userAnswer = '';
  var viewHistory = 'View history';
  var ob = 0;
  var cb = 0;
  var zero = 0;
  bool point = false;
  bool degree = false;
  bool fminus = false;
  var degTxt = 'Radian';
  var deg = 'Degree';
  var rad = 'Radian';
  bool history = false;
  bool dark = false;

  final List<String> buttons = [
    'e', //0
    'π', //1
    'sin', //2
    'deg', //3
    'AC', //4
    '(', //5
    ')', //6
    '/', //7
    '7', //8
    '8', //9
    '9', //10
    'x', //11
    '4', //12
    '5', //13
    '6', //14
    '-', //15
    '1', //16
    '2', //17
    '3', //18
    '+', //19
    '0', //20
    '.', //21
    '⌫', //22
    '=' //23
  ];
  void changeDegree() {
    if (degree == true) {
      setState(() {
        degTxt = rad;
      });
    } else {
      setState(() {
        degTxt = deg;
      });
    }
  }

  void changeBackground() {
    if (dark == true) {
      bgColor = Colors.black;
      txtColor = Colors.white;
      btnColor = Colors.grey[900];
    } else {
      bgColor = Colors.white;
      txtColor = Colors.black;
      btnColor = Colors.blueGrey[50];
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      body: SafeArea(
        child: Container(
          child: Column(
            children: <Widget>[
              //userQuestion text box
              Expanded(
                flex: 2,
                child: Container(
                    child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Expanded(
                      child: SizedBox(
                        height: 80,
                        child: Container(
                          padding: const EdgeInsets.only(left: 10, right: 10),
                          alignment: Alignment.centerRight,
                          child: Text(
                            userQuestion,
                            style: TextStyle(
                              fontSize: 20,
                              color: Colors.grey[700],
                            ),
                          ),
                        ),
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.only(right: 10, left: 10),
                      alignment: Alignment.centerRight,
                      child: Text(
                        userAnswer,
                        style: TextStyle(
                          fontSize: 40,
                          color: txtColor,
                        ),
                      ),
                    ),

                    Container(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            margin: EdgeInsets.fromLTRB(15, 0, 0, 0),
                            width: 50,
                            child: Container(
                              decoration: BoxDecoration(
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey.withOpacity(0.2),
                                    spreadRadius: 1,
                                    blurRadius: 17,
                                    offset: Offset(
                                        0, 12), // changes position of shadow
                                  ),
                                ],
                              ),

//icon button

                              // ignore: deprecated_member_use
                              child: FlatButton(
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(30)),
                                onPressed: () {
                                  if (dark == true) {
                                    dark = false;
                                  } else {
                                    dark = true;
                                  }
                                  setState(() {
                                    changeBackground();
                                  });
                                },
                                color: btnColor,
                                child: new IconTheme(
                                    data:
                                        new IconThemeData(color: Colors.orange),
                                    child: Transform.rotate(
                                        angle: 56,
                                        child: dark == true
                                            ? Icon(Icons.lightbulb)
                                            : Icon(Icons.nightlight_sharp))),
                                padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                              ),
                            ),
                          ),

//view history text
                          Container(
                            padding: const EdgeInsets.only(right: 10),
                            child: MaterialButton(
                              textColor: Colors.grey[600],
                              child: Text(
                                viewHistory,
                              ),
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => nextPage()),
                                );
                              },
                            ),
                          ),
                        ],
                      ),
                    )

                    //Icon(Icons.nightlight_sharp))
                  ],
                )),
              ),
              Expanded(
                flex: 3,
                child: Container(
                  child: GridView.builder(
                      padding: EdgeInsets.all(0),
                      itemCount: buttons.length,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          childAspectRatio: MediaQuery.of(context).size.width /
                              (MediaQuery.of(context).size.height / 2.6),
                          crossAxisCount: 4),
                      itemBuilder: (BuildContext context, int index) {
//all clear button

                        if (index == 4) {
                          return MyButton(
                            isdark: dark,
                            buttonTapped: () {
                              setState(() {
                                ob = 0;
                                cb = 0;
                                userAnswer = '';
                                userQuestion = '';
                                point = false;
                              });
                            },
                            buttonText: buttons[index],
                            color: Colors.red[100],
                            textColor: Colors.red,
                          );
                        }
//delete button

                        else if (index == 22) {
                          return MyButton(
                            isdark: dark,
                            buttonTapped: () {
                              if (userQuestion
                                      .substring(userQuestion.length - 1) ==
                                  ')') {
                                setState(() {
                                  userQuestion = userQuestion.substring(
                                      0, userQuestion.length - 1);
                                  cb--;
                                });
                              } else if (userQuestion
                                      .substring(userQuestion.length - 1) ==
                                  '(') {
                                setState(() {
                                  userQuestion = userQuestion.substring(
                                      0, userQuestion.length - 1);
                                  ob--;
                                });
                              } else if (userQuestion[
                                      userQuestion.length - 1] ==
                                  '+') {
                                setState(() {
                                  userQuestion = userQuestion.substring(
                                      0, userQuestion.length - 1);
                                  point = true;
                                });
                              } else if (userQuestion[
                                      userQuestion.length - 1] ==
                                  '/') {
                                setState(() {
                                  userQuestion = userQuestion.substring(
                                      0, userQuestion.length - 1);
                                  point = true;
                                });
                              } else if (userQuestion[
                                      userQuestion.length - 1] ==
                                  '-') {
                                setState(() {
                                  userQuestion = userQuestion.substring(
                                      0, userQuestion.length - 1);
                                  point = true;
                                });
                              } else if (userQuestion[
                                      userQuestion.length - 1] ==
                                  'x') {
                                setState(() {
                                  userQuestion = userQuestion.substring(
                                      0, userQuestion.length - 1);
                                  point = true;
                                });
                              } else if (userQuestion[
                                      userQuestion.length - 1] ==
                                  'n') {
                                setState(() {
                                  userQuestion = userQuestion.substring(
                                      0, userQuestion.length - 3);
                                  point = true;
                                });
                              } else if (userQuestion[
                                      userQuestion.length - 1] ==
                                  'g') {
                              } else if (userQuestion[
                                      userQuestion.length - 1] ==
                                  '.') {
                                setState(() {
                                  userQuestion = userQuestion.substring(
                                      0, userQuestion.length - 1);
                                  point = false;
                                });
                              } else {
                                setState(() {
                                  userQuestion = userQuestion.substring(
                                      0, userQuestion.length - 1);
                                });
                              }
                            },
                            buttonText: buttons[index],
                            color: Colors.red[100],
                            textColor: Colors.red,
                          );
//equals to button
                        } else if (index == 23) {
                          return MyButton(
                            isdark: dark,
                            buttonTapped: () {
                              setState(() {
                                equalPressed();
                              });
                            },
                            buttonText: buttons[index],
                            color: Color(0xff2dca70),
                            textColor: Colors.white,
                          );

//zero button

                        } else if (index == 20) {
                          return MyButton(
                            isdark: dark,
                            buttonTapped: () {
                              if (userAnswer == userQuestion) {
                                setState(() {
                                  userQuestion = '';
                                  userAnswer = '';
                                  userQuestion += buttons[index];
                                  point = false;
                                });
                              } else {
                                if (userQuestion.length == 0) {
                                  setState(() {
                                    userQuestion += buttons[index];
                                  });
                                } else if (userQuestion[
                                        userQuestion.length - 1] ==
                                    ')') {
                                  setState(() {
                                    userQuestion =
                                        userQuestion + 'x' + buttons[index];
                                  });
                                } else if (userQuestion[
                                        userQuestion.length - 1] ==
                                    'π') {
                                  setState(() {
                                    userQuestion =
                                        userQuestion + 'x' + buttons[index];
                                  });
                                } else if (userQuestion[
                                        userQuestion.length - 1] ==
                                    'e') {
                                  setState(() {
                                    userQuestion =
                                        userQuestion + 'x' + buttons[index];
                                  });
                                } else {
                                  if (userQuestion == '0') {
                                    if (buttons[index] == '0') {
                                      setState(() {
                                        userQuestion = userQuestion;
                                      });
                                    }
                                  } else if (userQuestion[
                                              userQuestion.length - 1] ==
                                          '0' &&
                                      userQuestion[userQuestion.length - 2] ==
                                          '/') {
                                  } else if (userQuestion[
                                              userQuestion.length - 1] ==
                                          '0' &&
                                      userQuestion[userQuestion.length - 2] ==
                                          '-') {
                                  } else if (userQuestion[
                                              userQuestion.length - 1] ==
                                          '0' &&
                                      userQuestion[userQuestion.length - 2] ==
                                          '+') {
                                  } else if (userQuestion[
                                              userQuestion.length - 1] ==
                                          '0' &&
                                      userQuestion[userQuestion.length - 2] ==
                                          'x') {
                                  } else {
                                    setState(() {
                                      userQuestion += buttons[index];
                                    });
                                  }
                                }
                              }
                            },
                            buttonText: buttons[index],
                            color: btnColor,
                            textColor: txtColor,
                          );

//devide button

                        } else if (index == 7) {
                          return MyButton(
                            isdark: dark,
                            buttonTapped: () {
                              if (userQuestion[userQuestion.length - 1] ==
                                  '/') {
                                setState(() {
                                  userQuestion = userQuestion.substring(
                                      0, userQuestion.length - 1);
                                  userQuestion += '/';
                                });
                              } else if (userQuestion[
                                          userQuestion.length - 1] ==
                                      '-' &&
                                  userQuestion[userQuestion.length - 2] ==
                                      '(') {
                              } else if (userQuestion[
                                      userQuestion.length - 1] ==
                                  'n') {
                              } else if (userQuestion[
                                      userQuestion.length - 1] ==
                                  '(') {
                              } else if (userQuestion[
                                      userQuestion.length - 1] ==
                                  '+') {
                                setState(() {
                                  userQuestion = userQuestion.substring(
                                      0, userQuestion.length - 1);
                                  userQuestion += '/';
                                });
                              } else if (userQuestion[
                                      userQuestion.length - 1] ==
                                  'x') {
                                setState(() {
                                  userQuestion = userQuestion.substring(
                                      0, userQuestion.length - 1);
                                  userQuestion += '/';
                                });
                              } else if (userQuestion[
                                      userQuestion.length - 1] ==
                                  '-') {
                                setState(() {
                                  userQuestion = userQuestion.substring(
                                      0, userQuestion.length - 1);
                                  userQuestion += '/';
                                });
                              } else if (userQuestion[
                                      userQuestion.length - 1] ==
                                  '.') {
                                setState(() {
                                  userQuestion = userQuestion.substring(
                                      0, userQuestion.length - 1);
                                  userQuestion += '/';
                                  point = false;
                                });
                              } else if (userQuestion[
                                          userQuestion.length - 1] ==
                                      '0' &&
                                  userQuestion[userQuestion.length - 2] ==
                                      '/') {
                              } else if (userQuestion == '-') {
                              } else {
                                setState(() {
                                  userQuestion += (buttons[index]);
                                  point = false;
                                });
                              }
                            },
                            buttonText: buttons[index],
                            color: Colors.orange[300],
                            textColor: Colors.white,
                          );
//multiplication
                        } else if (index == 11) {
                          return MyButton(
                            isdark: dark,
                            buttonTapped: () {
                              if (userQuestion[userQuestion.length - 1] ==
                                  '/') {
                                setState(() {
                                  userQuestion = userQuestion.substring(
                                      0, userQuestion.length - 1);
                                  userQuestion += 'x';
                                });
                              } else if (userQuestion[
                                          userQuestion.length - 1] ==
                                      '-' &&
                                  userQuestion[userQuestion.length - 2] ==
                                      '(') {
                              } else if (userQuestion[
                                      userQuestion.length - 1] ==
                                  'n') {
                              } else if (userQuestion[
                                      userQuestion.length - 1] ==
                                  '(') {
                              } else if (userQuestion[
                                      userQuestion.length - 1] ==
                                  '+') {
                                setState(() {
                                  userQuestion = userQuestion.substring(
                                      0, userQuestion.length - 1);
                                  userQuestion += 'x';
                                });
                              } else if (userQuestion[
                                      userQuestion.length - 1] ==
                                  'x') {
                                setState(() {
                                  userQuestion = userQuestion.substring(
                                      0, userQuestion.length - 1);
                                  userQuestion += 'x';
                                });
                              } else if (userQuestion[
                                      userQuestion.length - 1] ==
                                  '-') {
                                setState(() {
                                  userQuestion = userQuestion.substring(
                                      0, userQuestion.length - 1);
                                  userQuestion += 'x';
                                });
                              } else if (userQuestion[
                                      userQuestion.length - 1] ==
                                  '.') {
                                setState(() {
                                  userQuestion = userQuestion.substring(
                                      0, userQuestion.length - 1);
                                  userQuestion += 'x';
                                  point = false;
                                });
                              } else if (userQuestion[
                                          userQuestion.length - 1] ==
                                      '0' &&
                                  userQuestion[userQuestion.length - 2] ==
                                      '/') {
                              } else if (userQuestion == '-') {
                              } else {
                                setState(() {
                                  userQuestion += (buttons[index]);
                                  point = false;
                                });
                              }
                            },
                            buttonText: buttons[index],
                            color: Colors.orange[300],
                            textColor: Colors.white,
                          );

//minus button

                        } else if (index == 15) {
                          return MyButton(
                            isdark: dark,
                            buttonTapped: () {
                              if (userQuestion == '') {
                                setState(() {
                                  userQuestion += buttons[index];
                                  fminus = true;
                                });
                              } else {
                                if (userQuestion[userQuestion.length - 1] ==
                                    '/') {
                                  setState(() {
                                    userQuestion = userQuestion.substring(
                                        0, userQuestion.length - 1);
                                    userQuestion += '-';
                                  });
                                } else if (userQuestion[
                                        userQuestion.length - 1] ==
                                    'n') {
                                } else if (userQuestion[
                                        userQuestion.length - 1] ==
                                    '+') {
                                  setState(() {
                                    userQuestion = userQuestion.substring(
                                        0, userQuestion.length - 1);
                                    userQuestion += '-';
                                  });
                                } else if (userQuestion[
                                        userQuestion.length - 1] ==
                                    'x') {
                                  setState(() {
                                    userQuestion = userQuestion.substring(
                                        0, userQuestion.length - 1);
                                    userQuestion += '-';
                                  });
                                } else if (userQuestion[
                                        userQuestion.length - 1] ==
                                    '-') {
                                  setState(() {
                                    userQuestion = userQuestion.substring(
                                        0, userQuestion.length - 1);
                                    userQuestion += '-';
                                    fminus = true;
                                  });
                                } else if (userQuestion[
                                        userQuestion.length - 1] ==
                                    '-') {
                                  setState(() {
                                    userQuestion = userQuestion.substring(
                                        0, userQuestion.length - 1);
                                    userQuestion += '-';
                                  });
                                } else if (userQuestion[
                                        userQuestion.length - 1] ==
                                    '.') {
                                  setState(() {
                                    userQuestion = userQuestion.substring(
                                        0, userQuestion.length - 1);
                                    userQuestion += '-';
                                    point = false;
                                  });
                                } else if (userQuestion[
                                            userQuestion.length - 1] ==
                                        '0' &&
                                    userQuestion[userQuestion.length - 2] ==
                                        '/') {
                                } else {
                                  setState(() {
                                    userQuestion += (buttons[index]);
                                    point = false;
                                  });
                                }
                              }
                            },
                            buttonText: buttons[index],
                            color: Colors.orange[300],
                            textColor: Colors.white,
                          );

                          //plus button

                        } else if (index == 19) {
                          return MyButton(
                            isdark: dark,
                            buttonTapped: () {
                              if (userQuestion[userQuestion.length - 1] ==
                                  '/') {
                                setState(() {
                                  userQuestion = userQuestion.substring(
                                      0, userQuestion.length - 1);
                                  userQuestion += '+';
                                });
                              } else if (userQuestion[
                                          userQuestion.length - 1] ==
                                      '-' &&
                                  userQuestion[userQuestion.length - 2] ==
                                      '(') {
                              } else if (userQuestion[
                                      userQuestion.length - 1] ==
                                  'n') {
                              } else if (userQuestion[
                                      userQuestion.length - 1] ==
                                  '(') {
                              } else if (userQuestion[
                                      userQuestion.length - 1] ==
                                  '+') {
                                setState(() {
                                  userQuestion = userQuestion.substring(
                                      0, userQuestion.length - 1);
                                  userQuestion += '+';
                                });
                              } else if (userQuestion[
                                      userQuestion.length - 1] ==
                                  'x') {
                                setState(() {
                                  userQuestion = userQuestion.substring(
                                      0, userQuestion.length - 1);
                                  userQuestion += '+';
                                });
                              } else if (userQuestion[
                                      userQuestion.length - 1] ==
                                  '-') {
                                setState(() {
                                  userQuestion = userQuestion.substring(
                                      0, userQuestion.length - 1);
                                  userQuestion += '+';
                                });
                              } else if (userQuestion[
                                      userQuestion.length - 1] ==
                                  '.') {
                                setState(() {
                                  userQuestion = userQuestion.substring(
                                      0, userQuestion.length - 1);
                                  userQuestion += '+';
                                  point = false;
                                });
                              } else if (userQuestion[
                                          userQuestion.length - 1] ==
                                      '0' &&
                                  userQuestion[userQuestion.length - 2] ==
                                      '/') {
                              } else {
                                setState(() {
                                  userQuestion += (buttons[index]);
                                  point = false;
                                });
                              }
                            },
                            buttonText: buttons[index],
                            color: Colors.orange[300],
                            textColor: Colors.white,
                          );

                          //exponate button

                        } else if (index == 0) {
                          return MyButton(
                            isdark: dark,
                            buttonTapped: () {
                              if (userQuestion.length == 0) {
                                setState(() {
                                  userQuestion += buttons[index];
                                });
                              } else {
                                if (userQuestion[userQuestion.length - 1] ==
                                    'e') {
                                  setState(() {
                                    userQuestion =
                                        userQuestion + 'x' + buttons[index];
                                  });
                                } else if (userQuestion[
                                        userQuestion.length - 1] ==
                                    '.') {
                                } else if (userQuestion.length > 0 &&
                                    (userQuestion[userQuestion.length - 1] ==
                                        'n')) {
                                  setState(() {
                                    userQuestion += (buttons[index]);
                                  });
                                } else if (userQuestion.length > 0 &&
                                    (userQuestion[userQuestion.length - 1] ==
                                        'π')) {
                                  setState(() {
                                    userQuestion =
                                        userQuestion + 'x' + buttons[index];
                                  });
                                } else if (userQuestion[
                                            userQuestion.length - 1] ==
                                        '0' &&
                                    userQuestion[userQuestion.length - 2] ==
                                        '/') {
                                } else if (userQuestion[
                                            userQuestion.length - 1] ==
                                        '+' ||
                                    userQuestion[userQuestion.length - 1] ==
                                        '-' ||
                                    userQuestion[userQuestion.length - 1] ==
                                        'x' ||
                                    userQuestion[userQuestion.length - 1] ==
                                        '/' ||
                                    userQuestion[userQuestion.length - 1] ==
                                        '(') {
                                  setState(() {
                                    userQuestion =
                                        userQuestion + buttons[index];
                                  });
                                } else {
                                  setState(() {
                                    userQuestion =
                                        userQuestion + 'x' + (buttons[index]);
                                  });
                                }
                              }
                            },
                            buttonText: buttons[index],
                            color: btnColor,
                            textColor: txtColor,
                          );
                        }

                        //pi button

                        else if (index == 1) {
                          return MyButton(
                            isdark: dark,
                            buttonTapped: () {
                              if (userQuestion.length == 0) {
                                setState(() {
                                  userQuestion += buttons[index];
                                });
                              } else {
                                if (userQuestion.length > 0 &&
                                    (userQuestion[userQuestion.length - 1] ==
                                        'π')) {
                                  setState(() {
                                    userQuestion =
                                        userQuestion + 'x' + buttons[index];
                                  });
                                } else if (userQuestion[
                                        userQuestion.length - 1] ==
                                    '.') {
                                } else if (userQuestion.length > 0 &&
                                    (userQuestion[userQuestion.length - 1] ==
                                        'n')) {
                                  setState(() {
                                    userQuestion += (buttons[index]);
                                  });
                                } else if (userQuestion.length > 0 &&
                                    (userQuestion[userQuestion.length - 1] ==
                                        'e')) {
                                  setState(() {
                                    userQuestion =
                                        userQuestion + 'x' + buttons[index];
                                  });
                                } else if (userQuestion[
                                            userQuestion.length - 1] ==
                                        '0' &&
                                    userQuestion[userQuestion.length - 2] ==
                                        '/') {
                                } else if (userQuestion[
                                            userQuestion.length - 1] ==
                                        '+' ||
                                    userQuestion[userQuestion.length - 1] ==
                                        '-' ||
                                    userQuestion[userQuestion.length - 1] ==
                                        'x' ||
                                    userQuestion[userQuestion.length - 1] ==
                                        '/') {
                                  setState(() {
                                    userQuestion =
                                        userQuestion + buttons[index];
                                  });
                                } else if (userQuestion[
                                        userQuestion.length - 1] ==
                                    '(') {
                                  setState(() {
                                    userQuestion += buttons[index];
                                  });
                                } else {
                                  setState(() {
                                    userQuestion =
                                        userQuestion + 'x' + (buttons[index]);
                                  });
                                }
                              }
                            },
                            buttonText: buttons[index],
                            color: btnColor,
                            textColor: txtColor,
                          );
                        }
                        //sin button

                        else if (index == 2) {
                          return MyButton(
                            isdark: dark,
                            buttonTapped: () {
                              if (userQuestion.length == 0) {
                                setState(() {
                                  userQuestion += buttons[index] + '(';
                                  ob++;
                                  point = false;
                                });
                              } else {
                                if (userQuestion[userQuestion.length - 1] ==
                                    '.') {
                                  setState(() {
                                    userQuestion = userQuestion.substring(
                                        0, userQuestion.length - 1);
                                    userQuestion += 'x' + buttons[index] + '(';
                                    ob++;
                                    point = false;
                                  });
                                } else {
                                  if (userQuestion.length == 0) {
                                    setState(() {
                                      userQuestion += buttons[index] + '(';
                                      ob++;
                                      point = false;
                                    });
                                  } else {
                                    if (userQuestion.length > 0 &&
                                        (userQuestion[
                                                    userQuestion.length - 1] ==
                                                'n' ||
                                            userQuestion[
                                                    userQuestion.length - 1] ==
                                                'g')) {
                                    } else if (userQuestion.length > 0 &&
                                        (userQuestion[
                                                userQuestion.length - 1] ==
                                            'π')) {
                                      setState(() {
                                        userQuestion = userQuestion +
                                            'x' +
                                            buttons[index] +
                                            '(';
                                        ob++;
                                        point = false;
                                      });
                                    } else if (userQuestion.length > 0 &&
                                        (userQuestion[
                                                userQuestion.length - 1] ==
                                            'e')) {
                                      setState(() {
                                        userQuestion = userQuestion +
                                            'x' +
                                            buttons[index] +
                                            '(';
                                        ob++;
                                        point = false;
                                      });
                                    } else if (userQuestion[
                                                userQuestion.length - 1] ==
                                            '0' &&
                                        userQuestion[userQuestion.length - 2] ==
                                            '/') {
                                    } else if (userQuestion[
                                                userQuestion.length - 1] ==
                                            'x' ||
                                        userQuestion[userQuestion.length - 1] ==
                                            '/' ||
                                        userQuestion[userQuestion.length - 1] ==
                                            '+' ||
                                        userQuestion[userQuestion.length - 1] ==
                                            '-' ||
                                        userQuestion[userQuestion.length - 1] ==
                                            'π' ||
                                        userQuestion[userQuestion.length - 1] ==
                                            'e') {
                                      setState(() {
                                        userQuestion += (buttons[index]) + '(';
                                        ob++;
                                        point = false;
                                      });
                                    } else if (userQuestion[
                                            userQuestion.length - 1] ==
                                        '(') {
                                      setState(() {
                                        userQuestion += buttons[index] + '(';
                                        ob++;
                                        point = false;
                                      });
                                    } else {
                                      setState(() {
                                        userQuestion +=
                                            'x' + buttons[index] + '(';
                                        ob++;
                                        point = false;
                                      });
                                    }
                                  }
                                }
                              }
                            },
                            buttonText: buttons[index],
                            color: btnColor,
                            textColor: txtColor,
                          );

                          //deg button

                        } else if (index == 3) {
                          return MyButton(
                            isdark: dark,
                            buttonTapped: () {
                              {
                                if (degree == true) {
                                  degree = false;
                                } else {
                                  degree = true;
                                }
                                setState(() {});
                                changeDegree();
                              }
                            },
                            buttonText: degTxt,
                            color: btnColor,
                            textColor: txtColor,
                          );

                          //open bracket

                        } else if (index == 5) {
                          return MyButton(
                            isdark: dark,
                            buttonTapped: () {
                              if (userQuestion == '') {
                                setState(() {
                                  userQuestion =
                                      userQuestion + '1x' + buttons[index];
                                  ob++;
                                  point = false;
                                });
                              } else if (userQuestion[
                                      userQuestion.length - 1] ==
                                  ')') {
                                setState(() {
                                  userQuestion =
                                      userQuestion + 'x' + buttons[index];
                                  ob++;
                                  point = false;
                                });
                              } else {
                                if (userQuestion.length > 0 &&
                                    userQuestion[userQuestion.length - 1] ==
                                        '.') {
                                } else if (userQuestion[
                                        userQuestion.length - 1] ==
                                    'π') {
                                  setState(() {
                                    userQuestion += 'x' + buttons[index];
                                    ob++;
                                    point = false;
                                  });
                                } else if (userQuestion[
                                        userQuestion.length - 1] ==
                                    'e') {
                                  setState(() {
                                    userQuestion += 'x' + buttons[index];
                                    ob++;
                                    point = false;
                                  });
                                } else if (userQuestion[
                                        userQuestion.length - 1] ==
                                    'n') {
                                  setState(() {
                                    userQuestion += buttons[index];
                                    ob++;
                                    point = false;
                                  });
                                } else if (userQuestion.isNotEmpty) {
                                  if (userQuestion[
                                              userQuestion.length - 1] ==
                                          '+' ||
                                      userQuestion[
                                              userQuestion.length - 1] ==
                                          '-' ||
                                      userQuestion[
                                              userQuestion.length - 1] ==
                                          '/' ||
                                      userQuestion[userQuestion.length - 1] ==
                                          'x' ||
                                      userQuestion[userQuestion.length - 1] ==
                                          '(') {
                                    setState(() {
                                      userQuestion += buttons[index];
                                      ob++;
                                      point = false;
                                    });
                                  } else {
                                    setState(() {
                                      userQuestion += 'x' + buttons[index];
                                      ob++;
                                      point = false;
                                    });
                                  }
                                } else {
                                  setState(() {
                                    userQuestion += 'x' + (buttons[index]);
                                    ob++;
                                    point = false;
                                  });
                                }
                              }
                            },
                            buttonText: buttons[index],
                            color: btnColor,
                            textColor: txtColor,
                          );

                          //closing bracket

                        } else if (index == 6) {
                          return MyButton(
                            isdark: dark,
                            buttonTapped: () {
                              if (userQuestion[
                                          userQuestion.length - 1] ==
                                      '(' ||
                                  userQuestion[
                                          userQuestion.length - 1] ==
                                      '-' ||
                                  userQuestion[
                                          userQuestion.length - 1] ==
                                      '+' ||
                                  userQuestion[
                                          userQuestion.length - 1] ==
                                      '/' ||
                                  userQuestion[
                                          userQuestion.length - 1] ==
                                      'x' ||
                                  userQuestion[
                                          userQuestion.length - 1] ==
                                      '.' ||
                                  userQuestion[userQuestion.length - 1] ==
                                      'n' ||
                                  userQuestion[userQuestion.length - 1] ==
                                      'g') {
                              } else {
                                if (cb < ob) {
                                  setState(() {
                                    userQuestion += (buttons[index]);
                                    cb++;
                                  });
                                }
                              }
                            },
                            buttonText: buttons[index],
                            color: btnColor,
                            textColor: txtColor,
                          );
                        }

                        //dot button

                        else if (index == 21) {
                          return MyButton(
                            isdark: dark,
                            buttonTapped: () {
                              if (userQuestion[
                                          userQuestion.length - 1] ==
                                      '.' ||
                                  userQuestion[
                                          userQuestion.length - 1] ==
                                      '+' ||
                                  userQuestion[
                                          userQuestion.length - 1] ==
                                      '-' ||
                                  userQuestion[
                                          userQuestion.length - 1] ==
                                      '/' ||
                                  userQuestion[
                                          userQuestion.length - 1] ==
                                      'x' ||
                                  userQuestion[
                                          userQuestion.length - 1] ==
                                      '(' ||
                                  userQuestion[
                                          userQuestion.length - 1] ==
                                      ')' ||
                                  userQuestion[
                                          userQuestion.length - 1] ==
                                      'e' ||
                                  userQuestion[
                                          userQuestion.length - 1] ==
                                      'n' ||
                                  userQuestion[userQuestion.length - 1] ==
                                      'g' ||
                                  userQuestion[userQuestion.length - 1] ==
                                      'π') {
                              } else if (point == false) {
                                setState(() {
                                  userQuestion += buttons[index];
                                  point = true;
                                });
                              } else {}
                            },
                            buttonText: buttons[index],
                            color: btnColor,
                            textColor: txtColor,
                          );
                        } else {
                          //other button
                          return MyButton(
                            isdark: dark,
                            buttonTapped: () {
                              if (userAnswer == userQuestion) {
                                setState(() {
                                  userQuestion = '';
                                  userAnswer = '';
                                  userQuestion += buttons[index];
                                  point = false;
                                });
                              } else if (userQuestion[
                                      userQuestion.length - 1] ==
                                  'π') {
                                setState(() {
                                  userQuestion =
                                      userQuestion + 'x' + buttons[index];
                                });
                              } else if (userQuestion[
                                      userQuestion.length - 1] ==
                                  'e') {
                                setState(() {
                                  userQuestion =
                                      userQuestion + 'x' + buttons[index];
                                });
                              } else {
                                if (userQuestion.length == 1 &&
                                    userQuestion == '0') {
                                  setState(() {
                                    userQuestion = userQuestion.substring(
                                        0, userQuestion.length - 1);
                                    userQuestion += buttons[index];
                                  });
                                } else {
                                  if (userQuestion.length > 1 &&
                                      userQuestion[userQuestion.length - 1] ==
                                          '0' &&
                                      ((userQuestion[userQuestion.length - 2] ==
                                              '/') ||
                                          userQuestion[
                                                  userQuestion.length - 2] ==
                                              '+' ||
                                          (userQuestion[
                                                  userQuestion.length - 2] ==
                                              '-') ||
                                          (userQuestion[
                                                  userQuestion.length - 2] ==
                                              'x'))) {
                                    setState(() {
                                      userQuestion = userQuestion.substring(
                                          0, userQuestion.length - 1);
                                      userQuestion += (buttons[index]);
                                      cb--;
                                    });
                                  } else if (userQuestion[
                                          userQuestion.length - 1] ==
                                      ')') {
                                    setState(() {
                                      userQuestion =
                                          userQuestion + 'x(' + buttons[index];
                                      ob++;
                                      point = false;
                                    });
                                  } else {
                                    setState(() {
                                      userQuestion += (buttons[index]);
                                    });
                                  }
                                }
                              }
                            },
                            buttonText: buttons[index],
                            color: isOperator(buttons[index])
                                ? Colors.orange[300]
                                : btnColor,
                            textColor: isOperator(buttons[index])
                                ? Colors.white
                                : txtColor,
                          );
                        }
                      }),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  bool isOperator(String a) {
    if (a == '/' ||
        a == 'x' ||
        a == '-' ||
        a == '+' ||
        a == 'e' ||
        a == 'π' ||
        a == 'sin' ||
        a == 'deg' ||
        a == '(' ||
        a == ')') {
      return true;
    }
    return false;
  }

  void equalPressed() {
    var newqs = userQuestion;

    if (point = true && (userQuestion == userAnswer)) {
      point = false;
    } else {
      point = true;
    }
    int a = ob - cb;
    if (userQuestion[userQuestion.length - 1] == '+' ||
        userQuestion[userQuestion.length - 1] == '-' ||
        userQuestion[userQuestion.length - 1] == 'x' ||
        userQuestion[userQuestion.length - 1] == '/') {
      setState(() {
        userQuestion = userQuestion.substring(0, userQuestion.length - 1);
      });
    }
    var finalQuestion = userQuestion;
    for (int i = 0; i < a; i++) {
      finalQuestion = finalQuestion + ')';
    }
    finalQuestion = finalQuestion.replaceAll('x', '*');
    finalQuestion = finalQuestion.replaceAll('+(', '+1*(');
    finalQuestion = finalQuestion.replaceAll('x(', 'x1(');
    finalQuestion = finalQuestion.replaceAll(')', ')');
    //finalQuestion = finalQuestion.replaceAll('(', '*(');

    finalQuestion = finalQuestion.replaceAll('π', '3.1415926536');

    finalQuestion = finalQuestion.replaceAll('e', '2.71828182846');
    if (degree == false) {
      finalQuestion = finalQuestion.replaceAll('sin(', 'sin(1/57.30*');
    } else {
      finalQuestion = finalQuestion.replaceAll('sin(', 'sin(');
    }

    Parser p = Parser();
    Expression exp = p.parse(finalQuestion);
    ContextModel cm = ContextModel();
    double eval = exp.evaluate(EvaluationType.REAL, cm);

    userAnswer = eval.toString();

    String myans = userAnswer;

    if (myans[myans.length - 2] == '.' && myans[myans.length - 1] == '0') {
      setState(() {
        myans = myans.substring(0, myans.length - 2);
      });
    } else {
      setState(() {
        myans = myans;
      });
    }
    userAnswer = myans;
    if (userQuestion[userQuestion.length - 1] == 'n') {
      setState(() {
        myans = 'Expression error';
      });
    } else {
      setState(() {
        myans = myans;
      });
    }
    if (myans == 'Infinity' || myans == 'NaN' || myans == '-Infinity') {
      setState(() {
        userQuestion = '0';
        userAnswer = "Can't divide By 0";
        point = false;
      });
    } else {
      setState(() {
        userAnswer = myans;
        userQuestion = myans;
      });
    }
    if (userQuestion == myans) {
      setState(() {
        ob = 0;
        cb = 0;
      });
    } else {}

    if (newqs != userQuestion) {
      setState(() {
        history_list.add(newqs);

        history_list_2.add(userAnswer);
      });
    }
  }
}
