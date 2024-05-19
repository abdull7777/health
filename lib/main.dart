import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:project/shard/constant.dart';
import 'package:project/shard/cubit/cubit.dart';
import 'package:project/shard/cubit/states.dart';
import 'package:sqflite/sqflite.dart';

import 'modules/login.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  void initState() {}

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // createdb();
  @override
  void initState() {
    // TODO: implement initState
    createdbalert();
    // createdbappoint();
  }

  // This widget is the root of your application.

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => NewsCubit(),
      child: BlocConsumer<NewsCubit, NewsStates>(
          listener: (context, state) {},
          builder: (context, state) {
            var cubit = NewsCubit.get(context);

            return MaterialApp(
              localizationsDelegates: const [
                GlobalMaterialLocalizations.delegate,
                GlobalWidgetsLocalizations.delegate,
                GlobalCupertinoLocalizations.delegate,
              ],
              supportedLocales: const [
                Locale('ar', 'AE'),
              ],
              debugShowCheckedModeBanner: false,
              theme: ThemeData(
                scaffoldBackgroundColor: Colors.white,
              ),
              home: Login(),
            );
          }),
    );
  }

  void createdbalert() async {
    db = await openDatabase(
      'health.db',
      version: 1,
      onCreate: (data, version) {
        print("----------- Created MM--------------");
        data.execute(
            'CREATE TABLE users  (UserID  INTEGER PRIMARY KEY,Username TEXT, Password TEXT, Age INTEGER, HealthStatus TEXT )').then((value) => print('-----------user'));
        data.execute(
            'CREATE TABLE medicine (medicineid INTEGER PRIMARY KEY,name TEXT, dosage TEXT, frequency TEXT, time TEXT )').then((value) => print('-----------appointment'));
        data
            .execute(
            'CREATE TABLE appointments  (AppointmentID  INTEGER PRIMARY KEY,UserID TEXT, AppointmentDate TEXT, DoctorName TEXT, Message TEXT )').then((value) => print('-----------medicine'))
            .then(
              (value) {
            print("--------- Table Created mm---------");
          },
        ).catchError(
              (error) {
            print("---------- error ${error.toString()}-----------");
          },
        );
      },
      onOpen: (data) {
        print("----------- Opened -----------");
      },
    );
  }

  // void createdbappoint() async {
  //   db = await openDatabase(
  //     'health.db',
  //     version: 2,
  //     onCreate: (data, version) {
  //       print("----------- Created aa--------------");
  //
  //           data
  //               .execute(
  //               'CREATE TABLE appointments  (AppointmentID  INTEGER PRIMARY KEY,UserID TEXT, AppointmentDate TEXT, DoctorName TEXT, Message TEXT )')
  //               .then(
  //                 (value) {
  //               print("--------- Table Created aa---------");
  //             },
  //           ).catchError(
  //                 (error) {
  //               print("---------- error ${error.toString()}-----------");
  //             },
  //           );
  //       },
  //     onOpen: (data) {
  //       print("----------- Opened -----------");
  //     },
  //   );
  // }

}
