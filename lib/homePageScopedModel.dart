import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:scoped_model/scoped_model.dart';
import './model.dart';

class HomePageScopedModel extends StatefulWidget {
  @override
  _HomePageScopedModelState createState() => _HomePageScopedModelState();
}

class _HomePageScopedModelState extends State<HomePageScopedModel> {

  Widget _buildInitContent(DonationModel model){
    return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: (MediaQuery.of(context).size.height)*0.35,
        child: Column(
          children: <Widget>[
            _titleContent(),
            _priceContent(model),
            _donateButtonContent(model),
          ],
        ),
      ),
    );
  }
  Widget _titleContent(){
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(top: 10.0,left: 20.0,bottom: 10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Text(
                  "STEWARD",
                  style: Theme.of(context).textTheme.subtitle,
                ),
                SizedBox(height: 10.0,),
                Text(
                  "Doggos are awesome",
                  style: Theme.of(context).textTheme.body1,
                ),
              ],
            ),
          ),
          Padding(padding: EdgeInsets.only(top: 5.0,left: 7.0,right: 40.0),
          child: Text("Cancel",style: Theme.of(context).textTheme.body2,),)
        ],
      ),
    );
  }
  Widget _priceContent(DonationModel model){
    return Padding(
      padding: EdgeInsets.all(6.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          RawMaterialButton(
            onPressed: (){
              model.decrement();
            },
            child: Icon(FontAwesomeIcons.minus,color: Color(0xffDBA901),size: 30.0,),
            shape: CircleBorder(
            ),
            elevation: 30.0,
            fillColor: Color(0xffE6E6E6),
            padding: EdgeInsets.all(10.0),
          ),
          Padding(
            padding: EdgeInsets.all(7.0),
            child: Text(""
                "\u0024 ${model.count}",
            style: Theme.of(context).textTheme.subtitle,),
          ),
          RawMaterialButton(
            shape: CircleBorder(),
            onPressed: (){
              model.increment();
            },
            elevation: 30.0,
            fillColor: Color(0xffE6E6E6),
            padding: EdgeInsets.all(10.0),
            child: Icon(
              FontAwesomeIcons.plus,
              color: Color(0xffDBA901),
              size: 30.0,
            ),
          ),
        ],
      ),
    );
  }
  Widget _donateButtonContent(DonationModel model){
    return Padding(
      padding: EdgeInsets.all(12.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          RaisedButton(
            elevation: 15.0,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30.0),
            ),
            textColor: Colors.white,

            onPressed: (){
              model.donateClicked = true;
            },

            child: Padding(
              padding: EdgeInsets.all(3.5),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Text(
                    "Donate to the Cause Please",
                    style: Theme.of(context).textTheme.body1,
                  ),
                  Icon(FontAwesomeIcons.paw,
                  color: Colors.black,
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Icon(Icons.cancel),
        title: Text("Scoped Model Application Illustration"),
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage("images/1200px-David_-_Napoleon_crossing_the_Alps_-_Malmaison2.jpg"),)
        ),
        child: Container(
          width: MediaQuery.of(context).size .width,
          margin: EdgeInsets.all(3.0),
          alignment: Alignment.bottomCenter,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              Material(
                color: Colors.white,
                elevation: 14.0,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(40.0),
                  topRight: Radius.circular(40.0),
                ),
                shadowColor: Color(0xff151515),
                child: ScopedModelDescendant<DonationModel>(
                  builder: (context,child,model){
                    if(model.donateClicked){
                      return _buildContent(model);
                    }else{
                      return _buildInitContent(model);
                    }
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildContent(DonationModel model){
    return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: 250.0,
        child: Column(
          children: <Widget>[
            _thankYouText(model),
            _backButton(model),
          ],
        ),
      ),
    );
  }

  Widget _thankYouText(DonationModel model) {
    return Padding(
      padding: EdgeInsets.all(25.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Icon(FontAwesomeIcons.bone,
          color: Color(0xffdd6b3d),
          ),
          Text("Stewart Says: ... ",style: Theme.of(context).textTheme.body1,),
          SizedBox(height: 10.0,),
          Text("Thank you for donating \u0024 ${model.count}",style: Theme.of(context).textTheme.body2,),
        ],
      ),
    );
  }

  Widget _backButton(DonationModel model) {
    return Padding(
      padding: EdgeInsets.all(15.0),
      child: Wrap(
        children: <Widget>[
          Icon(
            FontAwesomeIcons.dog,
            color: Colors.grey,
          ),
          SizedBox(width: 10.0,),
          RaisedButton(
            onPressed: (){
              model.donateClicked = false;
            },
            elevation: 4.0,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(25.0),
            ),
            child: Wrap(children: <Widget>[
            Text("Would You like to Donate More",style: Theme.of(context).textTheme.body2,),
              Text("\u0024      Please do so here    \u0024",style: Theme.of(context).textTheme.body2,),
            ],),
          ),
          SizedBox(width: 10.0,),
          Icon(FontAwesomeIcons.dog,
          color: Colors.grey,)
        ],
      ),
    );
  }
}
