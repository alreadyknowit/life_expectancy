import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:life_expectancy/result_page.dart';
import 'gender_icon_widget.dart';
import 'my_container.dart';
import './constants.dart';
import 'user_data.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  _MainPageState createState() => _MainPageState();
}

// ignore_for_file: prefer_const_constructors
class _MainPageState extends State<MainPage> {
   UserData _userData = UserData(weight: 70, height: 170, cigarette: 15, exercise: 3, gender: true);
  // int _amountCigarettes = 15;
  // bool checkGender = true; // true female, false male
  // int _weeklyWorkoutDay = 3;
  // int height = 170;
  // int weight = 70;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.teal[300],
      appBar: AppBar(
        title: Text('Life Expectancy'),
        backgroundColor: Colors.teal,
        centerTitle: true,
      ),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            //Height and weight information
            Expanded(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Expanded(
                    child: MyContainer(
                      widget: buildOutlinedButton('HEIGHT'),
                    ),
                  ),
                  Expanded(
                    child: MyContainer(
                      widget: buildOutlinedButton('WEIGHT'),
                    ),
                  ),
                ],
              ),
            ),
            //Work-out information
            Expanded(
              child: MyContainer(
                widget: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'How many days a week do you exercise?',
                      style: kTextStyle,
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      _userData.exercise.toString(),
                      style: kIntegerStyle,
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Slider(
                      activeColor: Colors.teal,
                      inactiveColor: Colors.teal[200],
                      value: _userData.exercise.toDouble(),
                      min: 0,
                      max: 7,
                      divisions: 7,
                      onChanged: (double value) {
                        setState(() {
                          _userData.exercise = value.round();
                        });
                      },
                    ),
                  ],
                ),
              ),
            ),
            //Cigarettes information
            Expanded(
              child: MyContainer(
                widget: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'How many cigarettes do you smoke each day?',
                      style: kTextStyle,
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      '${_userData.cigarette.round()}',
                      style: kIntegerStyle,
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Slider(
                      activeColor: Colors.teal,
                      inactiveColor: Colors.teal[200],
                      value: _userData.cigarette.roundToDouble(),
                      min: 0,
                      max: 30,
                      label: _userData.cigarette.round().toString(),
                      onChanged: (double value) {
                        setState(() {
                          _userData.cigarette = value.round();
                        });
                      },
                    ),
                  ],
                ),
              ),
            ),
            //Gender information
            Expanded(
              child: Row(
                children: [
                  Expanded(
                    child: MyContainer(
                      color: _userData.gender == true ? Colors.teal : Colors.white,
                      onPress: () => setState(() {
                        _userData.gender = true;
                      }),
                      widget: GenderWidget(
                        gender: 'FEMALE',
                        icon: FontAwesomeIcons.venus,
                      ),
                    ),
                  ),
                  Expanded(
                    child: MyContainer(
                      color:  _userData.gender == false ? Colors.teal : Colors.white,
                      onPress: () {
                        setState(() {
                          _userData.gender = false;
                        });
                      },
                      widget: GenderWidget(
                          gender: 'MALE', icon: FontAwesomeIcons.mars),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.fromLTRB(12, 12, 12, 0),
              child: TextButton(
                onPressed: () {
                  Route route=  MaterialPageRoute(builder: (context)=>ResultPage(_userData));
                  Navigator.push(context, route);
                },
                child: Text('CALCULATE', style: kTextStyle),
                style: TextButton.styleFrom(
                  fixedSize: Size.fromHeight(50),
                  backgroundColor: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Row buildOutlinedButton(String title) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        RotatedBox(
          quarterTurns: -1,
          child: Text(
            title,
            style: kTextStyle,
          ),
        ),
        RotatedBox(
          quarterTurns: -1,
          child: Text(
            title == 'HEIGHT' ? _userData.height.toString() : _userData.weight.toString(),
            style: kIntegerStyle,
          ),
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            OutlinedButton(
              style: OutlinedButton.styleFrom(
                minimumSize: Size(36, 36),
                side: BorderSide(color: Colors.teal),
              ),
              onPressed: () {
                setState(() {
                  title == 'HEIGHT' ? _userData.height++ : _userData.weight++;
                });
              },
              child: Icon(
                FontAwesomeIcons.plus,
                color: Colors.teal,
                size: 12,
              ),
            ),
            OutlinedButton(
              style: OutlinedButton.styleFrom(
                minimumSize: Size(36, 36),
                side: BorderSide(color: Colors.teal),
              ),
              onPressed: () {
                setState(() {
                  title == 'HEIGHT' ? _userData.height-- : _userData.weight--;
                });
              },
              child: Icon(
                FontAwesomeIcons.minus,
                size: 12,
                color: Colors.teal,
              ),
            ),
          ],
        )
      ],
    );
  }
}
