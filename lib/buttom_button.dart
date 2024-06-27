

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'constant.dart';

class BottomButton extends StatelessWidget {
  BottomButton({required this.onTap, required this.buttonTitle,});
  
  final Function() onTap;
  final String buttonTitle;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap:onTap,
    child: Container(
        child: Center(
        child: Text(
          buttonTitle,
        style: kNumberLargeTextStyle,)),
        color: bottomColorBar,
        margin: EdgeInsets.only(top: 10),
        width: double.infinity,
        height: bottomContainerHeight,
      ),
    );
  }
}


class RoundIconButton extends StatelessWidget {
 
    RoundIconButton({@required this.icon,@required this.onPressed, this.age});
    final IconData? icon;
    final void Function()? onPressed;
    final int? age;

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      child: Icon(icon),
     onPressed:onPressed,
     elevation: 0,
      constraints: BoxConstraints.tightFor(
        width:56.0 ,
        height: 56.0,

      ),
      shape: CircleBorder(),
      fillColor: Color(0xFF4C4F5C),
    );
  }
}
