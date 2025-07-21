import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_pharmacy/layout/pharmacy_app/cubit/states.dart';
import 'package:my_pharmacy/layout/pharmacy_app/dio_helper_pharmacy/dio_helper_pharmacy.dart';
import 'package:my_pharmacy/layout/pharmacy_app/pharmacy_layout.dart';
import 'package:my_pharmacy/modules/register_pharamcy/cubit/cubit.dart';
import 'package:my_pharmacy/modules/register_pharamcy/cubit/states.dart';
import 'package:my_pharmacy/modules/register_pharamcy/pharmacy_register_model.dart';
import '../../../modules/search_screen/search_screen.dart';
import '../../../shared/components/components.dart';
import '../../../shared/cubit2/cubit.dart';
class RegisterPharmacy extends StatelessWidget {

  var formKey = GlobalKey<FormState>();
  var nameController = TextEditingController();
  var locationController = TextEditingController();
  var phoneController = TextEditingController();
  var passwordController = TextEditingController();
  var emailController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => PharmacyRegisterCubit(),
      child: BlocConsumer<PharmacyRegisterCubit, PharmacyRegisterStetes>(
        listener: (context, state) => {},
          builder: (context, state)
          {
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
                            'REGISTER',
                            style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                              color: Colors.teal,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(
                            height: 10.0,
                          ),
                          Container(
                            width: 500,
                            height: 170,
                            child: Image(
                              image: AssetImage('assets/images/pharmacy_photo.png'),
                            ),
                          ),
                          SizedBox(
                            height: 10.0,
                          ),
                          defultTextField(
                            controller: passwordController,
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
                            height: 10.0,
                          ),
                          defultTextField(
                            controller: emailController,
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
                            height: 10.0,
                          ),
                          defultTextField(
                              controller: nameController,
                              type: TextInputType.text,
                              validate: (String? value)
                              {
                                if(value == null || value.isEmpty)
                                {
                                  return 'pharmacy name must not be empty';
                                }

                                return null;
                              },
                              label: 'Please Input Pharmacy Name',
                              prefix: Icons.add_business_outlined),
                          SizedBox(
                            height: 10.0,
                          ),
                          defultTextField(
                              controller: locationController,
                              type: TextInputType.text,
                              validate: (String? value)
                              {
                                if(value == null || value.isEmpty)
                                {
                                  return 'pharmacy location must not be empty';
                                }

                                return null;
                              },
                              label: 'Please Input Pharmacy Location',
                              prefix: Icons.location_on_outlined),
                          SizedBox(
                            height: 10.0,
                          ),
                          defultTextField(
                              controller: phoneController,
                              type: TextInputType.phone,
                              validate: (String? value)
                              {
                                if(value == null || value.isEmpty)
                                {
                                  return 'pharmacy Number must not be empty';
                                }

                                return null;
                              },
                              label: 'Please Input Pharmacy Phone',
                              prefix: Icons.add_call),
                          SizedBox(
                            height: 10.0,
                          ),
                          Container(
                            decoration: BoxDecoration(
                              color: Colors.teal,
                              borderRadius: BorderRadius.circular(25.0),
                            ),
                            height: 50.0,
                            width: 350.0,
                            child: ConditionalBuilder(
                              condition: state is! RegisterLoadingState,
                                builder: (context) => defultButton(
                                function: ()
                                {
                                  if(formKey.currentState!.validate())
                                  {
                                    Map<String, dynamic> postData = {
                                      'email' : emailController.text,
                                      'password' : passwordController.text,
                                      'pharmacy_name' : nameController.text,
                                      'location' : locationController.text,
                                      'phone_number' : phoneController.text,
                                    };
                                    DioHelperPharmacy.postData(
                                      url: '/signUp',
                                      query: {},
                                      data: postData,
                                    ).then((value){
                                      print(value.data);
                                    });
                                    navigateAndFinish(context, PharmacyLayout());
                                  }
                                  
                                },
                                text: 'register',
                                isUpperCase: true,
                              ), fallback: (context) => Center(child: CircularProgressIndicator()),
                            ),
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
