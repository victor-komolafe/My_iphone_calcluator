import 'package:flutter/material.dart';
import 'package:my_calculator_flutter/button_values.dart';
import 'package:intl/intl.dart';
import 'dart:math';

import 'package:my_calculator_flutter/util/number_format.dart';

class CalculatorScreen extends StatefulWidget {
  const CalculatorScreen({super.key});

  @override
  State<CalculatorScreen> createState() => _CalculatorScreenState();
}

class _CalculatorScreenState extends State<CalculatorScreen> {
  String number1 = ""; //  has values one variables .0-9
  String operand = ""; // hvalues + - % /
  String number2 = ""; //values . 0-9
  bool isCalculatedMoreThanOnce =
      false; //used to reset value for number2 after implicit calulations have been done.  e.g 3+4 -1. minus 1 is now new num2
  bool isAlreadyCalculated =
      false; //avoids calculation when different operands are sequentially pressed
  bool operandIsChanged =
      false; //bool to figure out what to print after calulations have been done implicity. e.g 3+4 -1
  bool operandHasBeenSelected =
      false; //bool to change color back to original color after operand is highlighted and number2 needs to be pressed

//TODO: FIX ROUNDOFF... USE ALGORITHM FROM OTHER FILE
//TODO: SEPERATE FUNCTIONS INTO DIFFERENT DART FILES
//TODO: FIX DOUBLE EXCCEEDING MAX NUMMBERS..YOU CAN TRY LONG OR SEE IF ROUND ALGO FIXES IT
  String roundOff(double num) {
    num = double.parse(num.toStringAsFixed(8));
    return "$num";
  }

  // double roundToSignificantFigures(int number, int significantFigures) {
  //   if (number == 0) return 0.0; // Avoid division by zero
  //   double orderOfMagnitude = significantFigures -
  //       1 -
  //       (number.abs().toString().length - 1).toDouble();
  //   var scaleFactor = pow(10, orderOfMagnitude);
  //   return (number / scaleFactor).round() * scaleFactor;
  // } //rounds all output  number to 8 s.f
  CustomFormatterExample afg = CustomFormatterExample();

  // NumberFormat outputValueFormatter = xam.CustomFormatterExample(locale: 'en_US', decimalDigits: 0);
  NumberFormat outputValueFormatter =
      NumberFormat.decimalPatternDigits(locale: 'en_US', decimalDigits: 0);
  // NumberFormat outputValueFormatter = NumberFormat.decimalPattern('en_us');'en_us',6

  int formattedIntNumber1 =
      0; // //int to store values of to-be made  comma formatted Num1 text
  int formattedIntNumber2 =
      0; // //int to store values of to-be made  comma formatted Num2 text
  double formatDoubleNumber1 = 0.0;
  double formatDoubleNumber2 = 0.0;

  String formattedOutputNum1 =
      ""; //string to hold values of comma formatted Num1 text
  String formattedOutputNum2 =
      ""; //string to hold values of comma formatted Num2 text

  //formats values by using comma to seperate

  bool numberIsBool(var x) {
    //checks whethere number to be outputted is an int or double
    print(int.tryParse(x) == null && x != "");
    return ((int.tryParse(x) == null) &&
        x != ""); // if nulll then value is a double
  } //if return is false then value is int else true is double

