import 'package:flutter/material.dart';
import '../shard/components/components.dart';
import '../shard/styles/color.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(top: 102),
          child: Container(
            alignment: Alignment.center,
            child: Column(children: [
              Padding(
                padding: const EdgeInsets.only(right: 20),
                child: Container(
                    alignment: Alignment.topRight,
                    child: Text(
                      ' مرحبا بك يا فلان',
                      style: TextStyle(
                          fontSize: 30,
                          color: colorborder,
                          fontWeight: FontWeight.bold),
                    )),
              ),
              const SizedBox(
                height: 30,
              ),
              Padding(
                padding: const EdgeInsets.only(right: 10),
                child: Container(
                    alignment: Alignment.topRight,
                    child: Text(
                      ' جدول المواعيد',
                      style: TextStyle(
                          fontSize: 30,
                          color: maincolor,
                          fontWeight: FontWeight.bold),
                    )),
              ),
              Container(
                width: 400,
                height: 490,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(
                      10.0,
                    ),
                    color: colorborder),
                child: Column(children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      width: 380,
                      height: 50,
                      decoration: const BoxDecoration(
                          borderRadius: BorderRadius.only(
                              topRight: Radius.circular(20),
                              topLeft: Radius.circular(20)),
                          color: Colors.white),
                      child: Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: Row(children: [
                          const SizedBox(
                            width: 10,
                          ),
                          Text(
                            'تسلسل',
                            style: TextStyle(
                                color: maincolor, fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(
                            width: 40,
                          ),
                          Text(
                            'التاريخ',
                            style: TextStyle(
                                color: maincolor, fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(
                            width: 50,
                          ),
                          Text(
                            'الوقت',
                            style: TextStyle(
                                color: maincolor, fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(
                            width: 50,
                          ),
                          Text(
                            'اسم الطبيب',
                            style: TextStyle(
                                color: maincolor, fontWeight: FontWeight.bold),
                          ),
                        ]),
                      ),
                    ),
                  ),
                  Container(
                    width: 390,
                    height: 420,
                    decoration: const BoxDecoration(
                        borderRadius: BorderRadius.only(
                            bottomRight: Radius.circular(20),
                            bottomLeft: Radius.circular(10)),
                        color: Colors.white),
                    child: ListView.builder(
                      shrinkWrap: true,
                      itemBuilder: (context, index) => listuser(),
                      itemCount: 19,
                    ),
                  ),
                ]),
              ),
              const SizedBox(
                height: 30,
              ),
              Padding(
                padding: const EdgeInsets.only(right: 10),
                child: Container(
                    alignment: Alignment.topRight,
                    child: Text(
                      ' التقارير',
                      style: TextStyle(
                          fontSize: 30,
                          color: maincolor,
                          fontWeight: FontWeight.bold),
                    )),
              ),
              Container(
                width: 400,
                height: 490,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(
                      10.0,
                    ),
                    color: colorborder),
                child: Column(children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      width: 390,
                      height: 50,
                      decoration: const BoxDecoration(
                          borderRadius: BorderRadius.only(
                              topRight: Radius.circular(20),
                              topLeft: Radius.circular(20)),
                          color: Colors.white),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(children: [
                          const SizedBox(
                            width: 10,
                          ),
                          Text(
                            'تسلسل',
                            style: TextStyle(
                                color: maincolor, fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(
                            width: 40,
                          ),
                          Text(
                            'التاريخ',
                            style: TextStyle(
                                color: maincolor, fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(
                            width: 50,
                          ),
                          Text(
                            'الحاله',
                            style: TextStyle(
                                color: maincolor, fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(
                            width: 50,
                          ),
                          Text(
                            'اقتراحات',
                            style: TextStyle(
                                color: maincolor, fontWeight: FontWeight.bold),
                          ),
                        ]),
                      ),
                    ),
                  ),
                  Container(
                    width: 390,
                    height: 420,
                    decoration: const BoxDecoration(
                        borderRadius: BorderRadius.only(
                            bottomRight: Radius.circular(20),
                            bottomLeft: Radius.circular(10)),
                        color: Colors.white),
                    child: ListView.separated(
                      itemBuilder: (context, index) => payment(),
                      separatorBuilder: (context, index) => const SizedBox(
                        height: 20,
                      ),
                      itemCount: 19,
                    ),
                  ),
                ]),
              ),
            ]),
          ),
        ),
      ),
    );
  }
}
