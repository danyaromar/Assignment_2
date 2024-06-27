
import 'package:flutter/cupertino.dart';

class ReusableCode extends StatelessWidget {

ReusableCode({required this.color,  required this.cardChild, this.onPress});

final Color? color;
final Widget? cardChild;
final VoidCallback? onPress;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Container(
        child: cardChild,
          margin: EdgeInsets.all(15),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.0),
            color: color,
          ),
          
        ),
    );
  }
}

 