import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import '../styles/color.dart';

Widget inputtext({
  required String text,
  double? width,
  required TextEditingController controller,
  bool ispsaaword = false,
  required String textvalidat,
  required TextInputType type,
}) =>
    Container(
      width: 282,
      height: 55,
      child: TextFormField(
        keyboardType: type,
        obscureText: ispsaaword,
        controller: controller,
        validator: (value) {
          if (value!.isEmpty) {
            return textvalidat;
          }
          return null;
        },
        decoration: InputDecoration(
            prefixIconColor: maincolor,
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(25.0),
              borderSide: BorderSide(color: colorborder, width: 3),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: colorborder),
              borderRadius: BorderRadius.circular(25.0),
            ),
            label: Text(text),
            labelStyle: TextStyle(
              fontSize: 20,
              color: maincolor,
            )),
      ),
    );
Widget inputTextAppointment({
  required String text,
  double? width,
  required TextEditingController controller,
  bool ispsaaword = false,
  required String textvalidat,
  required TextInputType type,
}) =>
    Container(
      width: 282,
      height: 55,
      child: TextFormField(

        keyboardType: type,
        obscureText: ispsaaword,
        controller: controller,
        validator: (value) {
          if (value!.isEmpty) {
            return textvalidat;
          }
          return null;
        },
        decoration: InputDecoration(
            filled: true,
            fillColor: colorborder,
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(25.0),
              borderSide: BorderSide(color: colorborder, width: 3),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: colorborder),
              borderRadius: BorderRadius.circular(25.0),
            ),
            label: Text(text),
            labelStyle: const TextStyle(
              fontSize: 20,
              color: Colors.white,
            )),
      ),
    );
Widget defultButton(
        {required Function() pagename,
        dynamic context,
        required String text}) =>
    Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30.0),
        ),
        clipBehavior: Clip.antiAliasWithSaveLayer,
        width: 219,
        height: 51,
        child: MaterialButton(
          elevation: 0.0,
          color: maincolor,
          onPressed: pagename,
          child: Text(
            text,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 20,
              fontWeight: FontWeight.w500,
            ),
          ),
        ));
Widget defultButtonAppointment(
        {required Function() pagename,
        dynamic context,
        required String text}) =>
    Container(
        decoration: BoxDecoration(
          border: Border.all(
            color: Colors.white,
          ),
          borderRadius: BorderRadius.circular(30.0),
        ),
        clipBehavior: Clip.antiAliasWithSaveLayer,
        width: 120,
        height: 51,
        child: MaterialButton(
          elevation: 0.0,
          color: colorborder,
          onPressed: pagename,
          child: Text(
            text,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 20,
              fontWeight: FontWeight.w500,
            ),
          ),
        ));
Widget listuser() {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
      const SizedBox(
        width: 30,
      ),
      Text(
        '1',
        style: TextStyle(color: colorborder, fontSize: 11),
      ),
      const SizedBox(
        width: 50,
      ),
      Text(
        '2023/5/6',
        style: TextStyle(color: colorborder, fontSize: 10),
      ),
      const SizedBox(
        width: 50,
      ),
      Text(
        '5:00 pm',
        style: TextStyle(color: colorborder, fontSize: 10),
      ),
      const SizedBox(
        width: 50,
      ),
      Text(
        'د.قاسم علي حسن',
        style: TextStyle(color: colorborder, fontSize: 10),
      ),
    ]),
  );
}

Widget payment() {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
      const SizedBox(
        width: 30,
      ),
      Text(
        '1',
        style: TextStyle(color: colorborder, fontSize: 11),
      ),
      const SizedBox(
        width: 50,
      ),
      Text(
        '2023/5/6',
        style: TextStyle(color: colorborder, fontSize: 10),
      ),
      const SizedBox(
        width: 50,
      ),
      Text(
        'صحي',
        style: TextStyle(color: colorborder, fontSize: 10),
      ),
      const SizedBox(
        width: 50,
      ),
      Text(
        'د.قاسم علي حسن',
        style: TextStyle(color: colorborder, fontSize: 10),
      ),
    ]),
  );
}
