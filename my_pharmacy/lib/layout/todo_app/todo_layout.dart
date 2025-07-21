import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_conditional_rendering/conditional.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';
import 'package:my_pharmacy/shared/components/components.dart';
import 'package:intl/intl.dart';

import '../../shared/components/constants.dart';
import '../../shared/cubit2/cubit.dart';
import '../../shared/cubit2/states.dart';


class HomeLayout extends StatelessWidget
{


var scaffoldKey = GlobalKey<ScaffoldState>();
var formKey = GlobalKey<FormState>();
var titleController = TextEditingController();
var timeController = TextEditingController();
var dateController = TextEditingController();


@override
Widget build(BuildContext context) {
return BlocConsumer<AppCubit, AppStates>(
    listener: (BuildContext context, AppStates state) {
      if(state is AppInsertDatabaseState)
        {
          Navigator.pop(context);
        }
    },
    builder: (BuildContext context, AppStates state)
    {
      AppCubit cubit = AppCubit.get(context);
      return Scaffold(
        key: scaffoldKey,
        appBar: AppBar(
          title: Text(
            cubit.titles[cubit.currentindex],
            style: TextStyle(
              color: Colors.white,
            ),
          ),
          backgroundColor: Colors.blue,
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: ()
          {
            if(cubit.isBottomSheetShown)
            {
              if(formKey.currentState!.validate())
              {
                cubit.insertToDatabase(
                    title: titleController.text,
                    time: timeController.text,
                    date: dateController.text);
              }
            } else
            {
              scaffoldKey.currentState?.showBottomSheet(
                    (context) => Container(
                     color: Colors.white,
                     padding: EdgeInsets.all(20.0),
                     child: Form(
                      key: formKey,
                      child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        defultTextField(
                          controller: titleController,
                          type: TextInputType.text,
                          validate: (String? value)
                          {
                            if(value == null || value.isEmpty)
                            {
                              return 'title must not be empty';
                            }

                            return null;
                          },
                          label: 'Task Title',
                          prefix: Icons.title,
                        ),
                        SizedBox(
                          height: 15.0,
                        ),
                        defultTextField(
                          controller: timeController,
                          type: TextInputType.datetime,
                          onTap: (){
                            showTimePicker(
                              context: context,
                              initialTime: TimeOfDay.now(),
                            ).then((value)
                            {
                              if (value != null) { // Check if the value is not null
                                timeController.text = value.format(context);
                                print(timeController.text);
                              }
                            });
                          },
                          validate: (String? value)
                          {
                            if(value == null || value.isEmpty)
                            {
                              return 'time must not be empty';
                            }

                            return null;
                          },
                          label: 'Task Time',
                          prefix: Icons.watch_later_outlined,
                        ),
                        SizedBox(
                          height: 15.0,
                        ),
                        defultTextField(
                          controller: dateController,
                          type: TextInputType.datetime,
                          onTap: ()
                          {
                            showDatePicker(
                              context: context,
                              initialDate: DateTime.now(),
                              firstDate: DateTime.now(),
                              lastDate: DateTime.parse('2026-05-03'),
                            ).then((value)
                            {
                              print(DateFormat.yMMMd().format(value!));
                              dateController.text = DateFormat.yMMMd().format(value!);                                        });
                          },
                          validate: (String? value)
                          {
                            if(value == null || value.isEmpty)
                            {
                              return 'date must not be empty';
                            }

                            return null;
                          },
                          label: 'Task date',
                          prefix: Icons.calendar_today_rounded,
                        ),

                      ],
                    ),
                  ),
                ),
                elevation: 25.0,
              ).closed.then((value)
              {
                cubit.changeBottomSheetState(
                    isShow: false,
                    icon: Icons.edit);
              });
              cubit.changeBottomSheetState(
                  isShow: true,
                  icon: Icons.add);
            }

          },

          backgroundColor: Colors.blue,
          foregroundColor: Colors.white,
          child: Icon(
              cubit.fabIcon),
        ),
        bottomNavigationBar: BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            currentIndex: cubit.currentindex,
            onTap: (index)
            {
              cubit.changeIndex(index);
            },
            items:
            [
              BottomNavigationBarItem(
                icon: Icon(Icons.menu),
                label: 'Tasks',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.check_circle_outline),
                label: 'Done',),
              BottomNavigationBarItem(
                icon: Icon(Icons.archive_outlined,),
                label: 'Aichive',),
            ]),
        body: state is AppGetDatabaseLoadingState? Center(child: CircularProgressIndicator(),) : cubit.screens[cubit.currentindex],
      );
    },
);
}



}
