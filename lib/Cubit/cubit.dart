import 'package:flutter/material.dart';
import 'package:flutter_application_23/Cubit/states.dart';
import 'package:flutter_application_23/Modules/Archived.dart';
import 'package:flutter_application_23/Modules/Done.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sqflite/sqflite.dart';

import '../Modules/New_Tasks.dart';

class AppCubit extends Cubit<AppStates> {
  AppCubit() : super(AppInitialState());
  static AppCubit get(context) => BlocProvider.of(context);
  List<String> textAppBar = ["New_Tasks", "Done_Tasks", "Archived_Tasks"];
  List<Widget> screens = [
    const NewTasks(),
    const Done(),
    const Archived(),
  ];
  Database? database;
  List<Map> newtasks = [];
  List<Map> doneTasks = [];
  List<Map> archivedTasks = [];

  int currentIndex = 0;

  void changeIndex(int index) {
    currentIndex = index;
    emit(AppChangeButtomNavBarState());
  }

  void createDataBase() {
    openDatabase(
      'project2.db',
      version: 1,
      onCreate: (database, version) async {
        print("DataBase Created");
        await database.execute(
            'CREATE TABLE Test (id INTEGER PRIMARY KEY, title TEXT, date TEXT, time TEXT,status TEXT)');
      },
      onOpen: (database) {
        getDataFromDatabase(database);
        print("DataBase Opened");
      },
    ).then((value) {
      database = value;
      emit(AppCreateDataBaseState());
    });
  }

  insertDataBase(
      {required String title,
      required String time,
      required String date}) async {
    await database?.transaction((txn) async {
      txn
          .rawInsert(
              'INSERT INTO Test(title, date, time,status) VALUES("$title", "$time", "$date","New")')
          .then((value) {
        print("${value}Inserted Successfully");
        emit(AppInsertDataBaseState());
        getDataFromDatabase(database);
      }).catchError((error) {
        print("Error while inserting data ${error.toString()}");
      });
      return null;
    });
  }

  void getDataFromDatabase(database) {
    newtasks = [];
    doneTasks = [];
    archivedTasks = [];
    emit(AppGetDataBaseLoadingState());
    database!.rawQuery('SELECT * FROM Test').then((value) {
      value.forEach((Element) {
        if (Element['status'] == 'New') {
          newtasks.add(Element);
        } else if (Element['status'] == 'Done') {
          doneTasks.add(Element);
        } else {
          archivedTasks.add(Element);
        }
      });
      emit(AppGetDataBaseState());
    });
  }

  void updateDataBase({required String status, required int id}) {
    // Update some record
    database!.rawUpdate(
        'UPDATE Test SET status = ? WHERE id = ?', [status, id]).then((value) {
      getDataFromDatabase(database);
      emit(AppUpdateDataBaseState());
    });
  }

  void deleteDataBase({required int id}) {
    database!.rawDelete('DELETE FROM Test WHERE id = ?', [id]).then((value) {
      getDataFromDatabase(database);
      emit(AppDeleteDataBaseState());
    });
  }

  IconData sicon = Icons.edit;
  bool isButtomSheetShown = false;

  void changeButtomSheetState(
      {required bool isShown, required IconData icond}) {
    isButtomSheetShown = isShown;
    sicon = icond;
    emit(AppChangeButtomSheetState());
  }
}
