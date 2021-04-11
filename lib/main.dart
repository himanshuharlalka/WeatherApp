import 'package:flutter/material.dart';



import 'package:flutter/material.dart';

import 'package:flutter/services.dart';
import 'package:weather_app/UI/Home.dart';

import 'blocs/app.dart';
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark);
  SystemChrome. setEnabledSystemUIOverlays([]);
  applicationBloc.loadSavedUnit();
  //SystemChrome.setEnabledSystemUIOverlays(SystemUiOverlay.values);


  runApp( new MaterialApp(
        debugShowCheckedModeBanner: false,
        title:"Weather App",
        color: Colors.white,
        home:Home()),
  );
}

