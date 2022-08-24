import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newsapp/cubit/cubit.dart';
import 'package:newsapp/cubit/states.dart';
import 'package:newsapp/moduels/search_screen.dart';
class HomeLayout extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppStates>(
        listener: (context, state) {},
        builder: (context, state) {
          AppCubit cubit = AppCubit.get(context);
          return Scaffold(
            appBar: AppBar(
              title: cubit.currentTitle[cubit.currentIndex],
              actions: [
                IconButton(
                    onPressed: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context) => SearchScreen(),));
                    },
                    icon: Icon(Icons.search_outlined)),
                SizedBox(width: 5,),
                IconButton(
                    onPressed: (){
                      cubit.changeThemMode();
                    },
                    icon: Icon(Icons.brightness_4_outlined)),
              ],
            ),
            bottomNavigationBar: BottomNavigationBar(
              type: BottomNavigationBarType.fixed,
              currentIndex: cubit.currentIndex,
              onTap: (index) {
                cubit.changeBottomNavBar(index);
              },
              items: [
                BottomNavigationBarItem(
                    icon: Icon(Icons.emoji_people),
                    label: 'Social'
                ),
                BottomNavigationBarItem(
                    icon: Icon(Icons.sports_baseball),
                    label: 'Sports'
                ),
                BottomNavigationBarItem(
                    icon: Icon(Icons.science),
                    label: 'Science'
                ),
                // BottomNavigationBarItem(
                //     icon: Icon(Icons.search_sharp),
                //     label: 'Search'
                // ),

              ],
            ),

            body: cubit.currentBody[cubit.currentIndex],
          );
        });



  }
}
