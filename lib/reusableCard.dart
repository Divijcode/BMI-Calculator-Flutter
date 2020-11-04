import 'main.dart';
import 'package:flutter/material.dart';

class ReusableCard extends StatelessWidget {

  final Color colour;
  final Widget Cardchild;

  ReusableCard({@required this.colour,this.Cardchild,this.onPress});
  final Function onPress;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Container(
        child:Cardchild,

        height: 150.0,

        margin:EdgeInsets.all(15.0),

        decoration: BoxDecoration(

          color:colour,
          borderRadius: BorderRadius.circular(10.0),
        ),
      ),
    );
  }
}


class ReusableCardChild extends StatelessWidget {
  final String gender;
  final Icon gendericon;
  ReusableCardChild({this.gender,this.gendericon});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        gendericon,
        SizedBox(height: 18.0),
        Text(gender,style:TextStyle(fontSize: 18.0,color: Colors.grey.shade400),),
      ],
    );
  }
}

class RoundIconButton extends StatelessWidget {
  RoundIconButton({this.icondata,this.onPressed});
  final IconData icondata;
  final Function onPressed;

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      child: Icon(icondata),
      onPressed: (){
        onPressed();
      },

      constraints: BoxConstraints.tightFor(
        height: 56.0,width: 56.0,
      ),
      fillColor: Color(0xFF4C4F5E),
      shape: CircleBorder(),
    );
  }
}


