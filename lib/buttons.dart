import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  final color;
  final textColor;
  final String buttonText;
  final buttonTapped;
  final bool isdark;

  MyButton(
      {this.color,
      this.textColor,
      required this.isdark,
      required this.buttonText,
      this.buttonTapped});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(25),
            child: new Container(
              child: new Material(
                child: new InkWell(
                  splashFactory: InkSplash.splashFactory,
                  // highlightColor: isdark
                  //     ? Colors.white.withOpacity(1)
                  //     : Colors.black.withOpacity(1),
                  // splashColor: isdark
                  //     ? Colors.white.withOpacity(1)
                  //     : Colors.black.withOpacity(1),
                  onTap: () {
                    buttonTapped();
                  },

                  child: Center(
                    child: Text(
                      buttonText,
                      style: TextStyle(color: textColor, fontSize: 17),
                    ),
                  ),
                ),
                color: Colors.transparent,
              ),
              color: color,
            ),
          ),
        ),
      ),
    );
    // return Container(
    //   color: color,
    //   child: Theme(
    //     data: ThemeData(),
    //     child: InkWell(
    //       highlightColor: isdark
    //           ? Colors.white.withOpacity(1)
    //           : Colors.black.withOpacity(1),
    //       splashColor: isdark
    //           ? Colors.white.withOpacity(1)
    //           : Colors.black.withOpacity(1),
    //       borderRadius: BorderRadius.circular(40),
    //       onTap: buttonTapped,
    //       child: Padding(
    //         padding: const EdgeInsets.all(8.0),
    //         child: ClipRRect(
    //           borderRadius: BorderRadius.circular(25),
    //           child: Container(
    //             // color: color,
    //             child: Center(
    //               child: Text(
    //                 buttonText,
    //                 style: TextStyle(color: textColor, fontSize: 17),
    //               ),
    //             ),
    //           ),
    //         ),
    //       ),
    //     ),
    //   ),
    // );
  }
}
