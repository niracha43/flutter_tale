import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile_project/bloc/teller_bloc.dart';
import 'package:mobile_project/models/teller.dart';
import 'constants.dart';
import 'constants.dart';

class StorytellerPage extends StatefulWidget {
  @override
  _StorytellerState createState() => _StorytellerState();
}

class _StorytellerState extends State<StorytellerPage> {

  TellerBloc tellerBloc;
  @override
  void initState() {
    tellerBloc = BlocProvider.of<TellerBloc>(context);
    tellerBloc..add(FetchedEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kSecondaryColor,
      appBar: AppBar(
        backgroundColor: kSecondaryColor,
        leading: IconButton(
          icon: Icon(Icons.chevron_left_rounded),
          iconSize: 30.0,
          color: Colors.white,
          onPressed: () {},
        ),
        title: Text(
          "Storyteller",
          style: TextStyle(
            fontSize: 28.0,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        elevation: 0.0,
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.more_horiz),
            iconSize: 30.0,
            color: Colors.white,
            onPressed: () {},
          ),
        ],
      ),
      body: Container(
          padding: EdgeInsets.only(top: 40),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(50.0),
              topRight: Radius.circular(50.0),
            ),
          ),
          alignment: Alignment.center,
          child: BlocBuilder<TellerBloc, TellerState>(

            builder: (context, state) {
              return ListView.builder(
                scrollDirection: Axis.vertical,
                itemCount: state.storyteller.length,
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) {
                  return TellerCard();
                },
              );
            },
          )),
    );
  }
}

Widget myDetailsContainer1() {
  return Column(
    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    children: <Widget>[
      Padding(
        padding: const EdgeInsets.only(left: 8.0),
        child: Container(
            child: Text(
          "Candy Bliss",
          style: TextStyle(
              color: Colors.white, fontSize: 24.0, fontWeight: FontWeight.bold),
        )),
      ),
      Padding(
        padding: const EdgeInsets.only(left: 8.0),
        // child: Container(
        //     child: Row(
        //       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        //       children: <Widget>[
        //         Container(child: Text("4.3",
        //           style: TextStyle(color: Colors.black54, fontSize: 18.0,),)),
        //         Container(child: Icon(
        //           Icons.star_rounded, color: Colors.white,
        //           size: 15.0,),),
        //         Container(child: Icon(
        //           Icons.star_rounded, color: Colors.white,
        //           size: 15.0,),),
        //         Container(child: Icon(
        //           Icons.star_rounded, color: Colors.white,
        //           size: 15.0,),),
        //         Container(child: Icon(
        //           Icons.star_rounded, color: Colors.white,
        //           size: 15.0,),),
        //         Container(child: Icon(
        //           Icons.star_half_rounded, color: Colors.white,
        //           size: 15.0,),),
        //         Container(child: Text("(321) \u00B7 0.9 mi",
        //           style: TextStyle(color: Colors.black54, fontSize: 18.0,),)),
        //       ],)),
      ),
      Container(
          child: Text(
        "Koosloos_Ulias Channel",
        style: TextStyle(
            color: Colors.white, fontSize: 18.0, fontWeight: FontWeight.bold),
      )),
      Container(
        child: ButtonBar(
          alignment: MainAxisAlignment.center,
          children: <Widget>[
            RaisedButton(
              onPressed: () => {},
              color: Colors.black54,
              child: Text(
                '    Show More    ',
                style: TextStyle(color: Colors.white),
              ),
              shape: new RoundedRectangleBorder(
                borderRadius: new BorderRadius.circular(30.0),
              ),
            ),
          ],
        ),
      ),
    ],
  );
}

Widget myDetailsContainer2() {
  return Column(
    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    children: <Widget>[
      Padding(
        padding: const EdgeInsets.only(left: 8.0),
        child: Container(
            child: Text(
          "Chocolate Haven",
          style: TextStyle(
              color: Colors.white, fontSize: 24.0, fontWeight: FontWeight.bold),
        )),
      ),
      Padding(
        padding: const EdgeInsets.only(left: 8.0),
        // child: Container(child: Row(children: <Widget>[
        //   Container(child: Text("4.3",
        //     style: TextStyle(color: Colors.black54, fontSize: 18.0,),)),
        //   Container(child: Icon(
        //     Icons.star_rounded, color: Colors.white, size: 15.0,),),
        //   Container(child: Icon(
        //     Icons.star_rounded, color: Colors.white, size: 15.0,),),
        //   Container(child: Icon(
        //     Icons.star_rounded, color: Colors.white, size: 15.0,),),
        //   Container(child: Icon(
        //     Icons.star_rounded, color: Colors.white, size: 15.0,),),
        //   Container(child: Icon(
        //     Icons.star_half_rounded, color: Colors.white,
        //     size: 15.0,),),
        //   Container(child: Text("(75) \u00B7 1.2 mi",
        //     style: TextStyle(color: Colors.black54, fontSize: 18.0,),)),
        // ],)),
      ),
      Container(
          child: Text(
        "PHMOOB NOOS HAIS",
        style: TextStyle(
          color: Colors.white,
          fontSize: 18.0,
        ),
      )),
      Container(
        child: ButtonBar(
          alignment: MainAxisAlignment.center,
          children: <Widget>[
            RaisedButton(
              onPressed: () => {},
              color: Colors.black54,
              child: Text(
                '    Show More    ',
                style: TextStyle(color: Colors.white),
              ),
              shape: new RoundedRectangleBorder(
                borderRadius: new BorderRadius.circular(30.0),
              ),
            ),
          ],
        ),
      ),
    ],
  );
}

