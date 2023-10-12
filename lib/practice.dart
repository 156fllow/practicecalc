import 'package:flutter/material.dart';
import './settings.dart';
import 'dart:math' as math;

class Practice extends StatefulWidget{
  Practice({Key? key}) : super(key: key);
  @override
  _Practice createState() => _Practice();
}

class _Practice extends State<Practice>{

  int mode = Settings.mode;
  int first_term = Settings.first_term;
  int second_term = Settings.second_term;

  String question = "";
  int answer = 0;
  int correct_answer = 0;

  @override
  void initState(){
    super.initState();

  }

  void input_numeric(int num){
    setState(() {
      answer = answer * 10 + num;
    });
  }

  void create_question(){
    int term1 = (math.Random().nextInt((math.pow(10, first_term).toInt() - 1)  - (math.pow(10, first_term-1).toInt()) + 1)) + math.pow(10, first_term-1).toInt();
    int term2 = (math.Random().nextInt((math.pow(10, second_term).toInt() - 1)  - (math.pow(10, second_term-1).toInt()) + 1)) + math.pow(10, second_term-1).toInt();
    switch(mode){
      case 1:
        correct_answer = term1 + term2;
        setState(() {
          question = "$term1 + $term2";
        });
        break;
      case 2:
        correct_answer = term1 - term2;
        setState(() {
          question = "$term1 - $term2";
        });
        break;
      case 3:
        correct_answer = term1 * term2;
        setState(() {
          question = "$term1 × $term2";
        });
        break;
      case 4:
        correct_answer = (term1 / term2).toInt();
        setState(() {
          question = "$term1 ÷ $term2";
        });
        break;
    }
  }

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: const Text("Practice"),
      ),
      body: Container(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(question),
            Text ("$answer"),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                TextButton(onPressed: (){create_question();}, child: const Text("START")),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                TextButton(onPressed: (){input_numeric(1);}, child: const Text("1")),
                TextButton(onPressed: (){input_numeric(2);}, child: const Text("2")),
                TextButton(onPressed: (){input_numeric(3);}, child: const Text("3")),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                TextButton(onPressed: (){input_numeric(4);}, child: const Text("4")),
                TextButton(onPressed: (){input_numeric(5);}, child: const Text("5")),
                TextButton(onPressed: (){input_numeric(6);}, child: const Text("6")),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                TextButton(onPressed: (){input_numeric(7);}, child: const Text("7")),
                TextButton(onPressed: (){input_numeric(8);}, child: const Text("8")),
                TextButton(onPressed: (){input_numeric(9);}, child: const Text("9")),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                TextButton(onPressed: null, child: const Text("AC")),
                TextButton(onPressed: (){input_numeric(0);}, child: const Text("0")),
                TextButton(onPressed: null, child: const Text("ANS")),
              ],
            ),
          ],
        ),
      )
    );
  }

}