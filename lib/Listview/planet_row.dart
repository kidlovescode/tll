import 'package:flutter/material.dart';
import 'package:tll/Listview/entryset1.dart';

class PlanetRow extends StatelessWidget {

  final Planet planet;

  PlanetRow(this.planet);

  @override
  Widget build(BuildContext context) {
    final planetThumbnail = new Container(
      margin: new EdgeInsets.symmetric(
          vertical: 16.0
      ),
      alignment: FractionalOffset.centerLeft,
      child: new Image(
        image: new AssetImage(planet.image),
        height: 92.0,
        width: 92.0,

      ),
    );

    final baseTextStyle = const TextStyle(
        fontFamily: 'Poppins'
    );
    final regularTextStyle = baseTextStyle.copyWith(
        color: const Color(0xffb6b2df),
        fontSize: 9.0,
        fontWeight: FontWeight.w400
    );
    final subHeaderTextStyle = regularTextStyle.copyWith(
        fontSize: 12.0
    );
    final headerTextStyle = baseTextStyle.copyWith(
        color: Colors.white,
        fontSize: 18.0,
        fontWeight: FontWeight.w600
    );

    Widget _planetValue({String value, String image}) {
      return new Row(
          children: <Widget>[
            new Image.asset(image, height: 12.0),
            new Container(width: 8.0),
            new Text(planet.gravity, style: regularTextStyle),
          ]
      );
    }


    final planetCardContent = new Container(
      margin: new EdgeInsets.fromLTRB(76.0, 16.0, 16.0, 16.0),
      constraints: new BoxConstraints.expand(),
      child: new Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[

          new Container(height: 4.0),
          new Text(planet.name, style: headerTextStyle),
          new Container(height: 10.0),
          new Text(planet.location, style: subHeaderTextStyle),
          new Container(
              margin: new EdgeInsets.symmetric(vertical: 8.0),
              height: 2.0,
              width: 18.0,
              color: new Color(0xff00c6ff)

          ),
          new Row(
            children: <Widget>[
            new Expanded(
                  child: _planetValue(
                      value: planet.distance,
                      image: 'assets/img/ic_distance.png')

              ),/*
              new Expanded(
                  child: _planetValue(
                      value: planet.gravity,
                      image: 'assets/img/ic_gravity.png')
              ),
*/


              new Expanded (
                child:
                new SizedBox(
                  width:80,
                  height: 35.0,

                  child: new RaisedButton(

                      onPressed: () {},
                      textColor: Colors.white,
                      padding: const EdgeInsets.all(0.0),
                      child: Container(
                        decoration: const BoxDecoration(
                          gradient: LinearGradient(
                            colors: <Color>[
                              Color(0xFF0D47A1),
                              Color(0xFF1976D2),
                              Color(0xFF42A5F5),
                            ],
                          ),
                        ),
                        padding: const EdgeInsets.all(10.0),
                        child: const Text(
                            '   ฝึกฝน   ',
                            style: TextStyle(fontSize: 15)
                        ),
                      ),

                  ),

                ),

 /*
                  child:

                new RaisedButton(

                  color: Colors.blue,

                  textColor: Colors.white,
                  disabledColor: Colors.grey,
                  disabledTextColor: Colors.black,
                  padding: EdgeInsets.all(1.0),
                  splashColor: Colors.blueAccent,

                  onPressed: () {
                    /*...*/
                    print (this.planet.id);
                  },

                  child: Text(
                    "เล่น",
                  ),
                )
                   */
              ),

            ],
          ),
        ],
      ),
    );



    final planetCard = new Container(
      child: planetCardContent,
      height: 140.0,
      margin: new EdgeInsets.only(left: 46.0),
      decoration: new BoxDecoration(
        color: new Color(0xFF333366),
        shape: BoxShape.rectangle,
        borderRadius: new BorderRadius.circular(8.0),

        boxShadow: <BoxShadow>[
          new BoxShadow(
            color: Colors.blue,
            blurRadius: 10.0,
            offset: new Offset(0.0, 10.0),

          ),
        ],

      ),
    );


    return new Container(
        height: 150.0,
        margin: const EdgeInsets.symmetric(
          vertical: 5.0,
          horizontal: 24.0,
        ),
        child: new Stack(

          children: <Widget>[
            planetCard,
            planetThumbnail,
          ],
        )
    );
/*

    new GestureDetector(
        onTap: (){
          print("Container clicked");
        },
        child: new Container(
          width: 500.0,
          padding: new EdgeInsets.fromLTRB(20.0, 40.0, 20.0, 40.0),
          color: Colors.green,
            child: new Stack(

              children: <Widget>[
                planetCard,
                planetThumbnail,
              ],
            )
        )
    );
    */




  }
}