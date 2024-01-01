import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';

var eqn = "", expression = "";
var result = "0";

class homePagee extends StatefulWidget {
  const homePagee({super.key});

  @override
  State<homePagee> createState() => _homePageeState();
}

class _homePageeState extends State<homePagee> {
  @override
  void buttonpressed(var buttontext) {
    setState(() {
      if (buttontext == "C") {
        result = "0";
        eqn = "";
      } else if (buttontext == "⌦") {
        eqn = eqn.substring(0, eqn.length - 1);
      } else if (buttontext == "=") {
        expression = eqn;
        try {
          Parser p = new Parser();
          Expression exp = p.parse(expression);
          ContextModel cm = ContextModel();
          result = '${exp.evaluate(EvaluationType.REAL, cm)}';
          eqn = result;
        } catch (e) {
          result = "Error";
        }
      } else
        (eqn = eqn + buttontext);
    });
  }

  button(var buttontext, Color colors) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(90),
        color: colors,
      ),
      margin: EdgeInsets.all(4),
      height: MediaQuery.of(context).size.height * .1075,
      child: InkWell(
        onTap: () => buttonpressed(buttontext),
        splashColor: Colors.grey,
        child: Center(
          child: Text(
            buttontext,
            style: TextStyle(fontSize: MediaQuery.of(context).size.width * .1),
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: Center(
          child: Text(
            "CALCULATOR",
            style: TextStyle(fontSize: 50, color: Colors.black),
          ),
        ),
        backgroundColor: Colors.blueGrey,
      ),
      body: ListView(
        children: [
          Container(
            width: double.infinity,
            height: MediaQuery.of(context).size.height * .232,
            color: Colors.grey.shade500,
            child: Text(
              "$eqn",
              style:
                  TextStyle(fontSize: MediaQuery.of(context).size.height * .05),
            ),
          ),
          Container(
            width: double.infinity,
            height: MediaQuery.of(context).size.height * .08,
            color: Colors.white54,
            child: Text(
              "$result",
              style: TextStyle(
                  fontSize: MediaQuery.of(context).size.height * .071),
              textAlign: TextAlign.right,
            ),
          ),
          Table(
            children: [
              TableRow(children: [
                button("⌦", Colors.pinkAccent.shade700),
                button("; )", Colors.yellow.shade500),
                button("^", Colors.blue.shade300),
                button("C", Colors.redAccent),
              ]),
              TableRow(children: [
                button("*", Colors.blue),
                button("1", Colors.cyan),
                button("2", Colors.blue.shade300),
                button("3", Color(0xDA1260ED)),
              ]),
              TableRow(children: [
                button("/", Colors.blue),
                button("4", Colors.cyan),
                button("5", Colors.blue.shade300),
                button("6", Color(0xDA1260ED)),
              ]),
              TableRow(children: [
                button("-", Colors.blue),
                button("7", Colors.cyan),
                button("8", Colors.blue.shade300),
                button("9", Color(0xDA1260ED)),
              ]),
              TableRow(children: [
                button("+", Colors.blue),
                button(".", Colors.blue.shade600),
                button("0", Colors.blue.shade300),
                button("=", Colors.green),
              ]),
            ],
          ),
        ],
      ),
    );
  }
}
