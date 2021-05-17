import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile_project/home_page.dart';
import 'package:mobile_project/models/allvideo_model.dart';
import 'package:mobile_project/models/teller.dart';
import 'package:mobile_project/notificationPage.dart';
import 'package:mobile_project/tellerplaylist.dart';
import 'bloc/teller/teller_bloc.dart';
import 'constants.dart';
import 'models/tellerList.dart';

class StorytellerPage extends StatefulWidget {
  static String routesName = "/storytellerpage";

  @override
  _StorytellerState createState() => _StorytellerState();
}

class _StorytellerState extends State<StorytellerPage> {
  late TellerBloc tellerBloc;

  @override
  void initState() {
    tellerBloc = BlocProvider.of<TellerBloc>(context);
    tellerBloc..add(FetchedTellerEvent());
    super.initState();
  }

  Future? handleRefresh() {
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
          iconSize: 40.0,
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
        // child: BlocBuilder<TellerBloc, TellerState>(
        //   builder: (context, state) {
        //     var refreshIndicator = RefreshIndicator(
        //       onRefresh: () async {
        //         handleRefresh;
        //       },
        //       child: ListView.builder(
        //         scrollDirection: Axis.vertical,
        //         itemCount: state.storyteller.length,
        //         shrinkWrap: true,
        //         physics: NeverScrollableScrollPhysics(),
        //         itemBuilder: (context, index) {
        //           return TellerCard(
        //             telleritem: state.storyteller[index],
        //           );
        //         },
        //       ),
        //     );
        //     return refreshIndicator;
        //   },
        // )
        child: BlocBuilder<TellerBloc, TellerState>(
          builder: (context, state) {
            print("${state.storyteller}");
            //     var refreshIndicator = RefreshIndicator(
            //       onRefresh: () async {
            //         handleRefresh;
            //       },
            return Padding(
              padding: const EdgeInsets.all(14.0),
              child: ListView.builder(
                scrollDirection: Axis.vertical,
                itemCount: tellerLists.length,
                itemBuilder: (context, index) {
                  return Hero(
                    tag: "storytelleritem",
                    child: FittedBox(
                      child: Material(
                        child: Card(
                          color:
                              state.storyteller[index].stColor ?? kPrimaryColor,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15.0),
                          ),
                          elevation: 5,
                          child: Row(
                            children: <Widget>[
                              Column(
                                children: [
                                  TellerCard(state.storyteller[index]),
                                  Container(
                                    width: 120,
                                    height: 40,
                                    child: ButtonBar(
                                      alignment: MainAxisAlignment.center,
                                      children: <Widget>[
                                        RaisedButton(
                                          onPressed: () => {
                                            Navigator.of(context)
                                                .push(MaterialPageRoute(
                                              builder: (BuildContext context) =>
                                                  TellerPlayList(
                                                      pathlist: state
                                                          .storyteller[index]
                                                          .pathPlaylist!),
                                            )),
                                          },
                                          color: Colors.white,
                                          child: Text(
                                            'Show More',
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 10),
                                          ),
                                          shape: new RoundedRectangleBorder(
                                            borderRadius:
                                                new BorderRadius.circular(30.0),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                              Container(
                                width: 90,
                                height: 100,
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(15.0),
                                  child: Image.network(
                                      state.storyteller[index].imageUrl!,
                                      fit: BoxFit.cover,
                                      height: double.infinity,
                                      width: double.infinity,
                                      alignment: Alignment.topRight),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            );
          },
        ),
      ),
    );
  }
}

Widget TellerCard(Storyteller? _storyteller) {
  return Container(
    //width: 150,
    child: Column(
      //mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 5),
          child: Text(
            _storyteller!.stName!,
            style: TextStyle(
                fontWeight: FontWeight.bold, fontSize: 10, color: Colors.white),
          ),
        ),
        SizedBox(
          height: 5,
        ),
        Text(
          _storyteller.stChannel!,
          style: TextStyle(
              fontWeight: FontWeight.normal,
              fontSize: 9.5,
              color: Colors.white),
        ),
      ],
    ),
  );
}
