import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project/modules/chatscreen.dart';
import 'package:project/modules/home.dart';

import 'package:project/shard/cubit/states.dart';
import 'package:sqflite/sqflite.dart';

import '../../modules/alerts.dart';
import '../../modules/appointment.dart';
import '../styles/color.dart';

class NewsCubit extends Cubit<NewsStates> {
  NewsCubit():super(NewsInitState());
  var database;
  var db ;
  int userid = 1;



  static NewsCubit get(context) => BlocProvider.of(context);
  late TextEditingController appiontmentTime = TextEditingController();

  int currentIndex = 1;
  List<Widget> curveditems = [
    Icon(
      Icons.punch_clock,
      color: colorborder,
    ),
    Icon(Icons.home, color: colorborder),
    Icon(Icons.receipt_long, color: colorborder),
    Icon(Icons.message, color: colorborder)
  ];

  List<Widget> screens = [
     Alerts(),
    const Home(),
     Appointment(),
    const Chatscreen(),
  ];
  List<String> inputFieldNameAppoint = <String>[
    "الوقت",
    "الرسالة",
    "اسم الدكتور",
  ];
  List<TextEditingController> inputFieldNameAppointController =
      <TextEditingController>[
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
  ];
  List<String> inputFieldAlertAppoint = <String>[
    "يجب ادخال الوقت",
    "يجب ادخال الرسالة",
    "يجب ادخال التنبية",
  ];
  List<String> messageList = <String>['ASD'];
  List<Map> tasks = [];

  List<TextInputType> inputFieldInputTypeAppoint = <TextInputType>[
    TextInputType.datetime,
    TextInputType.name,
    TextInputType.datetime,
  ];
  List<String> inputFieldNameAlert = <String>[
    "الاسم",
    "الجرعة",
    "التكرار",
    "التنبية",
  ];
  List<String> inputFieldAlertAlert = <String>[
    "يجب ادخال الاسم",
    "يجب ادخال الجرعة",
    "يجب ادخال التكرار",
    "يجب ادخال التنبية",
  ];
  List<TextInputType> inputFieldInputTypeAlert = <TextInputType>[
    TextInputType.name,
    TextInputType.name,
    TextInputType.name,
    TextInputType.datetime,
  ];

  void changeBottomNavBar(int index) {
    currentIndex = index;
    emit(NewsBottomNavState());
  }

  // void createDatabase() async {
  //   database = await openDatabase(
  //     "project.db",
  //     version: 1,
  //     onCreate: (db, version) async {
  //       await db
  //           .execute(
  //               "CREATE TABLE `medications` (`MedicationID` int(11) NOT NULL,`Name` varchar(100) NOT NULL,`Dosage` varchar(50) DEFAULT NULL,`Frequency` varchar(50) DEFAULT NULL) ")
  //           .then((value) => print("database_created"))
  //           .catchError((error) {
  //         print(error.toString());
  //       });
  //       await db
  //           .execute(
  //               "CREATE TABLE `appointments` (  `AppointmentID` int(11) PRIMARY KEY AUTO_INCREMENT,  `UserID` int(11) DEFAULT NULL,  `AppointmentDate`  varchar(255) DEFAULT NULL,  `DoctorName` varchar(100) DEFAULT NULL,  `Message` varchar(255) DEFAULT NULL,)")
  //           .then((value) => print("database_created"))
  //           .catchError((error) {
  //         print(error.toString());
  //       });
  //     },
  //     onOpen: (database) {
  //       getDataFromDataBase(database).then((value) {
  //         tasks = value;
  //         print("$tasks[0]" + " databaseOpened");
  //       });
  //     },
  //   );
  // }

  // void createdb() async {
  //   db = await openDatabase(
  //     'health.db',
  //     version: 1,
  //     onCreate: (data, version) {
  //       print("----------- Created --------------");
  //       data
  //           .execute(
  //               'CREATE TABLE medicine (medicineid INTEGER PRIMARY KEY,name TEXT, dosage TEXT, frequency TEXT, time TEXT )')
  //           .then(
  //         (value) {
  //           print("--------- Table Created ---------");
  //         },
  //       ).catchError(
  //         (error) {
  //           print("---------- error ${error.toString()}-----------");
  //         },
  //       );
  //     },
  //     onOpen: (data) {
  //       print("----------- Opened -----------");
  //     },
  //   );
  // }
  //
  // Future insertToDatabase() async {
  //   print('---------------------');
  //    return await db.transaction(
  //     (txn) async {
  //         await txn.rawInsert(
  //               'INSERT INTO medicine (name, dosage, frequency, time) VALUES("panadol","1 pill","3 times a day","5:00 pm")')
  //           .then(
  //         (value) {
  //           print('--------- inserted successfully ------------- ');
  //         },
  //       )
  //           .catchError((error)
  //       {
  //         print('---------- fail to insert record ${error.toString()}');
  //       });
  //         return null;
  //     },
  //   )?? print('error------------------');
  // }

//   Future insertAppointmentDatabase(
//       String AppointmentDate, String DoctorName, String Message) async {
//     return await database?.transaction((txn) {
//       int id3 = txn.rawInsert(
//         """ INSERT INTO `appointments` ( `AppointmentDate`, `DoctorName`, `Message`) VALUES ( '$AppointmentDate','$DoctorName', '$Message')""",
//
// //              """INSERT INTO `appointments` ( `UserID`, `AppointmentDate`, `DoctorName`, `Message`) VALUES
// // ( 1, '2024-05-10 09:00:00', 'Dr. Smith', 'Regular Checkup'),
// // ( 2, '2024-05-11 10:00:00', 'Dr. Johnson', 'Diabetes Management'),
// // ( 3, '2024-05-12 11:00:00', 'Dr. Williams', 'Blood Pressure Review'),
// // ( 4, '2024-05-13 12:00:00', 'Dr. Brown', 'Annual Physical'),
// // ( 5, '2024-05-14 13:00:00', 'Dr. Davis', 'Asthma Follow-up'),
// // ( 1, '2024-05-10 09:00:00', 'Dr. Smith', 'Regular Checkup'),
// // ( 2, '2024-05-11 10:00:00', 'Dr. Johnson', 'Diabetes Management'),
// // ( 3, '2024-05-12 11:00:00', 'Dr. Williams', 'Blood Pressure Review'),
// // ( 4, '2024-05-13 12:00:00', 'Dr. Brown', 'Annual Physical'),
// // ( 5, '2024-05-14 13:00:00', 'Dr. Davis', 'Asthma Follow-up');
// // """
//       ).then((value) {
//         print("database inserted succsesfully $value");
//       }).catchError((error) => print("database --------- ${error.toString}"));
//       return id3;
//     }).then((value) {
//       print(value);
//     }).catchError((error) {
//       print("objec-------t ${error.toString()}");
//     });
//   }
//
//   Future insertMedicationsDatabase(String name, String dosage, String Frequency,
//       String MedicationTime) async {
//     return await database?.transaction((txn) async {
//       await txn.rawInsert(
//           "INSERT INTO `medications` (`MedicationID`, `Name`, `Dosage`, `Frequency`,'MedicationTime') VALUES(1, ?, ?, ?,?)",
//           ['$name', '$dosage', '$Frequency', '$MedicationTime']);
//     });
//     return null;
//   }
//
//   Future<List<Map>> getDataFromDataBase(database) async {
//     return await database.rawQuery('SELECT * FROM appointments');
//   }

  void addMessage(String message) {
    messageList.add(message);
  }
}
