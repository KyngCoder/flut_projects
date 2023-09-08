
import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';

class CalculatorScreen extends StatefulWidget {
  const CalculatorScreen({super.key});

  @override
  State<CalculatorScreen> createState() => _CalculatorScreenState();
}

class _CalculatorScreenState extends State<CalculatorScreen> {

final opreatorColor = const Color.fromARGB(255, 165, 161, 161);
static const buttonColor = Color.fromARGB(255, 33, 32, 32);
final orangeColor = Colors.orangeAccent;
final blackcolor = Colors.black;

 double firstnum = 0.0;
  double secondnum = 0.0;
  var input = '';
  var output = '';
  var operations = '';
  var hideInput = false;
  var outputSize = 34.0;

  onButtonPressed(value) {
    if (value == 'AC') {
      input = '';
      output = '';
    } else if (value == '<--') {
      if (input.isNotEmpty) {
        input = input.substring(0, input.length - 1);
      }
    } else if (value == '=') {
      if (input.isNotEmpty) {
        var userInput = input;
        userInput = input.replaceAll('x', '*');
        Parser p = Parser();
        Expression expression = p.parse(userInput);
        ContextModel cm = ContextModel();
        var finalvalue = expression.evaluate(EvaluationType.REAL, cm);
        output = finalvalue.toString();
        if (output.endsWith('.0')) {
          output = output.substring(0, output.length - 2);
        }
        input = output;
        hideInput = true;
        outputSize = 50;
      }
    } else {
      input = input + value;
      hideInput = false;
      outputSize = 40;
    }

    setState(() {});
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
    
      body: Column(
        children: [
         
          Expanded(
              child: Container(
            width: double.infinity,
            padding: const EdgeInsets.all(12),
            // color: Colors.red,
            child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    hideInput ? '' : input,
                    style: const TextStyle(
                      fontSize: 45,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  Text(
                    output,
                    style: TextStyle(
                      fontSize: outputSize,
                      color: Colors.white.withOpacity(0.8),
                    ),
                  ),
                  const SizedBox(height: 20),
                ]),
          )),
          //button area
          Row(
            children: [
              button(
              
                  text: "AC",
                  textcolor: blackcolor,
                  buttonBackGroungColor: opreatorColor),
              button(
               
                  text: "C",
                  textcolor: blackcolor,
                  buttonBackGroungColor: opreatorColor),
              button(
                  text: "+/-",
                  textcolor: blackcolor,
                  buttonBackGroungColor: opreatorColor),
              button(text: "/", buttonBackGroungColor: orangeColor),
            ],
          ),
          Row(
            children: [
              button(text: "7"),
              button(text: "8"),
              button(text: "9"),
              button(text: "x", buttonBackGroungColor: orangeColor),
            ],
          ),
          Row(
            children: [
              button(text: "4"),
              button(text: "5"),
              button(text: "6"),
              button(text: "-", buttonBackGroungColor: orangeColor),
            ],
          ),
          Row(
            children: [
              button(text: "1"),
              button(text: "2"),
              button(text: "3"),
              button(text: "+", buttonBackGroungColor: orangeColor),
            ],
          ),
          Row(
            children: [
              button(text: "%", textcolor: orangeColor),
              button(text: "0"),
              button(text: "."),
              button(text: "=", buttonBackGroungColor: orangeColor),
            ],
          ),
          const SizedBox(height: 20,)
        ],
      ),
    );
  }


  Widget button(
      {text, textcolor = Colors.white, buttonBackGroungColor = buttonColor}) {
    return Expanded(
      child: Container(
        margin: const EdgeInsets.all(8),
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            shape: const CircleBorder(), backgroundColor: buttonBackGroungColor,
            padding: const EdgeInsets.all(16),
          ),
          onPressed: () => onButtonPressed(text),
          child: Text(
            text,
            style: TextStyle(
                fontSize: 30, fontWeight: FontWeight.w500, color: textcolor),
          ),
        ),
      ),
    );
  }

}


