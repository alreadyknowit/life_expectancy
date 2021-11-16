import 'package:flutter/material.dart';
import 'package:life_expectancy/calculator.dart';
import 'package:life_expectancy/constants.dart';
import 'package:life_expectancy/user_data.dart';
import 'constants.dart';

class ResultPage extends StatelessWidget {
  UserData user;
  ResultPage(this.user);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.teal[300],
      appBar: AppBar(
        title: const Text('Result Page'),
        backgroundColor: Colors.teal,
        centerTitle: true,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            flex: 8,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Expected amount of life is...',
                  style: kTextStyle.copyWith(color: Colors.white, fontSize: 20),
                ),
                Text(
                  Calculator(user).calculate().toString(),
                  style: kTextStyle.copyWith(color: Colors.white, fontSize: 20),
                ),
              ],
            ),
          ),
          Expanded(
            flex: 1,
            child: Container(
              margin: EdgeInsets.fromLTRB(12, 12, 12, 0),
              child: TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text('GO BACK', style: kTextStyle),
                style: TextButton.styleFrom(
                  fixedSize: Size.fromHeight(50),
                  backgroundColor: Colors.white,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