  // ##### Output value logic
  String outputValue() {
    //sets value for outputs of number1 and number2 depending on its datatype(int or double)
    if (number1.isNotEmpty && (numberIsBool(number1) == false)) {
      formattedIntNumber1 = int.parse(number1);
      // formatDoubleNumber1 =
    } else if (number1.isNotEmpty) {
      if (number1.contains(".") && number1.endsWith(".")) {
        // formatDoubleNumber1 = double.parse(formattedIntNumber1.toString());
        formattedOutputNum1 =
            number1; //sets double directly to output string num
      } else {
        // formatDoubleNumber1 =
        //     double.parse(number1) + double.parse("$formattedIntNumber1");
        formatDoubleNumber1 = double.parse(number1);
      }
    }

    if (number2.isNotEmpty && (numberIsBool(number2) == false)) {
      formattedIntNumber2 = int.parse(number2);
      // formatDoubleNumber1 =
    } else if (number2.isNotEmpty) {
      if (number2.contains(".") && number2.endsWith(".")) {
        // formatDoubleNumber1 = double.parse(formattedIntNumber1.toString());
        formattedOutputNum2 =
            number2; //sets double directly to output string num
      } else {
        // formatDoubleNumber1 =
        //     double.parse(number1) + double.parse("$formattedIntNumber1");
        formatDoubleNumber2 = double.parse(number2);
      }
    }

    if ((numberIsBool(number1) == false) || (numberIsBool(number2) == false)) {
      if (number2.isEmpty) {
        print("Number1 output is an int:");
        afg.printFormattedValue(formattedIntNumber1);
      } else if (isCalculatedMoreThanOnce) {
        print("Number1 output is an int:");
        afg.printFormattedValue(formattedIntNumber1);
      } else {
        print(
            "Number2  output is an int:"); //${outputValueFormatter.format(formattedIntNumber2)}");
        afg.printFormattedValue(formattedIntNumber2);
      }

      //${outputValueFormatter.format(formattedIntNumber1)}");
    }
    if ((numberIsBool(number1) == true) || (numberIsBool(number2) == true)) {
      if (number2.isEmpty) {
        print("Number1 output is a double:");
        afg.printFormattedValue(formatDoubleNumber1);
      } else if (isCalculatedMoreThanOnce) {
        print("Number1 output is a double:");
        afg.printFormattedValue(formatDoubleNumber1);
      } else {
        print("Number2  output is  double:");
        afg.printFormattedValue(formatDoubleNumber2);
      }

      // print(
      //       "Number1 output is a double :"); // ${(outputValueFormatter.format(formatDoubleNumber1))}");
      //   afg.printFormattedValue(formatDoubleNumber1);
      //   print(
      //       "Number2 output is an double: "); //${outputValueFormatter.format(formatDoubleNumber2)}");
      //   afg.printFormattedValue(formatDoubleNumber2);
    }

    // print(formattedNumber2);
    // if ("number1$operand$number2".isEmpty) {
    //   return "0";
    // } else if ("$number1$operand".isNotEmpty &&
    //     number2.isNotEmpty &&
    //     ((isCalculatedMoreThanOnce == false && operandIsChanged == false))) {
    //   if (numberIsBool(number2) == false) {
    //     outputValueFormatter.format(formattedIntNumber2);
    //   } else {
    //     outputValueFormatter.format(formattedIntNumber2);
    //   }
    // }

    //             number2.isNotEmpty &&)

    return "$number1$operand$number2".isEmpty
        ? "0"
        : ("$number1$operand".isNotEmpty &&
                number2.isNotEmpty &&
                ((isCalculatedMoreThanOnce == false &&
                    operandIsChanged == false)))
            ? (numberIsBool(number2) == false)
                // ? outputValueFormatter.format(formattedIntNumber2)
                ? afg.customFormatter.format(formattedIntNumber2)
                : (numberIsBool(number2) == true)
                    ? number2.endsWith('.')
                        ? formattedOutputNum2 //uses direct value of number1
                        // : outputValueFormatter.format(formatDoubleNumber2)
                        : afg.customFormatter.format(formatDoubleNumber2)

                    // ? outputValueFormatter.format(formatDoubleNumber2)
                    // ? number2
                    : (numberIsBool(number1) == false)
                        ? afg.customFormatter.format(formattedIntNumber1)
                        // ? outputValueFormatter.format(formattedIntNumber1)
                        : double.parse((outputValueFormatter
                                .format(formatDoubleNumber1)))
                            .toString()
            : (numberIsBool(number1) == true)
                ? number1.endsWith('.')
                    ? formattedOutputNum1 //uses direct value of number1
                    // : outputValueFormatter.format(formatDoubleNumber1)
                    : afg.customFormatter.format(formatDoubleNumber1)
                // : outputValueFormatter
                //     .format(formattedIntNumber1); //value for if bool
                : afg.customFormatter.format(formattedIntNumber1);

    // ? formattedOutputNum1
    // : outputValueFormatter.format(formattedIntNumber1);

    // ? outputValueFormatter.format(formattedIntNumber2)
    // : outputValueFormatter.format(formattedIntNumber1);
    // : "$number1";

    // ? number2
    // : number1;
  }

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    //Details for sliding to del Numbers
    double _initialX = 0.0;
    double _currentX = 0.0;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        actions: [
          TextButton(
              onPressed: () {},
              child: Text(
                'History',
                style: TextStyle(
                  fontSize: 18,
                  fontStyle: FontStyle.italic,
                  color: Colors.red,
                ),
              ))
        ],
      ),
      backgroundColor: Colors.black,
      body: SafeArea(
        bottom: false,
        child: Column(
          children: [
            //output

            Expanded(
              child: GestureDetector(
                onHorizontalDragStart: (details) {
                  _initialX = details.globalPosition.dx;
                },
                onHorizontalDragUpdate: (details) {
                  _currentX = details.globalPosition.dx;
                },
                onHorizontalDragEnd: (details) {
                  double deltaX = _currentX - _initialX;
                  print('deltaX value is: $deltaX');
                  if (deltaX < -20 && _currentX != 0) {
                    //slide to the left
                    delete();
                  }
                  _initialX = 0.0;
                  _currentX = 0.0;
                },
                child: Container(
                  // height: screenSize.width,
                  padding: const EdgeInsets.all(16),
                  alignment: Alignment.bottomRight,
                  child: Padding(
                    padding: const EdgeInsets.only(right: 10.0),
                    child: Text(
                      outputValue(),

                      // : "$number1$operand$number2",
                      style: const TextStyle(
                        fontSize: 50,
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.end,
                    ),
                  ),
                ),
              ),
            ),

            //button
            Container(
              padding: const EdgeInsets.fromLTRB(0, 10, 0, 70),
              child: Wrap(
                children: //we are using map to assign eaach item in our buttonValues to a widget buildButton

                    Btn.buttonValues
                        .map((value) => SizedBox(
                            width: value == Btn.n0
                                ? screenSize.width / 2
                                : screenSize.width /
                                    4, //dividing by 4 inorder to place 4 buttons ber row
                            height: screenSize.width / 5, //5 buttons per column

                            child: buildButton(value)))
                        .toList(),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget buildButton(value) {
    return Container(
      // width: 500,
      // height: 500,
      padding: const EdgeInsets.all(4.0),
      margin: const EdgeInsets.all(2),
      child: Material(
        color: ([Btn.divide, Btn.multiply, Btn.subtract, Btn.add]
                    .contains(value) &&
                operand == value)
            ? onTapOperandContainerColor(value)
            : getBtnColor(value),
        clipBehavior: Clip.hardEdge,
        // borderRadius: BorderRadius.circular(200),
        shape: btnShape(value),
        // OutlineInputBorder(
        //   borderRadius: BorderRadius.circular(100),
        //   borderSide: const BorderSide(color: Colors.white24),
        // ),
        child: InkWell(
            onTap: () => onBtnTap(value),
            child: Container(
              margin: EdgeInsets.zero,
              padding: EdgeInsets.zero,
              child: btnTextAlign(value),
            )),
      ),
    );
  }

//##### Textstyles for button, Button Alignment for btn0,other buttons and text decorations
  Widget btnTextAlign(value) {
    return value == Btn.n0
        ? Container(
            padding: const EdgeInsets.fromLTRB(40, 20, 20, 10),
            margin: const EdgeInsets.all(1),
            child: Text(
              value,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 24,
              ),
            ),
          )
        : [Btn.bothsign, Btn.per].contains(value)
            ? Center(
                child: Text(
                  value,
                  style: const TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 24,
                  ),
                ),
              )
            : ([Btn.divide, Btn.multiply, Btn.subtract, Btn.add]
                        .contains(value) &&
                    operand == value)
                ? onTapButtonColor(value)
                : (value == Btn.clr)
                    ? Center(
                        child: Text(
                          // value,
                          (number1.isEmpty && operand.isEmpty)
                              ? value = 'AC'
                              : value,
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                            fontSize: 24,
                          ),
                        ),
                      )
                    : Center(
                        child: Text(
                          value,
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 24,
                          ),
                        ),
                      );
  }

//###UI CHANGE for AC BUTTON TO C

//#####ON TAP button collor for operands
  Center onTapButtonColor(value) {
    return Center(
      child: (operandHasBeenSelected == false)
          ? Text(value,
              style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 24,
                  color: Colors.yellow))
          : Text(value,
              style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 24,
                  color: Colors.white)),
    );
  }

