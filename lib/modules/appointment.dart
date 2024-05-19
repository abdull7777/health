import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project/shard/components/components.dart';
import 'package:project/shard/cubit/cubit.dart';
import 'package:project/shard/cubit/states.dart';
import 'package:sqflite/sqflite.dart';

import '../shard/constant.dart';
import '../shard/styles/color.dart';

class Appointment extends StatefulWidget {
  @override
  State<Appointment> createState() => _AppointmentState();
}

class _AppointmentState extends State<Appointment> {
  // const Appointment({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    TextEditingController t1 = TextEditingController();
    TextEditingController t2 = TextEditingController();
    TextEditingController t3 = TextEditingController();

    return BlocProvider(

        create: (BuildContext context) => NewsCubit(),
        child: BlocConsumer<NewsCubit, NewsStates>(
            listener: (context, state) {},
            builder: (context, state) {
              var cubit = NewsCubit.get(context);

              return Scaffold(
                  body: SingleChildScrollView(
                  child: Padding(
                  padding: const EdgeInsets.only(top: 102),
              child: Container(
              width: double.infinity,
              child: Padding(
              padding: const EdgeInsets.only(right: 10),
              child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
              Container(
              child: Text(
              'ادارة المواعيد',
              style: TextStyle(
              color: colorborder,
              fontSize: 40,
              fontWeight: FontWeight.bold),
              ),
              ),
              const SizedBox(
              height: 10,
              ),
              Container(
              width: 113,
              height: 44,
              decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(
              30.0,
              ),
              border: Border.all(
              color: colorborder,
              width: 3,
              )),
              child: IconButton(
              onPressed: () {
              getFromDBAppointment();
              showDialog(
              context: context,
              builder: (context) {
              return SimpleDialog(
              shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30),
              side: BorderSide(
              color: colorborder, width: 8),
              ),
              insetPadding: const EdgeInsets.all(
              20,
              ),
              contentPadding:
              const EdgeInsets.symmetric(
              horizontal: 30, vertical: 18),
              backgroundColor: maincolor,
              children: [
              ...List.generate(
              cubit.inputFieldNameAppoint.length,
              (index) {
              return Padding(
              padding:
              const EdgeInsets.all(12.0),
              child: inputTextAppointment(
              text: cubit
                  .inputFieldNameAppoint[
              index],
              controller: cubit.inputFieldNameAppointController[index],
              textvalidat: cubit
                  .inputFieldAlertAppoint[
              index],
              type: cubit
                  .inputFieldInputTypeAppoint[
              index]),
              );
              },
              ),
              Padding(
              padding: const EdgeInsets.symmetric(
              vertical: 30, horizontal: 24.0),
              child: Container(
              width: 120,
              height: 44,
              decoration: BoxDecoration(
              borderRadius:
              BorderRadius.circular(
              30.0),
              color: maincolor,
              border: Border.all(
              color: Colors.white,
              width: 3,
              )),
              child: MaterialButton(
              shape: RoundedRectangleBorder(
              borderRadius:
              BorderRadius.circular(
              30.0)),
              color: colorborder,
              onPressed: () {
              insertToDatabaseAppointments(cubit.inputFieldNameAppointController[0].text,cubit.inputFieldNameAppointController[1].text,cubit.inputFieldNameAppointController[2].text,);
              print(appointments.length);
              },
              child: const Text('اضافة',
              style: TextStyle(
              color: Colors.white,
              fontSize: 24)))),

              )
              ],
              );
              },
              );
              },
              icon: Icon(
              Icons.add,
              size: 25,
              color: maincolor,
              ),
              ),
              ),
              const SizedBox(
              height: 30,
              ),
              ListView.builder(
              physics: BouncingScrollPhysics(),
              shrinkWrap: true,
              itemCount:appointments.length ,
              itemBuilder: (context, index) {
              return Container(
              margin: EdgeInsets.all(8),
              width: 350,
              height: 249,
              decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(
              20.0,
              ),
              border: Border.all(
              color: colorborder,
              width: 3,
              )),
              child: Column(children: [
              Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [

              Column( crossAxisAlignment:CrossAxisAlignment.start ,children:[
              Row(
              children: [
              Text("الوقت",
              style: TextStyle(color: maincolor)),
              Text(appointments[index]["AppointmentDate"],
              style: TextStyle(color: maincolor)),
              ],
              ),
              Row(
              children: [
              Text('الرساله:  ',
              style: TextStyle(color: maincolor)),
              Text(appointments[index]["Message"],
              style: TextStyle(color: maincolor)),
              ],
              ),
              Row(
              children: [
              Text('اسم الدكتور:  ',
              style: TextStyle(color: maincolor)),
              Text(appointments[index]["DoctorName"],
              style: TextStyle(color: maincolor)),
              ],
              )
              ],) ,
              Column(children: [

              Icon(Icons.watch_later_outlined,
              size: 40, color: maincolor),
              const SizedBox(
              height: 10,
              ),
              Container(
              width: 100,
              height: 34,
              decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(
              30.0,
              ),
              border: Border.all(
              color: colorborder,
              width: 3,
              )),
              child: const Center(
              child: Text('5:00 pm'))),
              ]),
              ],
              ),

              const SizedBox(
              height: 10,
              ),

              const SizedBox(
              height: 20,
              ),
              Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
              children: [
              Container(
              width: 120,
              height: 44,
              decoration: BoxDecoration(
              borderRadius:
              BorderRadius.circular(30.0),
              color: maincolor,
              border: Border.all(
              color: colorborder,
              width: 3,
              )),
              child: MaterialButton(
              onPressed: () {
              showDialog(
              context: context,
              builder: (context) {
              return SimpleDialog(
              shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30),
              side: BorderSide(
              color: colorborder, width: 8),
              ),
              insetPadding: const EdgeInsets.all(
              20,
              ),
              contentPadding: const EdgeInsets.symmetric(
              horizontal: 30, vertical: 18),
              backgroundColor: maincolor,
              children: [
              ...List.generate(
              cubit.inputFieldNameAppointController
                  .length,
              (index) {
              return Padding(
              padding: const EdgeInsets.all(12.0),
              child: inputTextAppointment(
              text: cubit
                  .inputFieldNameAlert[index],
              controller: cubit
                  .inputFieldNameAppointController[
              index],
              textvalidat:
              cubit.inputFieldAlertAlert[
              index],
              type: cubit
                  .inputFieldInputTypeAlert[
              index]),
              );
              },
              ),
              Padding(
              padding: const EdgeInsets.symmetric(
              vertical: 30, horizontal: 24.0),
              child: Container(
              width: 120,
              height: 44,
              decoration: BoxDecoration(
              borderRadius:
              BorderRadius.circular(30.0),
              color: maincolor,
              border: Border.all(
              color: Colors.white,
              width: 3,
              )),
              child: MaterialButton(
              shape: RoundedRectangleBorder(
              borderRadius:
              BorderRadius.circular(
              30.0)),
              color: colorborder,
              onPressed: () {

              Navigator.of(context).pop();
              },
              child: const Text('اضافة',
              style: TextStyle(
              color: Colors.white,
              fontSize: 24)))),
              )
              ],
              );

              });},
              child: const Text('تعديل',
              style: TextStyle(
              color: Colors.white),),),),
              const SizedBox(
              width: 30,
              ),
              Container(
              width: 120,
              height: 44,
              decoration: BoxDecoration(
              borderRadius:
              BorderRadius.circular(30.0),
              color: Colors.white,
              border: Border.all(
              color: maincolor,
              width: 3,
              )),
              child: MaterialButton(
              onPressed: () {
              showDialog(
              context: context,
              builder: (context) {
              return AlertDialog(
              key: Key(
              appointments[index]["AppointmentID"]
                  .toString(),
              ),
              title:
              Text("are you sure"),
              actions: [
              ElevatedButton(
              onPressed: () {
              DeleteFromDBAppoint(appointments[
              index][
              "AppointmentID"]);

              Navigator.of(
              context)
                  .pop();

              },
              child:
              Text("delete")),
              ElevatedButton(
              onPressed: () {
              Navigator.of(
              context)
                  .pop();
              },
              child:
              Text("exit")),
              ],
              );
              },
              );
              },
              child: const Text('حذف',
              style: TextStyle(
              color: Colors.red)))),
              ],
              ),
              ),
              ]),
              );

              },)
              ],
              ),
              ),
              ),
              ),
              ),
              );
              })
              ,
              );
            }

            Future insertToDatabaseAppointments(String AppointmentDate, String
            Message, String DoctorName) async {
    print('---------------------');
    return await db.transaction(
    (txn) async {
    await txn.rawInsert(
    'INSERT INTO appointments (AppointmentDate,Message , DoctorName) VALUES("$AppointmentDate","$Message","$DoctorName")')
        .then(
    (value) {
    print('--------- inserted successfully ------------- $value');
    },
    )
        .catchError((error)
    {
    print('---------- fail to insert record ${error.toString()}');
    });
    return null;
    },
    );
    }

        void getFromDBAppointment()
    async {
      appointments = await db.rawQuery('SELECT * FROM appointments');

      print(appointments);
    }
    void DeleteFromDBAppoint(int id) async {
      await db.rawDelete('DELETE  FROM appointments WHERE AppointmentID="$id"')
          .then((value) => print('------delete'))
          .catchError((error) {
        print('------------${error.toString()}');
      });

      print(appointments);
    }
  }
