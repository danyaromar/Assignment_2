import'dart:math';

class CalculatorBrain {
 CalculatorBrain({required this.height,required this.weight});
  final int height ;
  final int weight;
  
  double? _bmi;

  String calculateBMI(){
     _bmi = weight / pow(height/100, 2);
    
    return _bmi!.toStringAsFixed(1);
  }

  String getResult(){
    if(_bmi! >= 25)
    {
      return 'Overweight';
    }else if (_bmi! > 18.5) {
      return 'Normal';
    }
  else {
    return 'underweight';
  }

  }

  
  String getInterpretation(){
    if(_bmi! >= 25)
    {
      return 'try to exersice more';
    }else if (_bmi! > 18.5) {
      return 'good job you have a normal body';
    }
  else {
    return 'try a little bit harder and eat more';
  }

  }
}