//###### Set shape for btn0
  ShapeBorder btnShape(value) {
    return value == Btn.n0
        ? OutlineInputBorder(
            borderRadius: BorderRadius.circular(100),
          )
        : const CircleBorder();
  }

  //##############
  void onBtnTap(String value) {
    if ([Btn.divide, Btn.multiply, Btn.subtract, Btn.add].contains(value)) {
      if (number1.isNotEmpty &&
          number2.isNotEmpty &&
          operand.isNotEmpty &&
          operandIsChanged == true) {
        if (operand == value) {
          return;
        }

        // operand = value;
        setState(() {
          // calculate()
          // number2 = "";
        });
        // calculate();
      }

      // if (isCalculatedMoreThanOnce == true) {
      //   number2 = "";
      // }
    }

    if (value == Btn.bothsign) {
      changeSign();
      return;
    }
    if (value == Btn.clr) {
      allClear();
      return;
    }

    if (value == Btn.allClr) {
      allClear();
      return;
    }

    if (value == Btn.per) {
      convertToPercentage();
      return;
    }

    if (value == Btn.calculate) {
      if (number1.isNotEmpty && number2.isNotEmpty && operand.isNotEmpty) {
        calculate();
        isCalculatedMoreThanOnce = true;
      }
      return;
    }
    appendValue(value);
  }

  Color onTapOperandContainerColor(value) {
    return ([Btn.divide, Btn.multiply, Btn.subtract, Btn.add].contains(value) &&
            operand == value &&
            operandHasBeenSelected == false)
        ? Colors.white
        : Colors.orange;

    // [Btn.divide, Btn.multiply, Btn.subtract, Btn.add].contains(value)
    //     ? Colors.orange
    // setState(() {});
  }

