import 'package:cuanku/cubit/pemasukan_cubit.dart';
import 'package:cuanku/cubit/pengeluaran_cubit.dart';
import 'package:cuanku/screen/homeScreen.dart';
import 'package:cuanku/screen/tabBarScreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:cuanku/cubit/data_cubit.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
        return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => DataCubit(),
          
        ),
         BlocProvider(
          create: (context) => PengeluaranCubit(),
          
        ),
         BlocProvider(
          create: (context) => PemasukanCubit(),
          
        ),
      ],
        child:MaterialApp(
      debugShowCheckedModeBanner: false,
        routes: {
            '/': (context) => HomeScreen(),
            '/tabbar': (context) => TabBarScreen(),
      },
    )
    );
  }
}
