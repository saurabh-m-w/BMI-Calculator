import 'package:flutter/material.dart';


class card_details extends StatelessWidget {

  final String Label;
  final IconData iconname;

  card_details({this.Label,this.iconname});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Icon(iconname,size: 80,color: Colors.white,),
        SizedBox(height: 15.0,),
        Text(Label, style: TextStyle(color: Colors.white, fontSize: 18.0),)
      ],);
  }
}


class Card_bmi extends StatelessWidget {
  final Color card_color;
  final Widget card_child;
  final Function onpressed;
  Card_bmi({this.card_color,this.card_child,this.onpressed});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onpressed,
      child: Container(
          child: card_child,
          margin: EdgeInsets.all(10.0),
          decoration: BoxDecoration(
              color: card_color,
              borderRadius: BorderRadius.circular(15.0)
          )
      ),
    );
  }
}
