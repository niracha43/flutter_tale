import 'package:flutter/material.dart';
import 'package:mobile_project/models/video.dart';
import 'package:mobile_project/models/videoList.dart';
import 'package:mobile_project/tellerplaylist.dart';
import 'package:yoyo_player/yoyo_player.dart';

import 'constants.dart';
import 'home_page.dart';

class CurrentPlayerPage extends StatefulWidget {
  final VideoList videoList;

  const CurrentPlayerPage({Key key, this.videoList}) : super(key: key);
  @override
  _CurrentPlayerPageState createState() => _CurrentPlayerPageState();
}

class _CurrentPlayerPageState extends State<CurrentPlayerPage> {
  bool fullscreen = false;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: kSecondaryColor,
      appBar: fullscreen == false
          ? AppBar(
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
                "Now Playing",
                style: TextStyle(
                  fontSize: 28.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              elevation: 0.0,
            )
          : null,
      body: Container(
        decoration: BoxDecoration(
          color: kWhiteColor,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(35.0),
            topRight: Radius.circular(35.0),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.only(top: 30, left: 20, right: 20),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                (videoList != null)
                    ? YoYoPlayer(
                        aspectRatio: 16 / 9,
                        url: widget.videoList.videoUrl,
                        videoStyle: VideoStyle(),
                        videoLoadingStyle: VideoLoadingStyle(
                          loading: Center(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text("Loading video"),
                              ],
                            ),
                          ),
                        ),
                        onfullscreen: (t) {
                          setState(() {
                            fullscreen = t;
                          });
                        },
                      )
                    : SizedBox(),
                // Container(
                //   margin: EdgeInsets.symmetric(vertical: 30.0, horizontal: 20.0),
                //   height: size.height * 0.3,
                //   decoration: BoxDecoration(
                //     borderRadius: BorderRadius.circular(20.0),
                //     image: DecorationImage(
                //       image: NetworkImage(
                //           "https://github.com/niracha43/ImageURL_projectMobile_dev/blob/main/assets/HMOOB%20NOOS%20HAIS/Screen%20Shot%202564-05-06%20at%2011.03.28.png?raw=true"),
                //       fit: BoxFit.fill,
                //     ),
                //   ),
                // ),
                Padding(
                  padding: const EdgeInsets.only(top: 60, right: 20, left: 20),
                  child: Row(
                    children: [
                      Flexible(
                        child: Text(
                          widget.videoList.videoName,
                          overflow: TextOverflow.clip,
                          softWrap: true,
                          style: TextStyle(
                              color: kPrimaryColor,
                              fontSize: 25.0,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: Text(
                    widget.videoList.date.toString(),
                    style: TextStyle(
                        color: kLightColor,
                        fontSize: 14.0,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                Container(
                  margin: EdgeInsets.symmetric(vertical: 10.0),
                  padding: EdgeInsets.symmetric(horizontal: 20.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Icon(
                        Icons.skip_previous,
                        color: kPrimaryColor,
                        size: 0.12 * size.width,
                      ),
                      Icon(
                        Icons.play_circle_outline,
                        color: kPrimaryColor,
                        size: 0.18 * size.width,
                      ),
                      Icon(
                        Icons.skip_next,
                        color: kPrimaryColor,
                        size: 0.12 * size.width,
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
