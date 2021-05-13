import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc/teller/teller_bloc.dart';
import 'bloc/video/video_bloc.dart';
import 'constants.dart';

class TellerPlayList extends StatefulWidget {
  static String? routesName;

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
              child: BlocBuilder<TellerBloc, TellerState>(
                builder: (context, state) {
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        "Koosloos",
                        style: TextStyle(
                          fontSize: 28.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      Image.network(
                        'https://scontent.fbkk5-6.fna.fbcdn.net/v/t1.15752-9/166232112_797043411234904_6598310445283045966_n.png?_nc_cat=101&ccb=1-3&_nc_sid=ae9488&_nc_eui2=AeGrssWHvfZJ078q5pFj2ySoX7k8hxpB0M5fuTyHGkHQzrZ9FGnogNorA3xjtpjH9v78q6sh1VQnrBVYMuSTB7i9&_nc_ohc=nrjovG3K7F0AX8yxoyc&_nc_ht=scontent.fbkk5-6.fna&oh=932e64855c511908d833309a4e486207&oe=6087645B',
                        width: 300,
                        height: 300,
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
                        return ListView.builder(
                          itemCount: state.videoList.length,
                          itemBuilder: (context, index) => _buildSonglistItem(
                            image: state.videoList[index].imageUrl!,
                            title: state.videoList[index].videoName!,
                            subtitle: state.videoList[index].videoChannel!,
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

Widget _buildSonglistItem({required String image, required String title, required String subtitle}) {
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
