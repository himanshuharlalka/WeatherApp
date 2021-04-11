import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:intl/intl.dart';

import 'package:weather_app/blocs/app.dart';
import 'package:weather_app/blocs/weather.dart';
import 'package:weather_app/model/Weather.dart';

class MainWidget extends StatefulWidget {
  @override
  _MainWidgetState createState() => _MainWidgetState();
}

class _MainWidgetState extends State<MainWidget> {
  int day = 0;
  int tem = 0;
  String cond = "";
  String wind = "";
  String humidity = "";


  @override
  void initState() {
    super.initState();

    bloc.fetchWeatherForUserLocation();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    bool temp = applicationBloc.isCelsius();
    return StreamBuilder(
      stream: bloc.weatherSubject.stream,
      builder: (context, AsyncSnapshot<Weather> snapshot) {
        if (snapshot.hasData) {
          print(snapshot.data.current.condition.icon.substring(2));
          if (day == 0) {
            tem = temp
                ? snapshot.data.current.tempC.round()
                : snapshot.data.current.tempF.round();
            cond = snapshot.data.current.condition.text;
            wind = snapshot.data.current.windKph.round().toString();
            humidity = snapshot.data.current.humidity.toString();
          } else {
            tem = temp
                ? snapshot.data.forecast.forecastday[day].day.avgtempC.round()
                : snapshot.data.forecast.forecastday[day].day.avgtempF.round();
            cond = snapshot.data.forecast.forecastday[day].day.condition.text;
            wind = snapshot.data.forecast.forecastday[day].day.maxwindKph
                .round()
                .toString();
            humidity = snapshot.data.forecast.forecastday[day].day.avghumidity
                .round()
                .toString();
          }
          print(day);

          return Container(
            padding: EdgeInsets.only(left: 16, right: 16),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.03,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [

                       InkWell(
                        onTap: () {
                          setState(() {
                            day = 0;
                          });
                        },
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Today",
                              style: (day == 0)
                                  ? TextStyle(
                                      color: Colors.yellow,
                                      fontSize: 25,
                                      fontWeight: FontWeight.bold)
                                  : TextStyle(
                                      color: Colors.white,
                                      fontSize: 25,
                                    ),
                            ),
                            Text(
                                DateFormat('d MMM').format(
                                    DateTime.fromMillisecondsSinceEpoch(snapshot
                                            .data
                                            .forecast
                                            .forecastday[0]
                                            .dateEpoch *
                                        1000)),
                                style: (day == 0)
                                    ? TextStyle(
                                        color: Colors.yellowAccent,
                                        fontSize: 15)
                                    : TextStyle(
                                        color: Colors.white, fontSize: 15))
                          ],
                        ),
                      ),
                    //   flex: 3,
                    // ),
                    //Expanded(child: Text("")),
                     InkWell(
                        onTap: () {
                          setState(() {
                            day = 1;
                            print("HIII" + day.toString());
                          });
                        },
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                                DateFormat('EEE').format(
                                    DateTime.fromMillisecondsSinceEpoch(snapshot
                                            .data
                                            .forecast
                                            .forecastday[1]
                                            .dateEpoch *
                                        1000)),
                                style: (day == 1)
                                    ? TextStyle(
                                        color: Colors.yellow,
                                        fontSize: 25,
                                        fontWeight: FontWeight.bold)
                                    : TextStyle(
                                        color: Colors.white,
                                        fontSize: 25,
                                      )),
                            Text(
                                DateFormat('d MMM').format(
                                    DateTime.fromMillisecondsSinceEpoch(snapshot
                                            .data
                                            .forecast
                                            .forecastday[1]
                                            .dateEpoch *
                                        1000)),
                                style: (day == 1)
                                    ? TextStyle(
                                        color: Colors.yellowAccent,
                                        fontSize: 15)
                                    : TextStyle(
                                        color: Colors.white, fontSize: 15))
                          ],
                        ),
                      ),
                    //   flex: 3,
                    // ),
                    //Expanded(child: Text("")),
                     InkWell(
                        onTap: () {
                          setState(() {
                            day = 2;
                          });
                        },
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                                DateFormat('EEE').format(
                                    DateTime.fromMillisecondsSinceEpoch(snapshot
                                            .data
                                            .forecast
                                            .forecastday[2]
                                            .dateEpoch *
                                        1000)),
                                style: (day == 2)
                                    ? TextStyle(
                                        color: Colors.yellow,
                                        fontSize: 25,
                                        fontWeight: FontWeight.bold)
                                    : TextStyle(
                                        color: Colors.white,
                                        fontSize: 25,
                                      )),
                            Text(
                                DateFormat('d MMM').format(
                                    DateTime.fromMillisecondsSinceEpoch(snapshot
                                            .data
                                            .forecast
                                            .forecastday[2]
                                            .dateEpoch *
                                        1000)),
                                style: (day == 2)
                                    ? TextStyle(
                                        color: Colors.yellowAccent,
                                        fontSize: 15)
                                    : TextStyle(
                                        color: Colors.white, fontSize: 15))
                          ],
                        ),
                      ),
                    //   flex: 3,
                    // ),
                  ],
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.02,
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: RichText(
                        text: TextSpan(children: [
                          TextSpan(
                              text: tem.toString(),
                              style:
                                  TextStyle(color: Colors.white, fontSize: 70)),
                          WidgetSpan(
                            child: Transform.translate(
                              offset: const Offset(2, -28),
                              child: Text(
                                temp ? '°C' : '°F',
                                //superscript is usually smaller in size
                                // textScaleFactor: 0.7,
                                style: TextStyle(
                                    color: Colors.white, fontSize: 22),
                              ),
                            ),
                          )
                        ]),
                      ),
                    ),
                    Container(
                      child: Image.network(
                        (day == 0)
                            ? "http:" + snapshot.data.current.condition.icon
                            : (day == 1)
                                ? "http:" +
                                    snapshot.data.forecast.forecastday[1].day
                                        .condition.icon
                                : "http:" +
                                    snapshot.data.forecast.forecastday[2].day
                                        .condition.icon,
                        scale: 0.7,
                      ),
                    ),
                  ],
                ),
                Text(
                  cond,
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.width * 0.02,
                ),
                Text(
                  snapshot.data.location.name +
                      ', ' +
                      snapshot.data.location.country,
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
                Container(
                    height: 200.0,
                    child: ListView.separated(
                      scrollDirection: Axis.horizontal,
                      itemCount: 24,
                      itemBuilder: (BuildContext context, int i) =>
                          hourlyForecast(
                              context,
                              i,
                              snapshot.data.forecast.forecastday[day].hour[i],
                              temp),
                      separatorBuilder: (BuildContext context, int index) {
                        return const SizedBox(
                          width: 10,
                        );
                      },
                    )),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.07,
                ),
                (day == 0)
                    ? Table(
                        defaultColumnWidth: FlexColumnWidth(0.5),
                        defaultVerticalAlignment:
                            TableCellVerticalAlignment.middle,
                        border: TableBorder.all(
                            color: Colors.white,
                            style: BorderStyle.solid,
                            width: 1),
                        children: [
                          TableRow(children: [
                            Container(
                              padding: EdgeInsets.only(left: 10, right: 10),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                // crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text('Wind',
                                            style: TextStyle(
                                                fontSize: 15.0,
                                                color: HexColor("#f7f3e9"),
                                                fontWeight: FontWeight.w600)),
                                        Text(wind + "kmph",
                                            style: TextStyle(
                                              fontSize: 20.0,
                                              color: Colors.white,
                                            ))
                                      ]),

                                  Container(
                                    child: Image.asset(
                                      "lib/images/wind.png",
                                      color: Colors.white,
                                      scale: 15,
                                    ),
                                  ),
                                  //SizedBox(width: 2,)
                                ],
                              ),
                              height: 80,
                            ),
                            Container(
                              padding: EdgeInsets.only(left: 10, right: 10),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                // crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text('Humidity',
                                            style: TextStyle(
                                                fontSize: 15.0,
                                                color: HexColor("#f7f3e9"),
                                                fontWeight: FontWeight.w600)),
                                        Text(humidity + "%",
                                            style: TextStyle(
                                                fontSize: 20.0,
                                                color: Colors.white,
                                                fontWeight: FontWeight.w600))
                                      ]),

                                  Container(
                                    child: Image.asset(
                                      "lib/images/humidity.png",
                                      color: Colors.white,
                                      scale: 15,
                                    ),
                                  ),
                                  //SizedBox(width: 2,)
                                ],
                              ),
                              height: 80,
                            ),
                          ]),
                          TableRow(children: [
                            Container(
                              padding: EdgeInsets.only(left: 10, right: 10),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                // crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text('Pressure',
                                            style: TextStyle(
                                                fontSize: 15.0,
                                                color: HexColor("#f7f3e9"),
                                                fontWeight: FontWeight.w600)),
                                        Text(
                                            snapshot.data.current.pressureMb
                                                    .round()
                                                    .toString() +
                                                "hPa",
                                            style: TextStyle(
                                              fontSize: 20.0,
                                              color: Colors.white,
                                            ))
                                      ]),

                                  Container(
                                    child: Icon(
                                      Icons.speed,
                                      color: Colors.white,
                                      size: 35,
                                    ),
                                  ),
                                  //SizedBox(width: 2,)
                                ],
                              ),
                              height: 80,
                            ),
                            Container(
                              padding: EdgeInsets.only(left: 10, right: 10),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                // crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text('Feels Like',
                                            style: TextStyle(
                                                fontSize: 15.0,
                                                color: HexColor("#f7f3e9"),
                                                fontWeight: FontWeight.w600)),
                                        Text(
                                            temp
                                                ? snapshot
                                                        .data.current.feelslikeC
                                                        .round()
                                                        .toString() +
                                                    "°C"
                                                : snapshot
                                                        .data.current.feelslikeF
                                                        .round()
                                                        .toString() +
                                                    "°F",
                                            style: TextStyle(
                                              fontSize: 20.0,
                                              color: Colors.white,
                                            ))
                                      ]),

                                  Container(
                                    child: Icon(
                                      Icons.thermostat_outlined,
                                      color: Colors.white,
                                      size: 35,
                                    ),
                                  ),
                                  //SizedBox(width: 2,)
                                ],
                              ),
                              height: 80,
                            ),
                          ])
                        ],
                      )
                    : Table(
                        defaultColumnWidth: FlexColumnWidth(0.5),
                        defaultVerticalAlignment:
                            TableCellVerticalAlignment.middle,
                        border: TableBorder.all(
                            color: Colors.white,
                            style: BorderStyle.solid,
                            width: 1),
                        children: [
                          TableRow(children: [
                            Container(
                              padding: EdgeInsets.only(left: 10, right: 10),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                // crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text('Wind',
                                            style: TextStyle(
                                                fontSize: 15.0,
                                                color: HexColor("#f7f3e9"),
                                                fontWeight: FontWeight.w600)),
                                        Text(wind + "kmph",
                                            style: TextStyle(
                                              fontSize: 20.0,
                                              color: Colors.white,
                                            ))
                                      ]),

                                  Container(
                                    child: Image.asset(
                                      "lib/images/wind.png",
                                      color: Colors.white,
                                      scale: 15,
                                    ),
                                  ),
                                  //SizedBox(width: 2,)
                                ],
                              ),
                              height: 80,
                            ),
                            Container(
                              padding: EdgeInsets.only(left: 10, right: 10),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                // crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text('Humidity',
                                            style: TextStyle(
                                                fontSize: 15.0,
                                                color: HexColor("#f7f3e9"),
                                                fontWeight: FontWeight.w600)),
                                        Text(humidity + "%",
                                            style: TextStyle(
                                                fontSize: 20.0,
                                                color: Colors.white,
                                                fontWeight: FontWeight.w600))
                                      ]),

                                  Container(
                                    child: Image.asset(
                                      "lib/images/humidity.png",
                                      color: Colors.white,
                                      scale: 15,
                                    ),
                                  ),
                                  //SizedBox(width: 2,)
                                ],
                              ),
                              height: 80,
                            ),
                          ]),
                        ],
                      ),
                //   RichText(
                //     text: TextSpan(children: [
                //       TextSpan(
                //           text: temp
                //               ? snapshot.data.current.tempC.toString()
                //               : snapshot.data.current.tempF.toString(),
                //           style: TextStyle(color: Colors.white, fontSize: 30)),
                //       WidgetSpan(
                //         child: Transform.translate(
                //           offset: const Offset(2, -4),
                //           child: Text(
                //             temp ? '°C' : '°F',
                //             //superscript is usually smaller in size
                //             textScaleFactor: 0.7,
                //             style: TextStyle(color: Colors.white),
                //           ),
                //         ),
                //       )
                //     ]),
                //   ),
                //   Text(snapshot.data.location.name)
              ],
            ),
          );
        }
        return buildProgressIndicator();
      },
    );
  }
}

