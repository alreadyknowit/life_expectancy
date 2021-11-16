
import 'package:life_expectancy/user_data.dart';

class Calculator{
  UserData _userData;

  Calculator(this._userData);

  int calculate(){
    double result;
    _userData.gender==true ? result=93 : result=90;
     result= result + (_userData.exercise*2) - _userData.cigarette + (_userData.height/_userData.weight);
    return result.toInt();
  }
}