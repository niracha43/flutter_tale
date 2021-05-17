import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile_project/models/allvideo_model.dart';
import 'package:mobile_project/storyteller_page.dart';

import 'bloc/teller/teller_bloc.dart';
import 'bloc/video/video_bloc.dart';
import 'constants.dart';

class TellerPlayList extends StatefulWidget {
  static String? routesName;
  final String pathlist;

  const TellerPlayList({Key? key, required this.pathlist}) : super(key: key);
  // final Allvideo allvideo;

  // const TellerPlayList({Key? key, required this.allvideo}) : super(key: key);

  @override
  _TellerPlayListState createState() => _TellerPlayListState();
}

class _TellerPlayListState extends State<TellerPlayList> {
  VideoBloc? videoBloc;
  late TellerBloc tellerBloc;
  @override
  void initState() {
    videoBloc = BlocProvider.of<VideoBloc>(context);
    videoBloc!.add(FetchedEvent());
    tellerBloc = BlocProvider.of<TellerBloc>(context);
    tellerBloc.add(FetchedTellerEvent());
    print(widget.pathlist);
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: yellowColor,
      appBar: AppBar(
        backgroundColor: yellowColor,
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
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: BlocBuilder<TellerBloc, TellerState>(
                builder: (context, state) {
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          "Bedtime",
                          style: TextStyle(
                            fontSize: 28.0,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                          maxLines: 2,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: ClipRRect(
                          borderRadius: BorderRadius.all(Radius.circular(20.0)),
                          child: Image.network(
                              'https://github.com/niracha43/ImageURL_projectMobile_dev/blob/main/assets/89763.jpg?raw=true',
                              width: 180,
                              height: 180,
                              fit: BoxFit.cover),
                        ),
                      ),
                    ],
                  );
                },
              ),
            ),
            Container(
              height: 0.6 * size.height,
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
                    height: 0.6 * size.height,
                    child: BlocBuilder<VideoBloc, VideoState>(
                      buildWhen: (previous, current) =>
                          previous.situation != current.situation,
                      bloc: videoBloc,
                      builder: (context, state) {
                        return Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: ListView.builder(
                            itemCount: state.videoList.length,
                            itemBuilder: (context, index) => _buildSonglistItem(
                              image: state.videoList[index].imageUrl!,
                              title: state.videoList[index].videoName!,
                              subtitle: state.videoList[index].videoChannel!,
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
      ),
    );
  }
}

Widget _buildSonglistItem(
    {required String image, required String title, required String subtitle}) {
  return ListTile(
    title: Text(title),
    subtitle: Text(subtitle),
    leading: Container(
      child: Image.network(image),
      height: 50,
      width: 50,
      decoration: BoxDecoration(
          //image: DecorationImage(image: NetworkImage(image), fit: BoxFit.fill),
          borderRadius: BorderRadius.circular(10.0)),
    ),
  );
}
