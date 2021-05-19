import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile_project/models/allvideo_model.dart';

import 'bloc/video/video_bloc.dart';
import 'constants.dart';
import 'currentplayer.dart';
import 'models/search_widget.dart';

class SearchPage extends StatefulWidget {
  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  TextEditingController __searchcontroller = TextEditingController();
  String query = '';
  VideoBloc videoBloc;
  @override
  void initState() {
    videoBloc = BlocProvider.of<VideoBloc>(context);

    super.initState();

    init();
  }

  Future init() async {
    // final allvideo = await SearchApi.getAllvideo(query);

    // setState(() => this.allvideo = allvideo);
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
          "Search",
          style: TextStyle(
            fontSize: 28.0,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        elevation: 0.0,
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
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(right: 20, left: 20),
              child: TextField(
                onChanged: (value) {
                  videoBloc.add(SearchEvent(searchText: value));
                },
                controller: __searchcontroller,
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.search),
                  hintText: 'Search Video name or Video channel',
                  border: const OutlineInputBorder(
                    borderRadius: const BorderRadius.all(
                      const Radius.circular(30.0),
                    ),
                  ),
                ),
              ),
            ),
            Container(
              height: size.height - 210,
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

  Widget _buildSonglistItem({
    @required String image,
    @required String title,
    @required String subtitle,
  }) {
    return ListTile(
      title: Text(title),
      subtitle: Text(subtitle),
      leading: Container(
        // child: Image.network(image),
        height: 95,
        width: 95,
        decoration: BoxDecoration(
            image:
                DecorationImage(image: NetworkImage(image), fit: BoxFit.fill),
            borderRadius: BorderRadius.circular(10.0)),
      ),
    );
  }
}