Widget myDetailsContainer3() {
  return Column(
    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    children: <Widget>[
      Padding(
        padding: const EdgeInsets.only(left: 8.0),
        child: Container(
            child: Text(
          "Cake Walk",
          style: TextStyle(
              color: Colors.white, fontSize: 24.0, fontWeight: FontWeight.bold),
        )),
      ),
      Padding(
        padding: const EdgeInsets.only(left: 8.0),
        // child: Container(child: Row(children: <Widget>[
        //   Container(child: Text("4.0",
        //     style: TextStyle(color: Colors.black54, fontSize: 18.0,),)),
        //   Container(child: Icon(
        //     Icons.star_rounded, color: Colors.white, size: 15.0,),),
        //   Container(child: Icon(
        //     Icons.star_rounded, color: Colors.white, size: 15.0,),),
        //   Container(child: Icon(
        //     Icons.star_rounded, color: Colors.white, size: 15.0,),),
        //   Container(child: Icon(
        //     Icons.star_rounded, color: Colors.white, size: 15.0,),),
        //   Container(child: Icon(
        //     Icons.star_outline_rounded, color: Colors.white, size: 15.0,),),
        //   Container(child: Text("(100) \u00B7 2.0 mi",
        //     style: TextStyle(color: Colors.black54, fontSize: 18.0,),)),
        // ],)),
      ),
      Container(
          child: Text(
        "Dab hais hmoob",
        style: TextStyle(
          color: Colors.white,
          fontSize: 18.0,
        ),
      )),
      Container(
        child: ButtonBar(
          alignment: MainAxisAlignment.center,
          children: <Widget>[
            RaisedButton(
              onPressed: () => {},
              color: Colors.black54,
              child: Text(
                '    Show More    ',
                style: TextStyle(color: Colors.white),
              ),
              shape: new RoundedRectangleBorder(
                borderRadius: new BorderRadius.circular(30.0),
              ),
            ),
          ],
        ),
      ),
    ],
  );
}

Widget myDetailsContainer4() {
  return Column(
    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    children: <Widget>[
      Padding(
        padding: const EdgeInsets.only(left: 8.0),
        child: Container(
            child: Text(
          "Chocolate Bar",
          style: TextStyle(
              color: Colors.white, fontSize: 24.0, fontWeight: FontWeight.bold),
        )),
      ),
      Padding(
        padding: const EdgeInsets.only(left: 8.0),
        // child: Container(child: Row(children: <Widget>[

        //   Container(child: Icon(
        //     Icons.star_rounded, color: Colors.white, size: 15.0,),),
        //   Container(child: Icon(
        //     Icons.star_rounded, color: Colors.white, size: 15.0,),),
        //   Container(child: Icon(
        //     Icons.star_rounded, color: Colors.white, size: 15.0,),),
        //   Container(child: Icon(
        //     Icons.star_half_rounded, color: Colors.white, size: 15.0,),),
        //   Container(child: Icon(
        //     Icons.star_outline_rounded, color: Colors.white, size: 15.0,),),
        //   Container(child: Text("(50) \u00B7 2.5 mi",
        //     style: TextStyle(color: Colors.black54, fontSize: 18.0,),)),
        // ],)),
      ),
      Container(
          child: Text(
        "Hmong Bedtime Stories",
        style: TextStyle(
          color: Colors.white,
          fontSize: 18.0,
        ),
      )),
      Container(
        child: ButtonBar(
          alignment: MainAxisAlignment.center,
          children: <Widget>[
            RaisedButton(
              onPressed: () => {},
              color: Colors.black54,
              child: Text(
                '    Show More    ',
                style: TextStyle(color: Colors.white),
              ),
              shape: new RoundedRectangleBorder(
                borderRadius: new BorderRadius.circular(30.0),
              ),
            ),
          ],
        ),
      ),
    ],
  );
}

class TellerCard extends StatelessWidget {
  final Storyteller telleritem;

  const TellerCard({Key key, this.telleritem}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Container(
        child: new FittedBox(
          child: Material(
              color: yellowColor,
              elevation: 14.0,
              borderRadius: BorderRadius.circular(24.0),
              shadowColor: Color(0x802196F3),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Container(
                    child: Padding(
                      padding: const EdgeInsets.only(left: 16.0),
                      child: myDetailsContainer1(),
                    ),
                  ),
                  Container(
                    width: 300,
                    height: 200,
                    child: ClipRRect(
                      borderRadius: new BorderRadius.circular(24.0),
                      child: Image(
                        fit: BoxFit.contain,
                        alignment: Alignment.topRight,
                        image: NetworkImage(
                            "https://images.unsplash.com/photo-1495147466023-ac5c588e2e94?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=634&q=80"),
                      ),
                    ),
                  ),
                ],
              )),
        ),
      ),
    );
  }
}
