import 'package:flutter/material.dart';
import 'package:project/modules/register.dart';

import '../shard/components/components.dart';
import '../shard/constant.dart';
import '../shard/styles/color.dart';
import 'homescreen.dart';

class Login extends StatelessWidget {
  var username = TextEditingController();

  var password = TextEditingController();

  var formkey = GlobalKey<FormState>();

  Login({super.key});

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
                        'تسجيل الدخول',
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
                    height: 70,
                  ),
                  defultButton(
                      pagename: () {
                        if (formkey.currentState!.validate()) {
                          print(username.text);
                          print(password.text);

                          getFromDBUsers(context, username.text, password.text);

                        }
                      },
                      text: "تسجيل الدخول"),
                  const SizedBox(
                    height: 30,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 20),
                    child: Container(
                      alignment: Alignment.topRight,
                      child: Text(
                        'ليس لديك حساب ؟',
                        style: TextStyle(
                            color: colorborder,
                            fontSize: 40,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  defultButton(
                      pagename: () {
                        {
                          {  Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => Register(),),);}
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
  void getFromDBUsers (BuildContext context,String user ,String password ) async {
    List<Map<String,dynamic>> auth = await db.rawQuery(
        'SELECT * FROM users WHERE Username="$user" and Password="$password"')
        .catchError((error) => print("-error------${error.toString()}"));
    if (auth.length>=0) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => Homee(),),);
    }
    else {
      showDialog(context: context, builder: (context) {
        return SimpleDialog(
          children: [Text("كلمة السر او اسم المستخدم غير موجودة")],);
      },);
// }
      print("------------------$auth");
    }
  }
}
