import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:weather_app/UI/Home.dart';
import 'package:weather_app/blocs/app.dart';

class Settings extends StatefulWidget {
  @override
  _SettingsState createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  bool unitFahrenheit= !applicationBloc.isCelsius();
  @override
  Widget build(BuildContext context) {
    return Scaffold(

        body: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("lib/images/bg.jpg"),
              fit: BoxFit.cover,
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              SizedBox(
                height: AppBar().preferredSize.height,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(top: 8, left: 8),
                      child: InkWell(
                        onTap:()=> Navigator.push((context), MaterialPageRoute(builder: (context) => Home(),)),
                        child: Container(
                          width: AppBar().preferredSize.height - 8,
                          height: AppBar().preferredSize.height - 8,
                          child: Icon(Icons.arrow_back_outlined,color: Colors.white,),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Center(
                        child: Padding(
                          padding: const EdgeInsets.only(top: 4),
                          child: Text(
                            '',
                            // style: TextStyle(
                            //   fontSize: 22,
                            //   color: AppTheme.darkText,
                            //   fontWeight: FontWeight.w700,
                            // ),
                          ),
                        ),
                      ),
                    ),


                  ],
                ),
              ),
              Expanded(
                child:  Container(padding: EdgeInsets.only(left: 16, right: 16),
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                  SizedBox(height: MediaQuery.of(context).size.height*0.03,),
                        Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                          Text(
                            "Temperature Unit:",
                            style: TextStyle(color: Colors.white,fontSize: 20),
                          ),
                          Row(children: [
                            Text("°C",style: TextStyle(color: Colors.white,fontSize: 15),),
                            Switch(
                                value: unitFahrenheit,
                                activeColor: Colors.yellow,
                                activeTrackColor: Colors.white,
                                inactiveTrackColor: Colors.white,
                                inactiveThumbColor: Colors.yellow,
                                onChanged: onChangedUnitState),
                            Text("°F",style: TextStyle(color: Colors.white,fontSize: 15),),
                            Padding(padding: EdgeInsets.only(right:10))
                          ])
                        ]),
                ]
                  ))

              ),
            ],
          ),));
  }
  onChangedUnitState(bool state) {
    var unit;
    if (state) {
      unit = 1;
    } else {
      unit = 0;
    }

    applicationBloc.saveUnit(unit);
    setState(() {
      unitFahrenheit = state;
    });
  }
}
