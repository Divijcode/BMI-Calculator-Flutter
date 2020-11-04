
import 'package:bmi_calculator/reusableCard.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'main.dart';


class ResultPage extends StatelessWidget {
  final String index,result,interpretation;

  ResultPage({@required this.index,@required this.result,@required this.interpretation});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            'BMI Calculator',
          ),
        ),
        body: Column(

          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Text('Your Result',

                style: TextStyle(

                  fontSize: 40.0,
                  fontWeight: FontWeight.bold,
                ),),
            ),
            Expanded(
              flex:5,
              child: ReusableCard(colour: kCardColor,
                Cardchild: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(
                      result,
                      style: TextStyle(
                        color: Colors.yellow.shade500,
                        fontSize: 25.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(index,
                          style: TextStyle(
                            fontSize: 60.0,
                            color: Colors.tealAccent,
                            fontWeight: FontWeight.bold,
                          ),),
                        Icon(FontAwesomeIcons.handMiddleFinger,color: Colors.brown.shade200,),
                      ],
                    ),

                    Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Text(interpretation,
                        style: TextStyle(
                          fontSize: 25.0,
                          fontWeight: FontWeight.bold,
                        ),),
                    ),
                  ],
                ),
              ),
            ),
            BottomButton(onTap: (){
              Navigator.pop(context);
            },),
          ],
        )
    );
  }
}
