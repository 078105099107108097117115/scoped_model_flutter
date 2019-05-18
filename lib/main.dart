import 'package:flutter/material.dart';
import 'package:scoped_model_flutter/homePageScopedModel.dart';
import 'package:scoped_model_flutter/model.dart';
import 'package:scoped_model/scoped_model.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.

  DonationModel _donationModel = DonationModel();

  @override
  Widget build(BuildContext context) {
    return ScopedModel<DonationModel>(
      model: _donationModel,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          primaryColor: Color(0xff088A85),
          textTheme: TextTheme(
            title: TextStyle(
              fontFamily: "Ubuntu",
              fontSize: 26.0,
              fontWeight: FontWeight.w700,
            ),
            subhead: TextStyle(
              fontFamily: "Ubuntu",
              fontSize: 23.0,
              fontWeight: FontWeight.w700,
            ),
            subtitle: TextStyle(
              color: Colors.black,
              fontFamily: "Ubuntu",
              fontSize: 21.0,
              fontWeight: FontWeight.w700,
            ),
            body1: TextStyle(
              color: Colors.blueGrey,
              fontFamily: "Open Sans",
              fontSize: 18.0,
              fontWeight: FontWeight.normal,
            ),
            body2: TextStyle(
              color: Colors.amber,
              fontFamily: "Open Sans",
              fontSize: 16.0,
              fontWeight: FontWeight.normal,
            )
          ),
          appBarTheme: AppBarTheme(
            color: Color(0xff0B610B),
            iconTheme: IconThemeData(
              color: Colors.white,
              size: 27.0,
            ),
            elevation: 6.0,
          ),
          primarySwatch: Colors.blue,
        ),
        home: HomePageScopedModel(),
      ),
    );
  }
}

