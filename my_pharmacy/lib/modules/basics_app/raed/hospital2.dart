import 'package:flutter/material.dart';

class Hospital2 extends StatelessWidget{
  const Hospital2({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //سام قتيبة حاتم
      appBar: AppBar(
        leading: Icon(Icons.arrow_back_ios,
          color: Colors.white,),
        actions: [
          IconButton(onPressed: (){}, icon: Icon(Icons.account_circle_outlined,
            size: 40,
            color: Colors.white,),
          ),
        ],
        backgroundColor: Colors.teal,
        // هديل ابو ليث
        title: Text(
          "Doctors",
          style: TextStyle(
            color: Colors.white,
            fontSize: 30.0,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body:
      Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // سارة قيسية
            Text(
              "AL_SALAM HOSPITAL",
              style: TextStyle(
                fontSize: 30.0,
                color: Colors.grey,
                fontWeight: FontWeight.w900,
              ),
            ),
            SizedBox(
              height: 25.0,
            ),
            Text(
              "The Doctors for your condition",
              style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.w600,
                  color: Colors.teal
              ),
            ),
            // سلمى محمود_لجين صيموعة
            SizedBox(
              height: 20.0,
            ),
            Text(
              "choose one:",
              style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.w400,
                color: Colors.black45,

              ),
            ),
            SizedBox(
              height: 20,
            ),
            // فاتنة احمد مرام عليشة
            Container(
              height: 70,
              width: 200,
              child: TextButton(
                onPressed: (){},
                child: Text(
                  "Dr Adnan Al_khateb",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 15,
                  ),
                ),
                style: IconButton.styleFrom(
                    backgroundColor: Colors.teal),
              ),
            ),
            // سهى الخطيب
         SizedBox(
          height: 20,),
            Container(
              height: 70,
              width: 200,
              child: TextButton(
                onPressed: (){},
                child: Text(
                  "Dr ahmad ahmad",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 15,
                  ),
                ),
                style: IconButton.styleFrom(
                    backgroundColor: Colors.teal),
              ),
            ),
            SizedBox(
              height: 20,),
            Container(
              height: 70,
              width: 200,
              child: TextButton(
                onPressed: (){},
                child: Text(
                  "Dr Samer Al_khateb",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 15,
                  ),
                ),
                style: IconButton.styleFrom(
                    backgroundColor: Colors.teal),
              ),
            ),
            SizedBox(
              height: 20,),

            Container(
              height: 70,
              width: 200,
              child: TextButton(
                onPressed: (){},
                child: Text(
                  "Dr Hesham Ali",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 15,
                  ),
                ),
                style: IconButton.styleFrom(
                    backgroundColor: Colors.teal),
              ),
            ),
            SizedBox(
              height: 35,
            ),
            Center(
              child: Container(
                height: 70,
                width: 200,
                child: TextButton(
                  onPressed: (){},
                  child: Text(
                    "Choose",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 25,
                    ),
                  ),
                  style: IconButton.styleFrom(
                      backgroundColor: Colors.cyan),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

