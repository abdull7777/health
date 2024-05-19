import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../shard/cubit/cubit.dart';
import '../shard/cubit/states.dart';

class Homee extends StatelessWidget {
  const Homee({Key? key}) : super(key: key);



  @override
  Widget build(BuildContext context) {
    return BlocProvider(

      create: (BuildContext context) => NewsCubit(),
      child: BlocConsumer<NewsCubit, NewsStates>(

          listener: (context, state) {},
          builder: (context, state) {
            var cubit = NewsCubit.get(context);

            return Scaffold(
              bottomNavigationBar: CurvedNavigationBar(
                index: cubit.currentIndex,
                items: cubit.curveditems,
                onTap: (index) {
                  cubit.changeBottomNavBar(index);
                },
                color: Colors.white,
                backgroundColor: Colors.white,
                height: 50,
              ),
              body: cubit.screens[cubit.currentIndex],
            );
          }),
    );
  }
}
