import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile_project/currentplayer.dart';
import 'package:mobile_project/models/teller.dart';
import 'package:mobile_project/storyteller_page.dart';

import 'bloc/teller/teller_bloc.dart';
import 'bloc/video/video_bloc.dart';
import 'constants.dart';

class TellerPlayList extends StatefulWidget {
  static String routesName;
  final Storyteller storyteller;

  const TellerPlayList({Key key, this.storyteller}) : super(key: key);

  // final Allvideo allvideo;

  // const TellerPlayList({Key? key, required this.allvideo}) : super(key: key);

  @override
  _TellerPlayListState createState() => _TellerPlayListState();
}

class _TellerPlayListState extends State<TellerPlayList> {
  VideoBloc videoBloc;
  TellerBloc tellerBloc;
  @override
  void initState() {
    videoBloc = BlocProvider.of<VideoBloc>(context);
    videoBloc.add(FetchedPlaylist(pathlist: widget.storyteller.pathPlaylist));
    // tellerBloc = BlocProvider.of<TellerBloc>(context);
    // tellerBloc.add(FetchedTellerEvent());
    print(widget.storyteller);
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: widget.storyteller.stColor ?? yellowColor,
      appBar: AppBar(
        backgroundColor: widget.storyteller.stColor ?? yellowColor,
        leading: IconButton(
          icon: Icon(Icons.chevron_left_rounded),
          iconSize: 40.0,
          color: Colors.white,
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => StorytellerPage()));
          },
        ),
        title: Text(
          "Playlist",
          style: TextStyle(
            fontSize: 28.0,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        elevation: 0.0,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Container(
            height: 0.25 * size.height - 7,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: BlocBuilder<TellerBloc, TellerState>(
                builder: (context, state) {
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Expanded(
                        flex: 6,
                        child: Text(
                          widget.storyteller.stName ?? "",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 28.0,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                          maxLines: 2,
                        ),
                      ),
                      Expanded(
                        flex: 4,
                        child: ClipRRect(
                          borderRadius: BorderRadius.all(Radius.circular(20.0)),
                          child: Image.network(widget.storyteller.imageUrl,
                              width: 150, height: 150, fit: BoxFit.cover),
                        ),
                      ),
                    ],
                  );
                },
              ),
            ),
          ),
          Container(
            height: 0.63 * size.height,
            width: double.infinity,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(50),
                topRight: Radius.circular(50),
              ),
            ),
            child: Column(
              children: [
                Container(
                  height: 0.63 * size.height,
                  child: BlocBuilder<VideoBloc, VideoState>(
                    bloc: videoBloc,
                    builder: (context, state) {
                      return Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: ListView.builder(
                          itemCount: state.videoList.length,
                          itemBuilder: (context, index) => InkWell(
                            onTap: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                builder: (BuildContext context) =>
                                    CurrentPlayerPage(
                                        videoList: state.videoList[index]),
                              ));
                            },
                            child: _buildSonglistItem(
                              image: state.videoList[index].imageUrl,
                              title: state.videoList[index].videoName,
                              date: state.videoList[index].date,
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}

Widget _buildSonglistItem(
    {@required String image, @required String title, @required DateTime date}) {
  return ListTile(
    title: Text(title ?? ''),
    subtitle: Text(date.toString() ?? ''),
    leading: Container(
      //child: image != null ? Image.network(image) : null,
      height: 50,
      width: 70,
      decoration: BoxDecoration(
          image: DecorationImage(image: NetworkImage(image), fit: BoxFit.fill),
          borderRadius: BorderRadius.circular(10.0)),
    ),
  );
}
