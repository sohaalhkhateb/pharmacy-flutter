import 'package:flutter/material.dart';

class Hospital extends StatelessWidget {

  Widget build(BuildContext context) {
    return Scaffold(
      //سهى عدنان الخطيب
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
        title: Text(
          "Welcome",
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
            // مرام عليشة
            Text(
              "-Log-in the hospital system",
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.w600,
                color: Colors.teal
              ),
            ),
            SizedBox(
              height: 20.0,
            ),
            Text(
              "User Name:",
              style: TextStyle(
                fontSize: 10,
                fontWeight: FontWeight.w400,
                color: Colors.black45,

              ),
            ),
            SizedBox(
              height: 20,
            ),
            //سهى عدنان الخطيب
            TextFormField(
              decoration: InputDecoration(
                labelText: 'full name',
                prefixIcon: Icon(
                  Icons.account_box_rounded,
                  color: Colors.grey,
                ),
                border: OutlineInputBorder(),
              ),
            ),
            // حنان طارق نعمان
            SizedBox(
              height: 20.0,
            ),
            Text(
              "Medical Condition:",
              style: TextStyle(
                fontSize: 10,
                fontWeight: FontWeight.w400,
                color: Colors.black45,

              ),
            ),
            SizedBox(
              height: 20,
            ),
            //لجين حمود صيموعة
            TextFormField(
              decoration: InputDecoration(
                labelText: 'your condition',
                prefixIcon: Icon(
                  Icons.accessible_forward,
                  color: Colors.grey,
                ),
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(
              height: 20.0,
            ),
            Text(
              "Phone:",
              style: TextStyle(
                fontSize: 10,
                fontWeight: FontWeight.w400,
                color: Colors.black45,

              ),
            ),
            // سلمى سميع محمود
            SizedBox(
              height: 20,
            ),
            TextFormField(
              decoration: InputDecoration(
                labelText: 'enter number',
                prefixIcon: Icon(
                  Icons.ad_units_rounded,
                  color: Colors.grey,
                ),
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(
              height: 20.0,
            ),
            //
            //فاتنة احمد
            Center(
              child: Container(
                height: 70,
                width: 200,
                child: TextButton(
                    onPressed: (){},
                    child: Text(
                      "Login",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 25,
                      ),
                    ),
                style: IconButton.styleFrom(
                backgroundColor: Colors.teal),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

