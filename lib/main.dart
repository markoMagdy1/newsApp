
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:newsapp/cubit/cubit.dart';
import 'package:newsapp/cubit/states.dart';
import 'package:newsapp/network/cache_helper.dart';
import 'package:newsapp/network/dio_helper.dart';

import 'cubit/bloc_observer.dart';
import 'moduels/home_layout.dart';

void main()async{
  WidgetsFlutterBinding.ensureInitialized();
  BlocOverrides.runZoned(

        () async {
          DioHelper.init();
         await CacheHelper.init();
          runApp(MyApp( ));

    },

    blocObserver: SimpleBlocObserver(),

  );

}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AppCubit()..getBusinessNews(),
      child: BlocConsumer<AppCubit,AppStates>(
        listener: (context, state) {},
        builder:(context, state) {
          bool? isDark= CacheHelper.getData(key: 'isDark') ??false ;
          return  MaterialApp(
            debugShowCheckedModeBanner: false,
            home:Directionality(
                textDirection:TextDirection.rtl ,
                child: HomeLayout()) ,
            theme: ThemeData(
                appBarTheme: AppBarTheme(
                    actionsIconTheme: IconThemeData(
                        color: Colors.black
                    ),
                    color: Colors.white,
                    elevation: 0,
                    titleTextStyle: TextStyle(
                      color: Colors.black,
                      fontSize: 20,


                    ),
                    titleSpacing: 10,
                    systemOverlayStyle: SystemUiOverlayStyle(statusBarColor: Colors.white,
                        statusBarIconBrightness: Brightness.dark
                    )

                ),
                bottomNavigationBarTheme: BottomNavigationBarThemeData(
                  backgroundColor: Colors.grey[100],
                  showSelectedLabels: false,
                  selectedItemColor: Colors.black,
                ),
                scaffoldBackgroundColor:Colors.white,
                textTheme: TextTheme(
                    bodyText1: GoogleFonts.abel(
                        fontSize: 15,
                        color: Colors.black
                    ),
                    headline1: GoogleFonts.dancingScript(
                        fontSize: 12,
                        color: Colors.black
                    )
                )


            ),
            darkTheme: ThemeData(
                appBarTheme: AppBarTheme(
                    actionsIconTheme: IconThemeData(
                        color: Colors.white
                    ),
                    color: Color(0xff1d1d1d),
                    elevation: 0,
                    titleTextStyle: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                    ),
                    titleSpacing: 10,
                    systemOverlayStyle: SystemUiOverlayStyle(statusBarColor: Color(0xff1d1d1d),
                        statusBarIconBrightness: Brightness.light
                    )

                ),
                bottomNavigationBarTheme: BottomNavigationBarThemeData(
                    backgroundColor: Color(0xff121212),
                    showSelectedLabels: false,
                    selectedItemColor: Colors.white,
                    unselectedItemColor: Colors.grey
                ),
                scaffoldBackgroundColor:Color(0xff1d1d1d),
                textTheme: TextTheme(
                    bodyText1: GoogleFonts.abel(
                        fontSize: 15,
                        color: Colors.white
                    ),
                    headline1: GoogleFonts.dancingScript(
                        fontSize: 12,
                        color: Colors.white
                    )
                )


            ),
            themeMode:isDark ? ThemeMode.dark :ThemeMode.light ,
          );
        } ,

      ),
    );
  }
}



