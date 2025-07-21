import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sqflite/sqflite.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';
import 'package:my_pharmacy/shared/cubit2/states.dart';

import '../../modules/todo_app/archive_tasks/archive_tasks_screen.dart';
import '../../modules/todo_app/done_tasks/done_tasks_screen.dart';
import '../../modules/todo_app/new_tasks/new_tasks_screen.dart';
import '../network/local/cache_helper.dart';

class AppCubit extends Cubit<AppStates>
{
  AppCubit() : super(AppInitialState());

  static AppCubit get(context) => BlocProvider.of(context);

  int currentindex = 0;
  late Database database;
  List<Map> newtasks = [];
  List<Map> donetasks = [];
  List<Map> archivetasks = [];


  List<Widget> screens = [
    NewTasksScreen(),
    DoneTasksScreen(),
    ArchiveTasksScreen()
  ];
  List<String> titles =
  [
    'New Tasks',
    'Done Tasks',
    'Archive Tasks',
  ];

  void changeIndex(int index)
  {
    currentindex = index;
    emit(AppChangeBottomNavBarState());
  }

  void createDatabase() 
  {
    databaseFactory=databaseFactoryFfi;
    openDatabase(
      'to.db',
      version: 1,
      onCreate: (database, version)
      {
        debugPrint('Database created');
        database.execute('CREATE TABLE tasks (id INTEGER PRIMARY KEY, title TEXT, date TEXT, time TEXT, status TEXT)').then((value)
        {
          debugPrint('table created 1');

        }).catchError((error)
        {
          debugPrint('Error When Creating Table ${error.toString()}');
        });
      },
      onOpen: (database)
       {
        getDataFromDatabase(database);
        debugPrint('database opened');
      },
    ).then((value)
    {
      database = value;
      emit(AppCreateDatabaseState());
    });


  }
  Future<void> insertToDatabase({
    required String title,
    required String time,
    required String date,
  }) async {
    try {
      await database.transaction((txn) async {
        final value = await txn.rawInsert(
          'INSERT INTO tasks(title, date, time, status) VALUES("$title", "$date", "$time", "new")',
        );
        print('$value inserted successfully');

        emit(AppInsertDatabaseState());
      });
      getDataFromDatabase(database);
    } catch (error) {
      print('Error When Inserting New Record: ${error.toString()}');
      return Future.error('Insertion failed');
    }
  }
  void getDataFromDatabase(database)
  {
    newtasks = [];
    donetasks = [];
    archivetasks = [];

    emit(AppGetDatabaseLoadingState());

    database.rawQuery('SELECT * FROM tasks').then((value)
    {
      value.forEach((element)
      {
       if(element['status'] == 'new')
         newtasks.add(element);
       else if(element['status'] == 'done')
         donetasks.add(element);
       else archivetasks.add(element);
      });

      emit(AppGetDatabaseState());
    });
  }

  void updateData({
    required String status,
    required int id,
}) async
  {
   database.rawUpdate(
      'UPDATE tasks SET status = ? WHERE id =?',
      ['$status', id],
    ).then((value)
   {
     getDataFromDatabase(database);
      emit(AppUpdateDatabaseState());
   });
  }

  void deleteData({
    required int id,
  })
  {
    database.rawDelete('DELETE FROM tasks WHERE id= ?',[id]).then((value)
    {
      getDataFromDatabase(database);
      emit(AppDeleteDatabaseState());
    });
  }

  bool isBottomSheetShown = false;
  IconData fabIcon =Icons.edit;

  void changeBottomSheetState({
    required bool isShow,
    required IconData icon,
  })
  {
    isBottomSheetShown = isShow;
    fabIcon = icon;

    emit(AppChangeBottomSheetState());
  }

  bool isDark = false;

  void changeAppMode([bool? fromShared])
  {
    if(fromShared != null)
    {
      isDark = fromShared;
      emit(AppChangeModeState());
    }
    else
    {
      isDark = !isDark;
    CacheHelper.putBoolean(key: 'isDark', value: isDark).then((value)
    {
      emit(AppChangeModeState());
    });
    }
  }

}