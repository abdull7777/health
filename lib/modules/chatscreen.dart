import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project/shard/components/components.dart';
import 'package:project/shard/styles/color.dart';

import '../shard/cubit/cubit.dart';
import '../shard/cubit/states.dart';

class Chatscreen extends StatefulWidget {
  const Chatscreen({Key? key}) : super(key: key);

  @override
  State<Chatscreen> createState() => _ChatscreenState();
}

class _ChatscreenState extends State<Chatscreen> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    double width = size.width;
    double height = size.height;
    TextEditingController messagecontroller = TextEditingController();

    return BlocProvider(

      create: (BuildContext context) => NewsCubit(),
      child: BlocConsumer<NewsCubit, NewsStates>(

          listener: (context, state) {

          },
          builder: (context, state) {
            var cubit = NewsCubit.get(context);

            return Scaffold(
              bottomSheet: Row(
                children: [
                  Expanded(
                    child: inputtext(
                      text: 'Type a Message',
                      controller: messagecontroller,
                      textvalidat: ' ',
                      type: TextInputType.name,
                    ),
                  ),
                  IconButton(onPressed: () {
                    setState(() {
                      print( cubit.messageList.length);

                      cubit.addMessage(messagecontroller.text);

                    });

                  }, icon: const Icon(Icons.send))
                ],
              ),
              body: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.only(top: 80),
                  child: Container(
                    width: double.infinity,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          padding: const EdgeInsets.only(right: 10),
                          child: Text(
                            'التواصل',
                            style: TextStyle(
                                color: colorborder,
                                fontSize: 40,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Center(
                          child: Container(
                            width: 120,
                            height: 120,
                            decoration: ShapeDecoration(
                              shape: RoundedRectangleBorder(
                                side: BorderSide(
                                  color: colorborder,
                                  width: 3,
                                ),
                                borderRadius: BorderRadius.circular(100),
                              ),
                            ),
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.symmetric(vertical: 8),
                          height: height * 0.435,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              border: Border.all(color: colorborder, width: 5)),
                          child:ListView.builder(
                            itemCount: cubit.messageList.length,
                            padding: const EdgeInsets.all(4),
                            shrinkWrap: true,

                            itemBuilder: (context, index) {
                              return Container(
                                alignment: Alignment.centerRight,
                                child: Padding(
                                  padding:  EdgeInsets.symmetric(
                                      vertical: height*0.01, horizontal: 4),
                                  child: Container(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 8.0, horizontal: 12),
                                    decoration: BoxDecoration(
                                      color: colorborder,
                                      borderRadius: const BorderRadius
                                          .only(
                                          topLeft: Radius.circular(5),
                                          bottomLeft: Radius.circular(5)),
                                    ),
                                    child: Text(cubit.messageList[index],
                                        style: TextStyle(
                                            fontSize: 22,
                                            color: Colors.white)),
                                  ),
                                ),
                              );
                            },
                          ),

                        ),
                      ],
                    ),
                  ),
                ),
              ),
            );
          }
            )
    );
    }
}


