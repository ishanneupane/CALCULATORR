import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';

var eqn = "", expression = "";
String result = "0";

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

  button(
    var buttontext,
    Color colors,
  ) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(90),
        color: colors,
      ),
      margin: EdgeInsets.all(4),
      height: MediaQuery.of(context).size.height * .1075,
      child: InkWell(
        onTap: () => buttonpressed(buttontext),
        splashColor: Colors.blueGrey.shade900,
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
      body: ListView(
        children: [
          SizedBox(height: 20),
          Container(
            width: double.infinity,
            height: MediaQuery.of(context).size.height * .232,
            //  color: Colors.grey.shade500,
            child: Text(
              "$eqn",
              style: TextStyle(
                  color: Colors.blue.shade200,
                  fontSize: MediaQuery.of(context).size.height * .05),
            ),
          ),
          Container(
            width: double.infinity,
            height: MediaQuery.of(context).size.height * .08,
            //   color: Colors.white54,
            child: Text(
              "$result",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: MediaQuery.of(context).size.height * .071),
              textAlign: TextAlign.right,
            ),
          ),
          Divider(),
          Table(
            children: [
              TableRow(children: [
                button("^", Colors.blue.shade100),
                button("; )", Colors.yellowAccent),
                button("C", Colors.deepOrangeAccent),
                button("⌦", Colors.teal.shade300),
              ]),
              TableRow(children: [
                button("*", Colors.blue.shade100),
                button("1", Colors.blueGrey),
                button("2", Colors.blueGrey),
                button("3", Colors.blueGrey),
              ]),
              TableRow(children: [
                button("/", Colors.blue.shade100),
                button("4", Colors.blueGrey),
                button("5", Colors.blueGrey),
                button("6", Colors.blueGrey),
              ]),
              TableRow(children: [
                button("-", Colors.blue.shade100),
                button("7", Colors.blueGrey),
                button("8", Colors.blueGrey),
                button("9", Colors.blueGrey),
              ]),
              TableRow(children: [
                button("+", Colors.blue.shade100),
                button(".", Colors.blue.shade100),
                button("0", Colors.blueGrey),
                button("=", Colors.blue.shade700),
              ]),
            ],
          ),
        ],
      ),
    );
  }
}
