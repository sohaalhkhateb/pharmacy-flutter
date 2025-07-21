import 'dart:ffi';

import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_pharmacy/layout/pharmacy_app/dio_helper_pharmacy/dio_helper_pharmacy.dart';
import 'package:my_pharmacy/layout/pharmacy_app/pharmacy_layout.dart';
import 'package:my_pharmacy/models/calculate_app/calculate.dart';

import '../../../modules/register_screen/cubit/cubit.dart';
import '../../../modules/register_screen/cubit/states.dart';
import '../../../modules/register_pharamcy/register_pharmacy.dart';
import '../../../modules/register_screen/continuescreen.dart';
import '../../../modules/search_screen/search_screen.dart';
import '../../../shared/components/components.dart';
import '../../../shared/cubit2/cubit.dart';
class LoginPharmacy extends StatelessWidget {

  var formKey = GlobalKey<FormState>();
  var emailConroller = TextEditingController();
  var passwordConroller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => PharmacyLoginCubit(),
      child: BlocConsumer <PharmacyLoginCubit, PharmacyLoginStetes>(
        listener: (context, state) =>
        {},
        builder: (context, state){
          return Scaffold(
              appBar: AppBar(
                title: Text(
                    'Pharmacy App'
                ),
                actions: [
                  IconButton(
                    onPressed: ()
                    {
                      navigateTo(context, ProductsSearchScreen(),);
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
              body: Form(
                key: formKey,
                child: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'LOGIN',
                          style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                            color: Colors.teal,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Center(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              width: 500,
                              child: Image(
                                image: AssetImage('assets/images/login_pharmacy.png'),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 25.0,
                        ),
                        defultTextField(
                          controller: passwordConroller,
                          type: TextInputType.visiblePassword,
                          suffix: Icons.visibility_outlined,
                          onpress: ()
                          {

                          },
                          validate: (String? value)
                          {
                            if(value == null || value.isEmpty)
                            {
                              return 'password is too short';
                            }
                          },
                          label: 'Password',
                          prefix: Icons.lock_outline,
                        ),
                        SizedBox(
                          height: 25.0,
                        ),
                        defultTextField(
                          controller: emailConroller,
                          type: TextInputType.emailAddress,
                          validate: (String? value)
                          {
                            if(value == null || value.isEmpty)
                            {
                              return 'please enter your email address';
                            }
                          },
                          label: 'Email Address',
                          prefix: Icons.email_outlined,
                        ),
                        SizedBox(
                          height: 25.0,
                        ),
                        Container(
                          decoration: BoxDecoration(
                            color: Colors.teal,
                            borderRadius: BorderRadius.circular(25.0),
                          ),
                          height: 50.0,
                          width: 350.0,
                          child: ConditionalBuilder(
                            condition: state is! LoginLoadingState,
                            builder: (context) => defultButton(
                              function: ()
                              {
                                if(formKey.currentState!.validate())
                                {
                                  Map<String, dynamic> postData = {
                                    'email' : emailConroller.text,
                                    'password' : passwordConroller.text,
                                  };

                                  DioHelperPharmacy.postData(
                                      url: 'http://127.0.0.1:5000/login',
                                      query: {},
                                      data: postData,
                                  ).then((value){
                                    print(value.data);
                                    final message = value.data['message'];
                                    print('Server message: $message');

                                    ScaffoldMessenger.of(context).showSnackBar(
                                        SnackBar(content: Text('$message')),
                                    );
                                  });
                                  navigateAndFinish(context, PharmacyLayout());
                                }
                              },
                              text: 'login',
                              isUpperCase: true,
                            ),
                            fallback: (context) => Center(child: CircularProgressIndicator()),
                          ),
                        ),
                        SizedBox(
                          height: 25.0,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Don\'t have an account?',
                            ),
                            defultTextButton(
                              function: ()
                              {
                                navigateTo(context, RegisterPharmacy());
                              },
                              text: 'register',
                            ),
                          ],
                        ),
                      ],

                    ),
                  ),
                ),
              )
          );
        },
      ),
    );
  }
}