// #### bothsign method
  void changeSign() {
    if (number1.isEmpty) {
      return;
    }
    double num = double.parse(number1);
    num *= -1;
    number1 = "$num";
    if (number1.endsWith(".0")) {
      number1 = number1.substring(0, number1.length - 2);
    }
    setState(() {});
  }

//#### AC/C method . if num1
  void allclear_Delete() {
    if (number1.isEmpty) {}
  }

  //#### clears all output

  void allClear() {
    number1 = "";
    number2 = "";
    operand = "";
    isCalculatedMoreThanOnce =
        false; //used to reset value for number2 after implicit calulations have been done.  e.g 3+4 -1. minus 1 is now new num2
    isAlreadyCalculated =
        false; //avoids calculation when different operands are sequentially pressed
    operandIsChanged =
        false; //bool to figure out what to print after calulations have been done implicity. e.g 3+4 -1
    operandHasBeenSelected = false; //bool t

    formattedIntNumber1 =
        0; // //int to store values of to-be made  comma formatted Num1 text
    formattedIntNumber2 =
        0; // //int to store values of to-be made  comma formatted Num2 text
    formatDoubleNumber1 = 0.0;
    formatDoubleNumber2 = 0.0;

    formattedOutputNum1 =
        ""; //string to hold values of comma formatted Num1 text
    formattedOutputNum2 = "";

    setState(() {});
  }

//####Ccalcuates the result
  void calculate() {
    isAlreadyCalculated = true;
    isCalculatedMoreThanOnce = true;

    if (number1.isEmpty) return;
    if (number2.isEmpty) return;
    if (operand.isEmpty) return;

    double num1 = double.parse(number1);
    double num2 = double.parse(number2);

    var result = 0.0;
    switch (operand) {
      case Btn.add:
        result = num1 + num2;
        break;
      case Btn.subtract:
        result = num1 - num2;
        break;
      case Btn.multiply:
        result = num1 * num2;
        break;
      case Btn.divide:
        result = num1 / num2;
        break;

      default:
        if (number1.isEmpty) {
          break;
        }
    }

    setState(() {
      // number1 = roundOff(result);
      number1 = "$result";

      if (number1.endsWith(".0")) {
        // int numba = int.parse(number1);
        // number1 = (numba.ceil()).toString();

        number1 = number1.substring(0, number1.length - 2);
      }
      // number2 = "";
      // operand = "";

      print("calculated num1: $number1");

      // number1 =
    });
  }

