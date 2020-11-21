
import 'dart:math';
class Brain
{
  Brain({this.weight,this.height});
  final int weight;
  final int height;

  double _bmi;
  String getBmi()
  {
    _bmi=weight/(pow(height/100,2));
    return _bmi.toStringAsFixed(1);
  }
  String getresult()
  {
    if(_bmi<18.5)
      {
        return "UNDERWEIGHT";
      }
    else if(_bmi>=25)
      {
        return "OVERWEIGHT";
      }
    else
      {
        return "NORMAL";
      }
  }
  String getMessage()
  {
    if(_bmi<18.5)
    {
      return "Khaya piya karo kuch";
    }
    else if(_bmi>=25)
    {
      return "Haathi bhi sharma jaye , kam kardo khana ";
    }
    else
    {
      return "Sab changasi";
    }
  }

}