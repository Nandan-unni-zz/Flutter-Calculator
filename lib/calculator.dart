import 'package:flutter/material.dart'; //imported flutter material package
import 'dart:math';

class HomePage extends StatefulWidget {
  // creating a stateful widget
  @override
  State createState() => new HomePageState(); // creating the state
}

class HomePageState extends State<HomePage> {
  var io = "0";
  var firstNumber = "0";
  var oprator = "+";
  var secondNumber = "0";
  void calculator() {
    if (oprator == "+")
      setState(() {
        io =
            (double.parse(firstNumber) + double.parse(secondNumber)).toString();
      });
    else if (oprator == "-")
      setState(() {
        io =
            (double.parse(firstNumber) - double.parse(secondNumber)).toString();
      });
    else if (oprator == "X")
      setState(() {
        io =
            (double.parse(firstNumber) * double.parse(secondNumber)).toString();
      });
    else if (oprator == "/")
      setState(() {
        io =
            (double.parse(firstNumber) / double.parse(secondNumber)).toString();
      });
    else if (oprator == "%")
      setState(() {
        io =
            (double.parse(firstNumber) % double.parse(secondNumber)).toString();
      });
    else if (oprator == "^")
      setState(() {
        io = pow(double.parse(firstNumber), double.parse(secondNumber))
            .toString();
      });
  }

  void _controller(key) {
    if (key == "=")
      calculator();
    else if (key == "AC")
      setState(() {
        io = "";
        firstNumber = "";
        oprator = "";
        secondNumber = "";
      });
    else if (key == "C") {
      if (oprator != "" && io == "")
        setState(() {
          oprator = "";
          io = firstNumber;
          firstNumber = "";
        });
      else
        setState(() {
          io = io.substring(0, io.length - 1);
          secondNumber = secondNumber.substring(0, secondNumber.length - 1);
        });
    } else if (["+", "-", "X", "/", "%", "^"].indexOf(key) >= 0) {
      if (secondNumber != "")
        setState(() {
          firstNumber = io;
          io = "";
          oprator = key;
          secondNumber = "";
        });
      else
        setState(() {
          firstNumber = io;
          io = "";
          oprator = key;
        });
    } else {
      if (oprator != "")
        setState(() {
          io = io + key;
          secondNumber = secondNumber + key;
        });
      else
        setState(() {
          io = io + key;
        });
    }
  }

  Widget _button(String key) {
    // Creating a method of return type Widget with number and function f as a parameter
    return MaterialButton(
      height: 90.0,
      child: Text(key,
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24.0)),
      textColor: Colors.black,
      color: Colors.grey[100],
      onPressed: () => _controller(key),
    );
  }

  @override
  Widget build(BuildContext context) {
    // creating the widget
    return new Scaffold(
        appBar: new AppBar(
          //defines the content of the Appbar
          title: new Text("Calculator"),
        ),
        body: new Container(
            //defines the content of the body
            child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            // Container(
            //   constraints: BoxConstraints.expand(
            //     height: Theme.of(context).textTheme.headline4.fontSize * 1.1 +
            //         100.0,
            //   ),
            //   alignment: Alignment.bottomCenter,
            //   color: Colors.black,
            //   child: Text(
            //     "$ans",
            //     style: TextStyle(fontSize: 50.0, color: Colors.white),
            //     textAlign: TextAlign.center,
            //   ),
            // ),
            Row(
              children: [
                Text(
                  " $firstNumber $oprator $secondNumber ",
                  style: TextStyle(color: Colors.white70, fontSize: 30.0),
                  textAlign: TextAlign.right,
                )
              ],
            ),
            Row(
              children: [
                Text(
                  " $io ",
                  style: TextStyle(color: Colors.white, fontSize: 50.0),
                  textAlign: TextAlign.right,
                )
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                _button("%"), // using custom widget _button
                _button("^"),
                _button("C"),
                _button("AC")
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                _button("7"), // using custom widget _button
                _button("8"),
                _button("9"),
                _button("/")
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                _button("4"), // using custom widget _button
                _button("5"),
                _button("6"),
                _button("X")
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                _button("1"), // using custom widget _button
                _button("2"),
                _button("3"),
                _button("+")
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                _button("="), // using custom widget _button
                _button("0"),
                _button("."),
                _button("-"),
              ],
            ),
          ],
        )));
  }
}
