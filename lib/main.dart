

import 'package:bmi_calculator/BMI.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'reusableCard.dart';
import 'ResultPage.dart';

const kContainerHeight=80.0;
const Color kCardColor= Color(0xFF1D1E33);
const Color kinactiveCardColor= Color(0xFF111322);
const kCardtextstyle= TextStyle(

  fontSize: 50.0,
  fontWeight: FontWeight.w900,
);
const klabeltextstyle=TextStyle(
  fontSize: 18.0,
  fontWeight: FontWeight.w100,
  color: Color(0xFF8D8E98),

);

void main() {
  runApp(BMIcalculator());
}

class BMIcalculator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(
        primaryColor: Color(0xFF0A0A21),
        scaffoldBackgroundColor: Color(0xFF0A0A21),

      ),
      home: InputPage(),
    );
  }
}

enum Usergender{
  male,female
}


class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {

  Color malecardcolor= kinactiveCardColor;
  Color femalecardcolor= kinactiveCardColor;

  Usergender selectedgender;
  int height=120;
  int age=18;
  int weight=35;



  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(
        title: Text('BMI Calculator'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Row(
            children: [
              Expanded(
                child: ReusableCard(
                  onPress:(){
                    setState(() {
                      selectedgender=Usergender.male;
                    });
                  },
                  colour: selectedgender== Usergender.male?kCardColor:kinactiveCardColor,
                  Cardchild:ReusableCardChild(gender:'MALE',gendericon: Icon(FontAwesomeIcons.mars,size: 80.0,),),
                ),
                ),


              Expanded(
                child: ReusableCard(
                  onPress: () {
                    setState(() {
                      selectedgender=Usergender.female;
                    });
                  },
                    colour: selectedgender== Usergender.female ?kCardColor:kinactiveCardColor,
                  Cardchild:ReusableCardChild(gender:'FEMALE',gendericon: Icon(FontAwesomeIcons.venus,size: 80.0,),),
                ),
              ),
            ],
          ),
          Expanded(
            child: ReusableCard(

              colour:kCardColor,
              Cardchild: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    'HEIGHT',
                        style:klabeltextstyle,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline :TextBaseline.alphabetic,
                    children: [
                      Text(
                        height.toString(),
                        style: kCardtextstyle,
                      ),
                      Text(
                        'cm',
                        style: klabeltextstyle,
                      ),


                    ],
                  ),
                  SliderTheme(
                    data: SliderTheme.of(context).copyWith(
                      thumbColor: Color(0xFFEB1555),
                      activeTrackColor: Colors.pink,
                      thumbShape: RoundSliderThumbShape(enabledThumbRadius: 12.0),
                      overlayShape: RoundSliderOverlayShape(overlayRadius: 22.0),
                      overlayColor: Color(0x29EB1555),
                    ),
                    child: Slider(
                      value: height.toDouble(),
                      min: 120,
                      max: 220,

                      inactiveColor: Colors.grey,
                      onChanged: (double newvalue){
                        setState(() {
                          height=newvalue.round();
                        });

                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
          Row(
            children: [
              Expanded(
                child: ReusableCard(

                  colour:kCardColor,
                  Cardchild: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        'WEIGHT',
                        style: klabeltextstyle,
                      ),
                      Text(weight.toString(),style: kCardtextstyle),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          RoundIconButton(icondata: FontAwesomeIcons.plus,
                            onPressed: (){
                              setState(() {
                                weight++;
                              });
                            },),
                          SizedBox(width: 10.0),
                          RoundIconButton(icondata: FontAwesomeIcons.minus,
                          onPressed: (){
                            setState(() {
                              weight--;
                            });
                          },),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                child: ReusableCard(colour:kCardColor,
                  Cardchild: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        'AGE',
                        style: klabeltextstyle,
                      ),
                      Text(age.toString(),style: kCardtextstyle),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          RoundIconButton(icondata: FontAwesomeIcons.plus,
                            onPressed: (){
                              setState(() {
                                age++;
                              });
                            },),
                          SizedBox(width: 10.0),
                          RoundIconButton(icondata: FontAwesomeIcons.minus,
                            onPressed: (){
                              setState(() {
                                age--;
                              });
                            },),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          BottomButton(onTap: (){
            resultcalculate calc=resultcalculate(height: height,weight: weight);
            Navigator.push(context, MaterialPageRoute(builder: (context)=>ResultPage(
              index: calc.calculateBMI(),
              result: calc.getResult(),
              interpretation: calc.getInterpretation(),

            )),);


          },
          ),
    ],

      ),
    );
  }
}

class BottomButton extends StatelessWidget {

  BottomButton({this.onTap});
final Function onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        child: Center(child: Text(
            'CALCULATE',
          style: TextStyle(
            fontWeight: FontWeight.w900,
            color: Colors.white,
            fontSize: 20.0,


          ),
        ),

        ),
        color: Color(0xFFEB1555),
        height: kContainerHeight,
        width: double.infinity,
      ),
    );
  }
}

