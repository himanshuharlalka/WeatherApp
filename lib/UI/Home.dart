import 'package:flutter/material.dart';
import 'package:weather_app/widgets/main_widget.dart';


import 'Settings.dart';
class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Future<bool> getData() async {
    await Future<dynamic>.delayed(const Duration(milliseconds: 0));
    return true;
  }
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
            appBar(context),
            Expanded(
              child: SingleChildScrollView(
                physics: BouncingScrollPhysics(),
                child:
                       MainWidget()

              ),
            ),
          ],
        ),/* add child content here */
      ),
    );
  }
}
Widget appBar(BuildContext context) {
  return SizedBox(
    height: AppBar().preferredSize.height,
    child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(top: 8, left: 8),
          child: Container(
            width: AppBar().preferredSize.height - 8,
            height: AppBar().preferredSize.height - 8,
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
        Padding(
          padding: const EdgeInsets.only(top: 8, right: 8),
          child: Container(
            width: AppBar().preferredSize.height - 8,
            height: AppBar().preferredSize.height - 8,

            child: Material(
              color: Colors.transparent,
              child: InkWell(

                borderRadius:
                BorderRadius.circular(AppBar().preferredSize.height),
                child: Icon(

                  Icons.settings, color: Colors.white,
                ),
                onTap: () {
                  Navigator.push((context), MaterialPageRoute(builder: (context) => Settings(),));

                  })

              ),
            ),
          ),

      ],
    ),
  );
}