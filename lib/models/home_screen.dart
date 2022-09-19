import 'dart:math';

import 'package:flutter/material.dart';

import 'result_screen.dart';


class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  bool ismale = true;
  double height=120.0;
  int age = 20;
  int weight =40;

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'BMI Calculator',
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Row(

                children: [
                  Expanded(
                    child: GestureDetector(
                      onTap: (){
                        setState((){
                          ismale=true;
                        });
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.0),
                          color:ismale?Colors.blue:Colors.grey[400],
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.male,
                              size: 80.0,
                            ),
                            Text('MALE',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 20.0,

                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 20.0,
                  ),
                  Expanded(
                    child: GestureDetector(
                      onTap:(){
                        setState(() {
                          ismale =false;
                        });
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.0),
                          color: !ismale?Colors.blue:Colors.grey[400],
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.female,
                              size: 80.0,
                            ),
                            Text('FEMALE',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 20.0,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),

                ],
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0,),
              child: Container(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('HEIGHT',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20.0,

                      ),
                    ),
                    SizedBox(
                      height: 2.0,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.baseline,
                      textBaseline: TextBaseline.alphabetic,
                      children: [
                        Text('${height.round()}',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 40.0,

                          ),
                        ),
                        Text('CM',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20.0,

                          ),
                        ),
                      ],
                    ),
                    Slider(value: height,
                      max: 220.0,
                      min: 80.0,
                      onChanged:(value){
                        setState(() {
                          height=value;
                          print(height.round());
                        });

                      }
                      ,)

                  ],
                ),
                decoration: BoxDecoration(borderRadius: BorderRadius.circular(10.0),
                  color: Colors.grey[400],
                ),
              ),
            ),
          ),

          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Expanded(
              child: Row(
                children: [
                  Expanded(
                    child: Container(
                      child: Padding(
                        padding: const EdgeInsetsDirectional.only(top: 10.0,bottom: 10.0,),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text('WEIGHT',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 20.0,

                              ),
                            ),
                            Text('$weight',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 40.0,

                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                FloatingActionButton(onPressed:(){
                                  setState(() {
                                    weight--;
                                  });
                                },
                                  child: Icon(Icons.remove),
                                  mini: true,
                                  heroTag: 'weight-',
                                ),
                                FloatingActionButton(onPressed:(){
                                  setState(() {
                                    weight++;
                                  });
                                },child: Icon(Icons.add),
                                  mini: true,
                                  heroTag: 'weight+',
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.0),
                        color: Colors.grey[400],
                      ),

                    ),
                  ),
                  SizedBox(
                    width: 20.0,
                  ),

                  Expanded(
                    child: Container(
                      child: Padding(
                        padding: const EdgeInsetsDirectional.only(bottom: 10.0,top: 10.0,),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text('AGE',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 20.0,

                              ),
                            ),
                            Text('$age',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 40.0,


                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                FloatingActionButton(onPressed:(){
                                  setState(() {
                                    age--;
                                  });
                                },
                                  child: Icon(Icons.remove),
                                  mini: true,
                                  heroTag: 'age-',
                                ),
                                FloatingActionButton(onPressed:(){
                                  setState(() {
                                    age++;
                                  });
                                },
                                  child: Icon(Icons.add),
                                  mini: true,
                                  heroTag: 'age+',
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.0),
                        color: Colors.grey[400],
                      ),

                    ),
                  ),
                ],
              ),
            ),
          ),
          Container(
              width: double.infinity,
              color: Colors.blue,
              child:
              MaterialButton(onPressed: (){
                double result = weight/pow(height/100, 2);
                print(result.round());
                Navigator.push(context,
                  MaterialPageRoute(
                    builder: (context)=>ResultScreen(
                      age: age,
                      ismale: ismale,
                      result: result.round(),
                    ),
                  ),
                );
              },
                child: Text('CALCULATE',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 20.0,
                  ),
                ),))
        ],
      ),
    );
  }
}
