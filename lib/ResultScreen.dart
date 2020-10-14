import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ResultScreen extends StatelessWidget {
  final bmiModel;
  Color word_color;
  Icon ic;

  ResultScreen({this.bmiModel});



  @override
  Widget build(BuildContext context) {
    if(bmiModel.flag==1){
      word_color=Colors.yellowAccent;
      ic=Icon(Icons.sentiment_dissatisfied,size: 120,color: Colors.blueAccent,);
    }
    else if(bmiModel.flag==2){
      word_color=Colors.green;
      ic=Icon(Icons.mood,size: 120,color: Colors.blueAccent,);
    }
    else if(bmiModel.flag==3){
      word_color=Colors.blueAccent;
      ic=Icon(Icons.sentiment_dissatisfied,size: 120,color: Colors.blueAccent,);
    }
    else{
      word_color=Colors.redAccent;
      ic=Icon(Icons.mood_bad,size: 120,color: Colors.blueAccent,);
    }

    return Scaffold(
        body: Container(
          width: double.infinity,
          height: double.infinity,
          padding: EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[

              Container(
                height: 200,
                width: 200,
                child:ic ,
              ),

              SizedBox(
                height: 8,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("${bmiModel.bmi.round()}",style: TextStyle(color: Colors.orange,fontSize: 65,fontWeight: FontWeight.w700),),
                  Text(" BMI", style: TextStyle(color: Colors.white, fontSize: 25, fontWeight: FontWeight.w500),),
                ],
              ),
              SizedBox(height: 10,),
              Text("${bmiModel.comments}", style: TextStyle(color: word_color, fontSize: 34, fontWeight: FontWeight.w500),),

              SizedBox(height: 10,),
              Divider(color: Colors.grey,thickness: 8.0,),
              SizedBox(height: 80,),


              Row(
                children: <Widget>[
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text('Underweight',style:TextStyle(color:Colors.yellowAccent)),
                        SizedBox(height: 8.0,),
                        Divider(color: Colors.yellowAccent,thickness: 8,),
                        SizedBox(height: 8.0,),
                        Text('18.5')
                      ],
                    ),
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text('Normal',style:TextStyle(color:Colors.green)),
                        SizedBox(height: 8.0,),
                        Divider(color: Colors.green,thickness: 8,),
                        SizedBox(height: 8.0,),
                        Text('25')
                      ],
                    ),
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text('Overweight',style:TextStyle(color:Colors.blueAccent)),
                        SizedBox(height: 8.0,),
                        Divider(color: Colors.blueAccent,thickness: 8,),
                        SizedBox(height: 8.0,),
                        Text('30')
                      ],
                    ),
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text('Obese',style:TextStyle(color:Colors.redAccent)),
                        SizedBox(height: 8.0,),
                        Divider(color: Colors.redAccent,thickness: 8,),
                        SizedBox(height: 8.0,),
                        Text('')

                      ],
                    ),
                  )
                ],
              ),



              SizedBox(height: 50,),

              Container(
                height: 70,
                color: Colors.blueAccent,
                child: FlatButton.icon(
                  onPressed: (){

                    Navigator.pop(context);
                  },
                  icon: Icon(Icons.arrow_back_ios, color: Colors.white,),
                  label: Text("LET CALCULATE AGAIN",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15.0),),
                  textColor: Colors.white,
                  color: Colors.blueAccent,


                ),
                width: double.infinity,
                padding: EdgeInsets.only(left: 16, right: 16),
              )

            ],
          ),
        )
    );
  }
}