Widget buildProgressIndicator() {
  return Center(
      key: Key("progress_indicator"),
      child: CircularProgressIndicator(
        valueColor: new AlwaysStoppedAnimation<Color>(Colors.white),
      ));
}

Widget hourlyForecast(BuildContext context, int i, Hour hour, bool temp) {
  return Container(
    //color: Colors.black,
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          margin: EdgeInsets.only(left: 8, bottom: 3),
          child: RichText(
            textAlign: TextAlign.center,
            text: TextSpan(children: [
              TextSpan(
                  text: temp
                      ? hour.tempC.round().toString()
                      : hour.tempF.round().toString(),
                  style: TextStyle(color: Colors.white, fontSize: 25)),
              WidgetSpan(
                child: Transform.translate(
                  offset: const Offset(0, -8),
                  child: Text(
                    temp ? '°C' : '°F',
                    //superscript is usually smaller in size
                    // textScaleFactor: 0.7,
                    style: TextStyle(color: Colors.white, fontSize: 12),
                  ),
                ),
              )
            ]),
          ),
        ),
        Text(
          "$i:00",
          style: TextStyle(color: HexColor("#f7f3e9"), fontSize: 18),
        ),
        Image.network(
          "http:" + hour.condition.icon,
          scale: 1,
        ),
      ],
    ),
  );
}