//##### Converts output to percentage
//TODO: FIX OUTPUT OF PERCENTAGE
  void convertToPercentage() {
    if (number1.isNotEmpty &&
        operand.isNotEmpty &&
        number2.isNotEmpty &&
        isAlreadyCalculated == false) {
      //e.g 2 + 4
      //Calculate before conversiontion
      //note our calc value should always be set to number1

      calculate();
    }
    if (operand.isNotEmpty) {
      //cant be converted
      return;
    }

    final number = double.parse(number1);
    setState(() {
      number1 = "${(number / 100)}";
      operand = "";
      number2 = "";
    });
  }

  //##### delete function
  // deleting one from the end
  void delete() {
    //note; we start checking from the end hence why we check for number2 condition, operand and num1
    if (number2.isNotEmpty) {
      number2 = number2.substring(0, (number2.length - 1));
      print("num2: $number2");
    } else if (operand.isNotEmpty) {
      //if num2 is emoty and operand is not;then we clear the operand
      operand = "";
      print("operand: $operand");
    } else if (number1.isNotEmpty) {
      number1 = number1.substring(0, (number1.length - 1));
      print("num1: $number1");
    }
    setState(() {});
  }

  void appendValue(String value) {
    //number1 operand number2
    //e.g 1 * 20

    //if for operand and not "'."
    if (value != Btn.dot && int.tryParse(value) == null) {
      //if statemet for  only operands
      if (operand.isNotEmpty && number2.isNotEmpty) {
        operandHasBeenSelected = false; //resets color to orange
        //here e.g if we have 3 +2 and then an operand is presed then we need to calculate the value
        //and then assign the operand to
        //calculate();
        if (isAlreadyCalculated == false && value != operand) {
          //avoids calculation when different operands are sequentially pressed
          calculate();
          operand =
              value; //now sets operand to new value after implicit calculation with previous opp value
          operandIsChanged = true; //sets is changed to true
          return;
        }
        if ([Btn.divide, Btn.multiply, Btn.subtract, Btn.add].contains(value)) {
          operandIsChanged = true;
        }
        // if (value == operand) {
        //   operandIsChanged = true;
        // }
      }
      operand = value;
      // if (operand.isNotEmpty) {
      //   operandIsChanged = true;
      // }
      print("operand: $operand");

      //asssing value to number1 variable
    } else if (number1.isEmpty || operand.isEmpty) {
      //if value is "."
      if (value == Btn.dot && number1.contains(Btn.dot)) {
        //if statment for dot operator  //e.g
        //if num1 =1.2 then  no need for another dot be able  to be appended hence we return
        return;
      }
      if (value == Btn.dot && (number1.isEmpty || number1 == Btn.n0)) {
        //statement for if number starts with 0 and .
        //e/g num1 = "" | 0
        value = "0.";
      }
      number1 += value;
      // if (number1 != null) {
      //   formattedNumber1 = outputValueFormatter.format(number1);
      // }
      print("Num1 :$number1");

      //same as num1
    } else if (number2.isEmpty || operand.isNotEmpty) {
      if (value == Btn.dot && number2.contains(Btn.dot)) {
        //if statment for dot operator  //e.g
        //if num2 =1.2 then  no need for another dot be able  to be appended hence we return
        print("dot2 if encountered");
        return;
      }
      if (value == Btn.dot && (number2.isEmpty || number2 == Btn.n0)) {
        print("0 for num 2if encountered");
        //statement for if number starts with 0 and .
        //e/g num1 = "" | 0
        value = "0.";
      }
      if (isCalculatedMoreThanOnce == true && operandIsChanged == true) {
        //
        number2 = value;
        operandIsChanged = false;
        isCalculatedMoreThanOnce = false;

        print("Num2: $number2");
      } else {
        number2 += value;

        print("Num2: $number2");
      }
      operandHasBeenSelected = true;
      // formattedNumber2 = outputValueFormatter.format(number2);
    }

    setState(() {});
  }

//##############
  Color getBtnColor(value) {
    return [Btn.clr, Btn.allClr, Btn.per, Btn.bothsign].contains(value)
        ? const Color.fromARGB(163, 246, 246, 246)
        : ([Btn.multiply, Btn.add, Btn.subtract, Btn.divide, Btn.calculate]
                .contains(value))
            ? Colors.orange
            : const Color.fromARGB(91, 197, 192, 192);
  }
}
