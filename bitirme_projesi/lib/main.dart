import 'package:bitirme_projesi/cubit/anasayfa_cubit.dart';
import 'package:bitirme_projesi/cubit/sepet_cubit.dart';
import 'package:bitirme_projesi/cubit/yemek_detay_cubit.dart';
import 'package:bitirme_projesi/views/anasayfa_bottom.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {

  SystemChrome.setSystemUIOverlayStyle(
    SystemUiOverlayStyle(
      statusBarColor: Colors.yellowAccent,
    ),
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider(create: (context) => AnasayfaCubit()),
          BlocProvider(create: (context) => SepetCubit()),
          BlocProvider(create: (context) => YemekDetayCubit()),
        ],
        child: MaterialApp(

      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        fontFamily: 'FiraSans',
        primarySwatch: Colors.blue,


      ),
      home: AnasayfaBottom(),

    )
    );
  }
}
