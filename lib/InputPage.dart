import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'BMIModel.dart';
import 'ResultScreen.dart';
import 'constant.dart';

enum Gender{Male ,Female}
Gender gender=Gender.Male;
double Height=180;
double min_slider=100,max_slider=250,incr_slider=1;
int Weight=50,div_slider=70;
int Age=20;
double _bmi = 0,w=1;
BMIModel _bmiModel;
String h='CM',x='KG';
bool currentTheme=true;

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {

  double roundDouble(double value, int places){
    double mod = pow(10.0, places);
    return ((value * mod).round().toDouble() / mod);
  }
  void fun(){
    if(h.compareTo('CM')==0){
      min_slider=100;max_slider=250;incr_slider=1;Height=180;div_slider=70;
    }
    else if(h.compareTo('Feet')==0){
      min_slider=3;max_slider=10;incr_slider=0.1;Height=6;div_slider=70;
    }
    else if(h.compareTo('M')==0){
      min_slider=1;max_slider=2.5;incr_slider=0.1;Height=2;div_slider=15;
    }
    else{
      min_slider=24;max_slider=120;incr_slider=1;Height=72;div_slider=96;
    }
  }

  double fun2(double hei) {

    if(h.compareTo('CM')==0){
      return Height/100;
    }
    else if(h.compareTo('Feet')==0){
      return Height*0.3048;
    }
    else if(h.compareTo('M')==0){
      return Height;
    }
    else{
      return Height*0.0254;
    }
    //return H;
  }

  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      theme: currentTheme ? ThemeData.dark():ThemeData.light(),
      home: Scaffold(
        resizeToAvoidBottomPadding: false,
        appBar: AppBar(
          title: Text("BMI Calculator"),

          actions: [
            IconButton(iconSize: 30,icon: Icon(Icons.invert_colors,),onPressed: (){setState(() {
              currentTheme=!currentTheme;
            });},)
          ],
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[


              Expanded(
              child: Row(
                children: <Widget>[
                  Expanded(child: Card_bmi(
                    card_color: gender==Gender.Male?   Colors.blue[500]:Color(0xFF111328),
                    card_child: card_details(Label: "Male",iconname: FontAwesomeIcons.male,),
                    onpressed: (){setState(() {
                      gender=Gender.Male;
                    });},
                  )),
                  Expanded(child:  Card_bmi(
                    card_color: gender==Gender.Female ?  Colors.blue[500]:Color(0xFF111328),
                    card_child: card_details(Label: "Female",iconname: FontAwesomeIcons.female,),
                    onpressed: (){setState(() {
                      gender=Gender.Female;
                    });},
                  ),),
                ],
              ),
            ),



            Expanded(
                child:Card_bmi(
              card_color: Color(0xFF1d1e33),
              card_child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text("HEIGHT",style:TextStyle(color: Color(0xFF8D8E98), fontSize: 18.0) ,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    textBaseline: TextBaseline.alphabetic,
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    children: <Widget>[
                      Text(Height.toString(),style: TextStyle(fontSize: 50.0,fontWeight: FontWeight.w900,color: Colors.white),),
                      //Text("CM",style:TextStyle(color: Color(0xFF8D8E98), fontSize: 18.0)),
                      SizedBox(width: 5,),
                      DropdownButton<String>(

                        icon: Icon(Icons.arrow_drop_down),
                        elevation: 0,
                        dropdownColor: Colors.black,
                        value:h,
                        iconSize: 24,
                        items: <String>['CM','M','Feet','Inches'].map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(value: value,child: Text(value,style: TextStyle(color: Colors.white),),);

                        }).toList(),

                        onChanged:(String newvalue){
                          setState(() {
                            h=newvalue;
                            fun();
                          });
                        },

                      )

                    ],
                  ),

                  SliderTheme(

                    data: SliderTheme.of(context).copyWith(
                        //thumbColor: Color(0xFFEB1555),
                        thumbColor: Colors.blueAccent,
                        overlayColor: Color(0x29EB1555),
                        activeTrackColor: Colors.blueAccent[100],
                        inactiveTrackColor: Color(0xFF8D8E98),
                        thumbShape:
                        RoundSliderThumbShape(enabledThumbRadius: 15.0),
                        overlayShape:
                        RoundSliderOverlayShape(overlayRadius: 30.0)),
                    child: Slider(
                      min: min_slider,
                      max: max_slider,
                      //divisions: div_slider,
                      value: Height.toDouble(),
                      onChanged: (double value){
                        setState(() {
                          Height=roundDouble(value, 1);
                        });
                      },
                    ),
                  )
                ],
              ),
            )),

            Expanded(
              child: Row(
                children: <Widget>[
                  Expanded(child:  Card_bmi(
                    card_color: Color(0xFF1d1e33),
                    card_child: Column(
                      children: [
                        SizedBox(height: 5,),
                        Text("WEIGHT",style:TextStyle(color: Color(0xFF8D8E98), fontSize: 18.0)),
                        SizedBox(height: 4,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(Weight.toString(),style: TextStyle(fontSize: 50.0,fontWeight: FontWeight.w900,color: Colors.white),),
                            SizedBox(width: 5,),
                            DropdownButton<String>(

                              icon: Icon(Icons.arrow_drop_down),
                              elevation: 0,
                              dropdownColor: Colors.black,
                              value:x,
                              iconSize: 20,
                              items: <String>['KG','Pounds'].map<DropdownMenuItem<String>>((String value) {
                                return DropdownMenuItem<String>(value: value,child: Text(value,style: TextStyle(color: Colors.white),),);

                              }).toList(),

                              onChanged:(String newvalue){
                                setState(() {
                                  if(newvalue.compareTo('KG')==0)
                                    {
                                      w=1;
                                      x='KG';
                                    }
                                  else{
                                    w=0.453592;
                                    x='Pounds';
                                  }
                                });
                              },

                            )
                          ],
                        ),
                        SizedBox(height: 5,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            RawMaterialButton(
                              onPressed: (){
                                if(Weight>1){
                                  setState(() {
                                    Weight--;
                                  });
                                }
                              },
                              child: Icon(FontAwesomeIcons.minus),
                              shape: CircleBorder(),
                              //fillColor: Color(0xFFEB1555),
                              fillColor: Colors.blueAccent,
                              elevation: 6.0,
                              constraints: BoxConstraints.tightFor(width: 56.0,height: 56.0),
                            ),
                            SizedBox(width: 10.0,),
                            RawMaterialButton(
                              onPressed: (){
                                setState(() {
                                  Weight++;
                                });
                              },
                              child: Icon(FontAwesomeIcons.plus),
                              shape: CircleBorder(),
                             // fillColor: Color(0xFFEB1555),
                              fillColor: Colors.blueAccent,
                              elevation: 6.0,
                              constraints: BoxConstraints.tightFor(width: 56.0,height: 56.0),
                            ),
                          ],
                        ),
                      ],
                    ),
                  )),
                  Expanded(child: Card_bmi(
                      card_color: Color(0xFF1d1e33),
                      card_child: Column(
                        children: [
                          SizedBox(height: 5,),
                          Text("AGE",style:TextStyle(color: Color(0xFF8D8E98), fontSize: 18.0,)),
                          SizedBox(height: 4,),
                          Text(Age.toString(),style: TextStyle(fontSize: 50.0,fontWeight: FontWeight.w900,color: Colors.white),),
                          SizedBox(height: 5,),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              RawMaterialButton(
                                onPressed: (){
                                  if(Age>1){
                                    setState(() {
                                      Age--;
                                    });
                                  }
                                },
                                child: Icon(FontAwesomeIcons.minus),
                                shape: CircleBorder(),
                                //fillColor: Color(0xFFEB1555),
                                fillColor: Colors.blueAccent,
                                elevation: 6.0,
                                constraints: BoxConstraints.tightFor(width: 56.0,height: 56.0),
                              ),
                              SizedBox(width: 10.0,),
                              RawMaterialButton(
                                onPressed: (){
                                  setState(() {
                                    Age++;
                                  });
                                },
                                child: Icon(FontAwesomeIcons.plus),
                                shape: CircleBorder(),
                                //fillColor: Color(0xFFEB1555),
                                fillColor: Colors.blueAccent,
                                elevation: 6.0,
                                constraints: BoxConstraints.tightFor(width: 56.0,height: 56.0),
                              ),
                            ],
                          ),
                        ],
                      ))),
                ],
              ),
            ),

           GestureDetector(
             onTap: (){

               double H= fun2(Height);
               setState(() {

                 _bmi=(Weight*w)/(H*H);

                 if(_bmi >= 18.5 && _bmi <= 25){
                   _bmiModel = BMIModel(bmi: _bmi, isNormal: true,flag: 2, comments: "Normal");
                 }else if(_bmi < 18.5){
                   _bmiModel = BMIModel(bmi: _bmi, isNormal: false,flag: 1, comments: "Underweighted");
                 }else if(_bmi > 25 && _bmi <= 30){
                   _bmiModel = BMIModel(bmi: _bmi,isNormal: false, flag: 3, comments: "Overweighted");
                 }else{
                   _bmiModel = BMIModel(bmi: _bmi, isNormal:false,flag: 4, comments: "Obese");
                 }
               });

               Navigator.push(context, MaterialPageRoute(
                   builder: (context) => ResultScreen(bmiModel: _bmiModel,)
               ));
             } ,
             child:  Container(
               child: Center(
                 child: Text("CALCULATE",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 25.0),),
               ),
               height: 60.0,
               margin: EdgeInsets.fromLTRB(10, 0, 10, 10),
               //color: Color(0xFFEB1555),
               color: Colors.blueAccent,
             ),
           )


          ],
        ),
      ),
    );
  }
}
