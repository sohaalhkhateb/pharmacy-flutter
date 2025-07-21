import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sqflite/sqflite.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';
import 'package:my_pharmacy/modules/for_you/cubit/states.dart';

class ForYouCubit extends Cubit<ForYouStates>
{
  ForYouCubit() : super(ForYouInitialState());

  static ForYouCubit get(context) => BlocProvider.of(context);

  late Database database;
  List<Map> tasks = [];

  void createDatabase()
  {
    databaseFactory=databaseFactoryFfi;
    openDatabase(
      'for_you.db',
      version: 1,
      onCreate: (database, version)
      {
        debugPrint('Database created');
        database.execute('CREATE TABLE tasks (id INTEGER PRIMARY KEY, DrName TEXT, drugName TEXT, drugTime TEXT, appropriate TEXT)').then((value)
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
      emit(ForYouCreateDatabaseState());
    });
  }

  Future<void> insertToDatabase({
    required String DrName,
    required String drugName,
    required String drugTime,
    required String appropriate,
  }) async {
    try {
      await database.transaction((txn) async {
        final value = await txn.rawInsert(
          'INSERT INTO tasks(DrName, drugName, drugTime, appropriate,) VALUES("$DrName", "$drugName", "$drugTime", "$appropriate")',
        );
        print('$value inserted successfully');

        emit(ForYouInsertDatabaseState());
      });
      getDataFromDatabase(database);
    } catch (error) {
      print('Error When Inserting New Record: ${error.toString()}');
      return Future.error('Insertion failed');
    }
  }

  void getDataFromDatabase(database)
  {
    tasks = [];

    emit(ForYouGetDatabaseLoadingState());

    database.rawQuery('SELECT * FROM tasks').then((value)
    {
      value.forEach((element)
      {
          tasks.add(element);
    });
      emit(ForYouGetDatabaseState());
  });
}

  void updateData({
    required int id,
  }) async
  {
    database.rawUpdate(
      'UPDATE tasks SET id =?',
      [id],
    ).then((value)
    {
      getDataFromDatabase(database);
      emit(ForYouUpdateDatabaseState());
    });
  }

  void deleteData({
    required int id,
  })
  {
    database.rawDelete('DELETE FROM tasks WHERE id= ?',[id]).then((value)
    {
      getDataFromDatabase(database);
      emit(ForYouDeleteDatabaseState());
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

    emit(ForYouChangeBottomSheetState());
  }
}