import 'package:flutter/material.dart';
import 'package:my_pharmacy/shared/components/components.dart';

class LoginScreen extends StatefulWidget {
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  var emailContraller = TextEditingController();
  var passwordContraller = TextEditingController();
  bool ispassword = true;
  final GlobalKey<FormState> formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal,
        title: Text
          (
          'MY FLUTTER PROJECT',
          style: TextStyle(
            color: Colors.white,
            fontSize: 25,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Center(
          child: SingleChildScrollView(
            child: Form(
              key: formkey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Login',
                      style: TextStyle(
                        fontSize: 40.0,
                        fontWeight: FontWeight.bold,
                      )
                  ),
                  SizedBox(
                    height: 40.0,
                  ),
                  defultTextField(
                      controller: emailContraller,
                      type: TextInputType.emailAddress,
                      validate: (String? value)
                      {
                        if(value == null || value.isEmpty)
                        {
                          return'email must not be empty';
                        }
                        return null;
                      },
                      label: 'enter your Email',
                      prefix: Icons.email),
                  SizedBox(
                    height: 15.0,
                  ),
                  defultTextField(
                      controller: passwordContraller,
                      type: TextInputType.text,
                      validate: (String? value)
                      {
                        if(value == null || value.isEmpty)
                        {
                          return'password is too short';
                        }
                        return null;
                      },
                      label: 'enter your password',
                      prefix: Icons.lock,
                  suffix: ispassword==true ? Icons.visibility_off :  Icons.visibility ,
                    isPssword: ispassword,
                      onpress: ()
                      {
                        setState(() {
                          ispassword = !ispassword;
                        });

                      }),
                  SizedBox(
                    height: 20.0,
                  ),
                  defultButton(
                    radius: 20.0,
                      function: ()
                      {
                        if(formkey.currentState!.validate())
                        {
                          print(emailContraller.text);
                          print(passwordContraller.text);
                        }
                      },
                      text: 'login'),
                  SizedBox(
                    height: 10.0,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Don\'t have an account?',
                      ),
                      TextButton(onPressed: (){},
                        child: Text(
                          'Register Now',
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
