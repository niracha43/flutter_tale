import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile_project/home_page.dart';
import 'package:mobile_project/models/teller.dart';
import 'package:mobile_project/tellerplaylist.dart';
import 'bloc/teller/teller_bloc.dart';
import 'constants.dart';
import 'constants.dart';

class StorytellerPage extends StatefulWidget {
  static String routesName = "/storytellerpage";
  @override
  _StorytellerState createState() => _StorytellerState();
}

class _StorytellerState extends State<StorytellerPage> {
  TellerBloc tellerBloc;
  @override
  void initState() {
    tellerBloc = BlocProvider.of<TellerBloc>(context);
    tellerBloc..add(FetchedTellerEvent());
    super.initState();
  }

  Future handleRefresh() {
    tellerBloc..add(FetchedTellerEvent());
    return null;
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
          onPressed: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => HomePage()));
          },
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
        // actions: <Widget>[
        //   IconButton(
        //     icon: Icon(Icons.more_horiz),
        //     iconSize: 30.0,
        //     color: Colors.white,
        //     onPressed: () {},
        //   ),
        // ],
      ),
      body: Container(
          padding: EdgeInsets.only(top: 2),
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
              return RefreshIndicator(
                onRefresh: handleRefresh,
                child: ListView.builder(
                  scrollDirection: Axis.vertical,
                  itemCount: state.storyteller.length,
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) {
                    return TellerCard(
                      telleritem: state.storyteller[index],
                    );
                  },
                ),
              );
            },
          )),
    );
  }
}

Widget myDetailsContainer1({String stChannel, String stName}) {
  return Column(
    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    children: <Widget>[
      Padding(
        padding: const EdgeInsets.only(left: 8.0),
        child: Container(
            child: Text(
          stName,
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
        stChannel,
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

class TellerCard extends StatelessWidget {
  final Storyteller telleritem;

  const TellerCard({Key key, this.telleritem}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 25, left: 25, top: 20),
      child: Container(
        child: new FittedBox(
          child: Material(
              color: telleritem?.stColor ?? kPrimaryColor,
              elevation: 5.0,
              borderRadius: BorderRadius.circular(24.0),
              shadowColor: Color(0x802196F3),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Container(
                    child: Padding(
                      padding: const EdgeInsets.only(left: 16.0),
                      child: myDetailsContainer1(
                          stName: telleritem?.stName,
                          stChannel: telleritem.stChannel),
                    ),
                  ),
                  Container(
                    width: 300,
                    height: 200,
                    child: ClipRRect(
                      borderRadius: new BorderRadius.circular(24.0),
                      child: Image.network(
                        telleritem?.imageUrl,
                        fit: BoxFit.contain,
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
