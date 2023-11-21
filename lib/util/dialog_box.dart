// import 'dart:html';

import 'package:flutter/material.dart';
import 'package:my_calculator_flutter/util/single_history.dart';

//Pop up for Hisotry Barr when pressed

class Dialogbox extends StatelessWidget {
  final List<dynamic>? historyOutput;

  Dialogbox({super.key, required this.historyOutput});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      insetPadding: EdgeInsets.fromLTRB(50, 50, 50, 500),
      clipBehavior: Clip.hardEdge,
      backgroundColor: const Color.fromARGB(91, 197, 192, 192),
      contentPadding: EdgeInsets.all(0),
      content: Container(
        padding: EdgeInsets.all(10),
        // color: Colors.grey,
        decoration: BoxDecoration(
          color: Color.fromARGB(91, 104, 101, 101),
          borderRadius: BorderRadius.circular(10),
        ),
        // color: const Color.fromARGB(163, 246, 246, 246)),

        child: ListView.builder(
            itemCount: historyOutput?.length,
            itemBuilder: (context, index) => histories(
                  number1: historyOutput?[index][0],
                  operand: historyOutput?[index][1],
                  number2: historyOutput?[index][2],
                  result: historyOutput?[index][3],
                )),
      ),
    );
  }
}
