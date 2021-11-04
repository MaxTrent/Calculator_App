import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutterita/Buttons.dart';

void main(){
  runApp(Calculator());
}
class Calculator extends StatefulWidget {
  const Calculator({Key key}) : super(key: key);

  @override
  CalculatorState createState() => CalculatorState();
}

class CalculatorState extends State<Calculator> {
  String _history = '';
  String _expression = '';

  void numTap(String text) {
    setState(() => _expression += text);
  }

  void allClear(String text) {
    setState(() {
      _history = '';
      _expression = '';
    });
  }

  void clear(String text) {
    setState(() {
      _expression = '';
    });
  }

  void evaluate(String text) {
    Parser p = Parser();
    Expression exp = p.parse(_expression);
    ContextModel cm = ContextModel();

    setState(() {
      _history = _expression;
      _expression = exp.evaluate(EvaluationType.REAL, cm).toString();
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'My Calculator App',
      home: Scaffold(
          backgroundColor: Colors.white38,
        body: Container(
          padding: EdgeInsets.all(12),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              Container(
                child: Padding(
                  padding: const EdgeInsets.only(right: 12),
                  child: Text(
                    _history,
                    style: GoogleFonts.robotoCondensed(
                      textStyle: TextStyle(
                        fontSize: 25,
                        color: Colors.black,
                      )
                    ),

                  ),
                ),
                alignment: Alignment(1,1),
              ),
              Container(
                child: Padding(
                  padding: const EdgeInsets.all(12),
                  child: Text(
                    _expression,
                    style: GoogleFonts.robotoCondensed(
                      textStyle: TextStyle(
                        fontSize: 50,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ),
                alignment: Alignment(1,1),
              ),
              SizedBox(height: 35),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Buttons(
                    text: 'AC',
                    fillColor: 0xFFB71C1C,
                    textSize: 20,
                    callback: clear,
                  ),
                  Buttons(
                    text: 'C',
                    fillColor: 0xFFB71C1C,
                    callback: clear,
                  ),
                  Buttons(
                    text: '%',
                    fillColor: 0xFFFFFFFF,
                    textColor: 0xFF0D47A1,
                    callback: numTap,
                  ),
                  Buttons(
                    text: '/',
                    fillColor: 0xFFFFFFFF,
                    textColor: 0xFF0D47A1,
                    callback: numTap,
                  ),
                ],
              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Buttons(
                    text: '7',
                    callback: numTap,
                  ),
                  Buttons(
                    text: '8',
                    callback: numTap,
                  ),
                  Buttons(
                    text: '9',
                    callback: numTap,
                  ),
                  Buttons(
                    text: '*',
                    fillColor: 0xFFFFFFFF,
                    textColor: 0xFF0D47A1,
                    callback: numTap,
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Buttons(
                    text: '4',
                    callback: numTap,
                  ),
                  Buttons(
                    text: '5',
                    callback: numTap,
                  ),
                  Buttons(
                    text: '6',
                    callback: numTap,
                    focusColor: 0xFF65BDAC,
                  ),
                  Buttons(
                    text: '-',
                    fillColor: 0xFFFFFFFF,
                    textColor: 0xFF0D47A1,
                    callback: numTap,
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Buttons(
                    text: '1',
                    callback: numTap,
                  ),
                  Buttons(
                    text: '2',
                    callback: numTap,
                  ),
                  Buttons(
                    text: '3',
                    callback: numTap,
                    focusColor: 0xFF65BDAC,
                  ),
                  Buttons(
                    text: '+',
                    fillColor: 0xFFFFFFFF,
                    textColor: 0xFF0D47A1,
                    callback: numTap,
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Buttons(
                    text: '.',
                    callback: numTap,
                  ),
                  Buttons(
                    text: '0',
                    callback: numTap,
                  ),
                  Buttons(
                    text: '^',
                    callback: numTap,
                    focusColor: 0xFF65BDAC,
                  ),
                  Buttons(
                    text: '=',
                    fillColor: 0xFFFFFFFF,
                    textColor: 0xFF0D47A1,
                    callback: evaluate,
                  ),
                ],
              )
            ],
          ),
        )
      )
    );
  }
}
