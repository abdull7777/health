import 'package:flutter/material.dart';
import 'package:project/modules/login.dart';

import '../shard/components/components.dart';
import '../shard/constant.dart';
import '../shard/styles/color.dart';

class Register extends StatelessWidget {
  var username = TextEditingController();

  var password = TextEditingController();
  var ege = TextEditingController();
  var health = TextEditingController();

  var formkey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(top: 102),
          child: Container(
            alignment: Alignment.center,
            child: Form(
              key: formkey,
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(right: 20),
                    child: Container(
                      alignment: Alignment.topRight,
                      child: Text(
                        'انشاء حساب ',
                        style: TextStyle(
                            color: colorborder,
                            fontSize: 40,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 44,
                  ),
                  inputtext(
                      type: TextInputType.name,
                      controller: username,
                      text: "اسم المستخدم",
                      textvalidat: "يجب ادخال اسم المستخدم"),
                  const SizedBox(
                    height: 30,
                  ),
                  inputtext(
                      type: TextInputType.visiblePassword,
                      ispsaaword: true,
                      controller: password,
                      textvalidat: "يجب ادخال كلمة السر",
                      text: "كلمة السر"),
                  const SizedBox(
                    height: 30,
                  ),


                  inputtext(
                      type: TextInputType.number,
                      controller: ege,
                      text: "العمر",
                      textvalidat: "يجب ادخال الغمر"),
                  const SizedBox(
                    height: 30,
                  ),
                  inputtext(
                      type: TextInputType.text,
                      controller: health,
                      text: "الحالة الصجيه",
                      textvalidat: "يجب ادخال الحالة الصجيه"),

                  const SizedBox(
                    height: 70,
                  ),
                  defultButton(
                      pagename: () {
                        insertToDatabaseUser(username.text, password.text, ege.text, health.text);
                        if (formkey.currentState!.validate()) {
                          print(username.text);
                          print(password.text);
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) => Login()));
                        }
                      },
                      text: "انشاء حساب"),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
  Future insertToDatabaseUser(String Username,String Password,String Age,String HealthStatus) async {
    print('---------------------');
    return await db.transaction(
          (txn) async {
        await txn.rawInsert(
            'INSERT INTO  users  (Username TEXT, Password TEXT, Age TEXT, HealthStatus TEXT )VALUES($Username,$Password,$Age,$HealthStatus)')
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

}
