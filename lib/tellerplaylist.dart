import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc/video/video_bloc.dart';
import 'constants.dart';

class TellerPlayList extends StatefulWidget {
  @override
  _TellerPlayListState createState() => _TellerPlayListState();
}

class _TellerPlayListState extends State<TellerPlayList> {
  VideoBloc videoBloc;

  @override
  void initState() {
    videoBloc = BlocProvider.of<VideoBloc>(context);
    videoBloc.add(FetchedEvent());
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: yellowColor,
      appBar: AppBar(
        backgroundColor: yellowColor,
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
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            SizedBox(
              height: 50,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    "Playlist",
                    style: TextStyle(
                      fontSize: 28.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  Image.network(
                    'https://i.pinimg.com/564x/b8/03/1f/b8031f43ef1237bf96f1c53c1fb28a04.jpg',
                    width: 200,
                    height: 200,
                  ),
                ],
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
                        return ListView.builder(
                          itemCount: state.videoList.length,
                          itemBuilder: (context, index) => _buildSonglistItem(
                            image: state.videoList[index].imageUrl,
                            title: state.videoList[index].videoName,
                            subtitle: state.videoList[index].videoChannel,
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

Widget _buildSonglistItem({String image, String title, String subtitle}) {
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
