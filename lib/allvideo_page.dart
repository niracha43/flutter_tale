import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile_project/tellerplaylist.dart';

import 'bloc/teller/teller_bloc.dart';
import 'bloc/video/video_bloc.dart';
import 'constants.dart';
import 'currentplayer.dart';

class Allvideo extends StatefulWidget {
  @override
  _AllvideoState createState() => _AllvideoState();
}

class _AllvideoState extends State<Allvideo> {
  VideoBloc videoBloc;

  @override
  void initState() {
    videoBloc = BlocProvider.of<VideoBloc>(context);

    videoBloc.add(AllEvent());

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: kSecondaryColor,
      appBar: AppBar(
        backgroundColor: kSecondaryColor,
        leading: IconButton(
          icon: Icon(Icons.chevron_left_rounded),
          iconSize: 40.0,
          color: Colors.white,
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text(
          "All video",
          style: TextStyle(
            fontSize: 28.0,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        elevation: 0.0,
      ),
      body: Container(
        padding: EdgeInsets.only(top: 10),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(50.0),
            topRight: Radius.circular(50.0),
          ),
        ),
        alignment: Alignment.center,
        child: Column(
          children: <Widget>[
            Container(
              height: size.height - 120,
              width: size.height,
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
                          subtitle: state.videoList[index].videoChannel,
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
    );
  }

  Widget _buildSonglistItem(
      {@required String image,
      @required String title,
      @required String subtitle}) {
    return ListTile(
      title: Text(title),
      subtitle: Text(subtitle),
      leading: Container(
        // child: Image.network(image),
        height: 70,
        width: 70,
        decoration: BoxDecoration(
            image:
                DecorationImage(image: NetworkImage(image), fit: BoxFit.fill),
            borderRadius: BorderRadius.circular(10.0)),
      ),
    );
  }
}
