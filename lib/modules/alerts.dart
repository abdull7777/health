import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project/shard/components/components.dart';
import 'package:project/shard/cubit/cubit.dart';
import 'package:project/shard/cubit/states.dart';
import 'package:sqflite/sqflite.dart';

import '../shard/constant.dart';
import '../shard/styles/color.dart';

class Alerts extends StatefulWidget {
  @override
  State<Alerts> createState() => _AlertsState();
}

class _AlertsState extends State<Alerts> {
  @override
  void initState() {
    // TODO: implement initState
    getFromDB();
  }

  @override
  Widget build(BuildContext context) {
    TextEditingController controller0 = TextEditingController();
    TextEditingController controller1 = TextEditingController();
    TextEditingController controller2 = TextEditingController();
    TextEditingController controller3 = TextEditingController();

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
                            'مواعيد الادوية',
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
                                                  print(cubit
                                                      .inputFieldNameAppointController[0]);
                                                  insertToDatabaseMedicine(
                                                    cubit
                                                        .inputFieldNameAppointController[
                                                            0]
                                                        .text,
                                                    cubit
                                                        .inputFieldNameAppointController[
                                                            1]
                                                        .text,
                                                    cubit
                                                        .inputFieldNameAppointController[
                                                            2]
                                                        .text,
                                                    cubit
                                                        .inputFieldNameAppointController[
                                                            3]
                                                        .text,
                                                  );
                                                  Navigator.of(context).pop();
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
                          scrollDirection: Axis.vertical,
                          shrinkWrap: true,
                          itemCount: medicine.length,
                          itemBuilder: (context, index) {
                            return Container(
                              key: Key(medicine[index].toString()),
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
                                  children: [
                                    Text(' الاسم : ',
                                        style: TextStyle(color: maincolor)),
                                    Text(medicine[index]['name'],
                                        style: TextStyle(color: maincolor)),
                                    const SizedBox(
                                      width: 140,
                                    ),
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
                                              borderRadius:
                                                  BorderRadius.circular(
                                                30.0,
                                              ),
                                              border: Border.all(
                                                color: colorborder,
                                                width: 3,
                                              )),
                                          child: Center(
                                              child: Text(
                                                  medicine[index]["time"]))),
                                    ]),
                                  ],
                                ),
                                Row(
                                  children: [
                                    Text(' الجرعه:  ',
                                        style: TextStyle(color: maincolor)),
                                    Text(medicine[index]["frequency"],
                                        style: TextStyle(color: maincolor)),
                                  ],
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                Row(
                                  children: [
                                    Text('التكرار:  ',
                                        style: TextStyle(color: maincolor)),
                                    Text(medicine[index]['dosage'],
                                        style: TextStyle(color: maincolor)),
                                  ],
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
                                                                    print(cubit
                                                                        .inputFieldNameAppointController[0]);
                                                                    insertToDatabaseMedicine(
                                                                      cubit
                                                                          .inputFieldNameAppointController[
                                                                      0]
                                                                          .text,
                                                                      cubit
                                                                          .inputFieldNameAppointController[
                                                                      1]
                                                                          .text,
                                                                      cubit
                                                                          .inputFieldNameAppointController[
                                                                      2]
                                                                          .text,
                                                                      cubit
                                                                          .inputFieldNameAppointController[
                                                                      3]
                                                                          .text,
                                                                    );
                                                                    Navigator.of(context).pop();
                                                                  },
                                                                  child: const Text('اضافة',
                                                                      style: TextStyle(
                                                                          color: Colors.white,
                                                                          fontSize: 24)))),
                                                        )
                                                      ],
                                                    );
                                                } ,);
                                              },
                                              child: const Text('تعديل',
                                                  style: TextStyle(
                                                      color: Colors.white)))),
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
                                                        medicine[index]["medicineid"]
                                                            .toString(),
                                                      ),
                                                      title:
                                                          Text("are you sure"),
                                                      actions: [
                                                        ElevatedButton(
                                                            onPressed: () {
                                                              DeleteFromDB(medicine[
                                                                      index][
                                                                  "medicineid"]);

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
                          },
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  Future insertToDatabaseMedicine(
      String name, String dosage, String frequency, String time) async {
    print('---------------------');
    return await db.transaction(
      (txn) async {
        await txn
            .rawInsert(
                'INSERT INTO medicine (name, dosage, frequency, time) VALUES("$name","$dosage","$frequency","$time")')
            .then(
          (value) {
            print('--------- inserted successfully $name ------------- ');
          },
        ).catchError((error) {
          print('---------- fail to insert record ${error.toString()}');
        });
        return null;
      },
    );
  }

  void getFromDB() async {
    medicine = await db.rawQuery('SELECT * FROM medicine');

    print(medicine);
  }

  void DeleteFromDB(int id) async {
    await db.rawDelete('DELETE  FROM medicine WHERE medicineid="$id"').then((value) => print('------delete')).catchError((error){print('------------${error.toString()}');});

    print(medicine);
  }
}
