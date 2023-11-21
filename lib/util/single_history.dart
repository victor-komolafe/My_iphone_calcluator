import 'package:flutter/material.dart';

class histories extends StatefulWidget {
  String? number1 = ""; //  has values one variables .0-9
  String? operand = ""; // hvalues + - % /
  String? number2 = ""; //values . 0-9
  String? result = " ";

  histories({
    super.key,
    this.number1,
    this.operand,
    this.number2,
    this.result,
  });

  @override
  State<histories> createState() => _historiesState();
}

class _historiesState extends State<histories> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.all(5),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.end,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  widget.number1!,
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.white,
                    fontWeight: FontWeight.w300,
                    // fontStyle: FontStyle.italic,
                  ),
                ),
                Padding(padding: EdgeInsets.only(right: 4)),
                Text(
                  widget.operand!,
                  style: TextStyle(
                    fontWeight: FontWeight.w100,
                    fontSize: 16,
                    color: Colors.white,

                    // fontStyle: FontStyle.italic,
                  ),
                ),
                Padding(padding: EdgeInsets.only(right: 4)),
                Text(
                  widget.number2!,
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.white,
                    fontWeight: FontWeight.w300,
                    // fontStyle: FontStyle.italic,
                  ),
                ),
                Padding(padding: EdgeInsets.only(right: 4)),
                Text(
                  '=',
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.white,
                    fontWeight: FontWeight.w300,
                    // fontStyle: FontStyle.italic,
                  ),
                ),
                Padding(padding: EdgeInsets.only(right: 4)),
                TextButton(
                  onPressed: () {
                    setState(() {
                      Navigator.pop(context);
                    });
                  },
                  style: TextButton.styleFrom(
                    minimumSize: Size.zero,
                    tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                    padding: EdgeInsets.all(0),
                  ),
                  child: Text(
                    widget.result!,
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.orange,
                        fontStyle: FontStyle.normal,
                        fontSize: 18),
                  ),
                ),
                // )

                // Padding(padding: EdgeInsets.fromLTRB(0, 0, 0, 0)),
              ],
            ),

            Divider(
              indent: 0,
              height: 10,
              color: Color.fromARGB(255, 162, 155, 155),
            ),
            // Padding(padding: EdgeInsets.only(bottom: 0)),
          ],
        ));
  }
}
