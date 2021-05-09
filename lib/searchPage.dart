import 'dart:async';

import 'package:flutter/material.dart';
import 'package:mobile_project/all.dart';
import 'package:mobile_project/api/search_api.dart';
import 'package:mobile_project/models/allvideo_model.dart';

import 'constants.dart';
import 'models/search_widget.dart';

class SearchPage extends StatefulWidget {
  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  List<Allvideo> allvideo = [];

  String query = '';

  @override
  void initState() {
    super.initState();

    init();
  }

  Future init() async {
    final allvideo = await SearchApi.getAllvideo(query);

    setState(() => this.allvideo = allvideo);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kSecondaryColor,
      appBar: AppBar(
        backgroundColor: kSecondaryColor,
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
            buildSearch(),
            Expanded(
              child: ListView.builder(
                itemCount: allvideo.length,
                itemBuilder: (context, index) {
                  final video = allvideo[index];

                  return buildAllVideo(video);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildSearch() => SearchWidget(
        text: query,
        hintText: 'Video or Video channel name',
        onChanged: searchVideo,
      );

  Future searchVideo(String query) async {
    final allvideo = await SearchApi.getAllvideo(query);

    if (!mounted) return;

    setState(() {
      this.query = query;
      this.allvideo = allvideo;
    });
  }

  Widget buildAllVideo(Allvideo allvideo) => ListTile(
        leading: Image.network(
          allvideo.imageUrl,
          fit: BoxFit.cover,
          width: 50,
          height: 50,
        ),
        title: Text(allvideo.videoName),
        subtitle: Text(allvideo.videoChannel),
      );
}
