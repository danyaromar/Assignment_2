import 'package:flutter/material.dart';
import 'ReusableCode.dart';
import 'buttom_button.dart';
import 'constant.dart';
import 'input_page.dart';

class ResultPage extends StatelessWidget {
   ResultPage({required this.bmiResult , required this.resultText ,required this.interpretation});
final String bmiResult;
final String resultText;
final String interpretation;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
           appBar: AppBar(
            title: Text('BMI Calculator'),
           ),
           body: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Expanded(
                child:Container(
                child:Text('The Result',
                style:kResultLargeTextStyle,
                ),
              ),
              ),
              Expanded(
              flex:5,
              child:ReusableCode(color:activeCardColor, 
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Text(resultText.toUpperCase() , 
                  style:resultTextStyle),
                  Text(bmiResult,
                  style:KBmiTextStyle),
                Text(interpretation,
                style: KBodyTextStyle),
                ],
                     
              ),
            ),
          ),
          Expanded(
            
            child:Container(
           child: BottomButton(
            buttonTitle:'ReCalculate' , 
          onTap :(){
            Navigator.pop(context);
            
          }  
          ),
          ),),

             
            ],
           ),
    );
  }
}