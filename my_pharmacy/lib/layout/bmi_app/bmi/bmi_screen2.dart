import 'dart:math';

import 'package:flutter/material.dart';
import 'package:my_pharmacy/shared/components/components.dart';
import '../../../shared/cubit2/cubit.dart';
import '../bmi_result/mbi_result.dart';


class BmiScreen2 extends StatefulWidget {
  const BmiScreen2({super.key});

  @override
  State<BmiScreen2> createState() => _BmiScreen2State();
}

class _BmiScreen2State extends State<BmiScreen2> {
  bool isMale = true;
  double height = 120.0;
  int age = 40;
  int weight = 40;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
            'Pharmacy App'
        ),
        actions: [
          IconButton(
            onPressed: ()
            {
            },
            icon: Icon(Icons.search),),
          IconButton(
            onPressed: ()
            {
              AppCubit.get(context).changeAppMode();
            },
            icon: Icon(
              Icons.brightness_4_outlined,
            ),
          ),
        ],
      ),
      body:
        Column(
          children: [
            Expanded(
              child: GestureDetector(
                onTap: ()
                {
                  setState(() {
                    isMale = true;
                  });

                },
                child: Container(
                  padding: EdgeInsets.all(10),
                  child: Row(
                    children: [
                      Expanded(
                        child: Container(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                             Image(
                                 image: AssetImage('assets/images/Male_35764.png'),
                             height: 90.0,
                             width: 90.0,
                             ),
                              Text(
                                'MALE',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                  fontSize: 20,
                                ),
                              ),
                            ],
                          ),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10.0),
                            color: isMale? Colors.blue : Colors.grey[400],

                          ),
                        ),
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      Expanded(
                        child: GestureDetector(
                          onTap: ()
                          {
                            setState(() {
                              isMale = false;
                            });

                          },
                          child: Container(
                            decoration: BoxDecoration(
                              color: isMale? Colors.grey[400]: Colors.blue,
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Image(
                                  image: AssetImage('assets/images/Female_35792.png'),
                                  height: 90.0,
                                  width: 90.0,
                                ),
                                Text(
                                  'FEMALE',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20,
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
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 10.0,
                ),
                child: GestureDetector(
                  child: Container(
                              decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10.0),
                              color: Colors.grey[400],
                      ),
                   child: Column(
                     mainAxisAlignment: MainAxisAlignment.center,
                     children: [
                       Text(
                         'HEIGHT',
                         style: TextStyle(
                           fontWeight: FontWeight.bold,
                           fontSize: 18,
                         ),
                       ),
                       Row(
                         mainAxisAlignment: MainAxisAlignment.center,
                         crossAxisAlignment: CrossAxisAlignment.baseline,
                         textBaseline: TextBaseline.alphabetic,
                         children: [
                           Text(
                             '${height.round()}',
                                 style: TextStyle(
                                   fontWeight: FontWeight.w900,
                                   fontSize: 30,
                                 ),
                           ),
                           Text(
                             'CM',
                             style: TextStyle(
                               fontWeight: FontWeight.bold,
                             ),
                           ),
                         ],
                       ),
                       Slider(
                           value: height,
                           max: 220.0,
                           min: 80.0,
                           onChanged: (value){
                             setState((){
                               height = value;
                             });
                           },
                       ),
                     ],
                   ),
                  
                  ),
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Row(
                  children: [
                    Expanded(
                      child: Container(
                        padding: EdgeInsets.all(10),
                        child: Column(
                          children: [
                            Text(
                              'AGE',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                              ),
                            ),
                            Text(
                              '${age}',
                              style: TextStyle(
                                fontWeight: FontWeight.w900,
                                fontSize: 30,
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                            FloatingActionButton.small(
                                onPressed: (){
                                  setState(() {
                                    age--;
                                  });
                                },
                             child: Icon(Icons.remove,
                              size: 20,
                              color: Colors.white,
                              ),
                                backgroundColor: Colors.blue,
                            ),
                            SizedBox(
                              width: 10,
                            ),
                             FloatingActionButton.small(
                                onPressed: (){
                                  setState(() {
                                    age++;
                                  });
                                },
                              backgroundColor: Colors.blue,
                              child: Icon(Icons.add,
                             size: 20,
                              color: Colors.white,
                            ),
                             ),
                              ],
                            ),
                          ],
                        ),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.0),
                          color: Colors.grey[400],
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 15.0,
                    ),
                    Expanded(
                      child: Container(
                        padding: EdgeInsets.all(10),
                        child: Column(
                          children: [
                            Text(
                              'WEIGHT',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                              ),
                            ),
                            Text(
                              '${weight}',
                              style: TextStyle(
                                fontWeight: FontWeight.w900,
                                fontSize: 30,
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                            FloatingActionButton.small(
                                onPressed: (){
                                  setState(() {
                                    weight--;
                                  });
                                },
                             child: Icon(Icons.remove,
                              size: 20,
                              color: Colors.white,
                              ),
                                backgroundColor: Colors.blue,
                            ),
                            SizedBox(
                              width: 10,
                            ),
                             FloatingActionButton.small(
                                onPressed: (){
                                  setState(() {
                                    weight++;
                                  });
                                },
                              backgroundColor: Colors.blue,
                              child: Icon(Icons.add,
                             size: 20,
                              color: Colors.white,
                            ),),
                              ],
                            ),
                          ],
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
              height: 30,
              color: Colors.teal,
              child: Expanded(
                child: MaterialButton(
                    onPressed: ()
                    {
                       var result = weight / pow(height / 100, 2);
                       print(result.round());

                       navigateTo(context, MbiResult(
                           result : result,
                           age : age,
                           isMale : isMale
                       ));
                    },
                 child: Text(
                   'DONE',
                   style: TextStyle(
                     color: Colors.white,
                   ),
                 )),
              ),
            ),
          ],
        ),
    );
  }
}
