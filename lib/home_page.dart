import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile_project/allvideo_page.dart';
import 'package:mobile_project/currentplayer.dart';
import 'package:mobile_project/models/teller.dart';
import 'package:mobile_project/notificationPage.dart';
import 'package:fluttericon/octicons_icons.dart';
import 'package:mobile_project/searchPage.dart';
import 'package:mobile_project/tellerplaylist.dart';

import 'bloc/teller/teller_bloc.dart';
import 'bloc/video/video_bloc.dart';
import 'constants.dart';
import 'storyteller_page.dart';

class HomePage extends StatefulWidget {
  final Storyteller storyteller;

  const HomePage({Key key, this.storyteller}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  VideoBloc videoBloc;
  TellerBloc tellerBloc;
  @override
  void initState() {
    videoBloc = BlocProvider.of<VideoBloc>(context);
    tellerBloc = BlocProvider.of<TellerBloc>(context);
    videoBloc.add(PopularEvent());
    tellerBloc.add(FetchedTellerEvent());

    super.initState();
  }

  int _selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Image.network(
          "https://github.com/niracha43/ImageURL_projectMobile_dev/blob/main/assets/logo_homepage.png?raw=true",
          height: 250,
          width: 250,
        ),
        automaticallyImplyLeading: false,
        elevation: 0,
        backgroundColor: Colors.transparent,
        // actions: [
        //   Padding(
        //     padding: const EdgeInsets.all(12.0),
        //     child: Icon(
        //       Icons.lock,
        //       color: kPrimaryColor,
        //       size: 30,
        //     ),
        //   )
        // ],
      ),
      body: Stack(
        children: [
          Container(
            height: size.height,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildNavigationRail(context),
                _buildPlaylistAndSongs(size, videoBloc),
              ],
            ),
          ),
          // _buildCurrentPlaying(size),
          Positioned(bottom: 0, child: _buildBottomBar()),
        ],
      ),
    );
  }

  Widget _buildNavigationRail(BuildContext cotext) {
    return NavigationRail(
      minWidth: 56.0,
      selectedIndex: _selectedIndex,
      onDestinationSelected: (int index) {
        setState(() {
          _selectedIndex = index;
          print("index ${index}");
        });
        if (index == 0) {
          videoBloc..add(PopularEvent());
        } else {
          videoBloc..add(AllEvent());
        }
      },
      groupAlignment: -0.1,
      labelType: NavigationRailLabelType.all,
      selectedLabelTextStyle:
          TextStyle(color: kPrimaryColor, fontWeight: FontWeight.bold),
      unselectedLabelTextStyle:
          TextStyle(color: kLightColor, fontWeight: FontWeight.bold),
      leading: InkWell(
        onTap: () {
          // Navigator.of(context).pushNamed(StorytellerPage.routesName);
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => StorytellerPage()));
        },
        child: Column(
          children: [
            Icon(
              Icons.playlist_play_rounded,
              color: kPrimaryColor,
            ),
            SizedBox(height: 5.0),
            RotatedBox(
              quarterTurns: -1,
              child: Text(
                'Storyteler',
                style: TextStyle(
                    color: kPrimaryColor, fontWeight: FontWeight.bold),
              ),
            )
          ],
        ),
      ),
      destinations: [
        NavigationRailDestination(
          icon: SizedBox.shrink(),
          label: RotatedBox(
            quarterTurns: -1,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text('Popular'),
            ),
          ),
        ),
        NavigationRailDestination(
          icon: SizedBox.shrink(),
          label: RotatedBox(
            quarterTurns: -1,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text('All Video'),
            ),
          ),
        )
      ],
    );
  }

  Widget _buildPlaylistAndSongs(Size size, VideoBloc videoBloc) {
    return Column(
      children: [
        Container(
          height: 0.35 * size.height,
          width: size.width * 0.8,
          // color: Colors.purple,
          child:
              BlocBuilder<TellerBloc, TellerState>(builder: (context, state) {
            return ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: state.storyteller.length,
              itemBuilder: (context, index) => InkWell(
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (BuildContext context) =>
                        TellerPlayList(storyteller: state.storyteller[index]),
                  ));
                },
                child: _buildPlaylistItem(
                    image: state.storyteller[index].imageUrl,
                    title: state.storyteller[index].stName),
              ),
            );
          }),
        ),
        Container(
          height: 0.50 * size.height,
          width: size.width * 0.8,
          child: BlocBuilder<VideoBloc, VideoState>(
            buildWhen: (previous, current) =>
                previous.situation != current.situation,
            bloc: videoBloc,
            builder: (context, state) {
              return state.status != VideoStateStatus.success
                  ? SizedBox(
                      child: CircularProgressIndicator(
                        valueColor: AlwaysStoppedAnimation<Color>(Colors.blue),
                        strokeWidth: 3.0,
                      ),
                      height: 25.0,
                      width: 25.0,
                    )
                  : ListView.builder(
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
                    );
            },
          ),
        )
      ],
    );
  }

  Widget _buildPlaylistItem({@required String title, @required String image}) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 15.0, horizontal: 10.0),
      width: 220,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20.0),
          color: Colors.orange,
          image: DecorationImage(image: NetworkImage(image), fit: BoxFit.fill)),
      child: Align(
        alignment: Alignment.bottomCenter,
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.all(12.0),
              // child: Text(
              //   title,
              //   style: TextStyle(
              //       color: Colors.white,
              //       fontWeight: FontWeight.bold,
              //       fontSize: 20),
              // ),
            ),
            Expanded(child: Container(height: 0)),
            Container(
              height: 30,
              width: 30,
              margin: EdgeInsets.all(10.0),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  color: Colors.white),
              child: Icon(
                Icons.play_circle_outline,
                color: kPrimaryColor,
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
        child: Image.network(image),
        height: 65,
        width: 60,
        decoration: BoxDecoration(
            // image:
            //     DecorationImage(image: NetworkImage(image), fit: BoxFit.fill),
            borderRadius: BorderRadius.circular(10.0)),
      ),
    );
  }

  Widget _buildCurrentPlaying(Size size) {
    return GestureDetector(
      // onTap: () {
      //   Navigator.pushNamed(context, '/allvideo');
      // },
      child: Container(
        height: 80,
        padding: EdgeInsets.symmetric(horizontal: 40.0),
        decoration: BoxDecoration(
            color: kWhiteColor,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(50.0),
                topRight: Radius.circular(50.0))),
        // child: Row(
        //   children: [
        //     CircleAvatar(
        //         radius: 25,
        //         backgroundImage: AssetImage('assets/images/1.jpeg')),
        //     SizedBox(
        //       width: 10.0,
        //     ),
        //     Column(
        //       mainAxisAlignment: MainAxisAlignment.center,
        //       crossAxisAlignment: CrossAxisAlignment.start,
        //       children: [
        //         Text(
        //           'Rewrite the stars',
        //           style: TextStyle(
        //               color: kPrimaryColor,
        //               fontWeight: FontWeight.bold,
        //               fontSize: 15),
        //         ),
        //         Text(
        //           'Zac Effron',
        //           style: TextStyle(color: kLightColor2, fontSize: 12),
        //         )
        //       ],
        //     ),
        //     Expanded(
        //       child: Container(),
        //     ),
        //     Icon(
        //       Icons.favorite_border,
        //       color: kPrimaryColor,
        //     ),
        //     SizedBox(width: 10.0),
        //     Container(
        //       height: 30,
        //       width: 30,
        //       decoration: BoxDecoration(
        //           borderRadius: BorderRadiusDirectional.circular(10.0),
        //           color: Colors.white),
        //       child: Icon(
        //         Icons.pause,
        //         color: kPrimaryColor,
        //       ),
        //     )
        //   ],
        // ),
      ),
    );
  }

  Widget _buildBottomBar() {
    return Container(
      height: 70,
      width: MediaQuery.of(context).size.width,
      color: kWhiteColor,
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(50),
              topRight: Radius.circular(50),
            ),
            color: kSecondaryColor),
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Row(
              // crossAxisAlignment: CrossAxisAlignment.start,
              // mainAxisAlignment: MainAxisAlignment.spaceBetween,
              // children: List.generate(items.length, (index) {
              //   return IconButton(
              //       icon: Icon(
              //         items[index],
              //         color: activeTab == index ? kPrimaryColor : kLightColor,
              //       ),
              //       onPressed: () {
              //         setState(() {
              //           activeTab = index;
              //         });
              //       });
              // })

              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Expanded(
                  child: FlatButton(
                      onPressed: () {
                        // Navigator.pop(context);
                      },
                      child: Icon(
                        Octicons.home,
                        color: kWhiteColor,
                      )),
                ),
                Expanded(
                  child: FlatButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => SearchPage()));
                      },
                      child: Icon(
                        Octicons.search,
                        color: kWhiteColor,
                      )),
                ),
                Expanded(
                  child: FlatButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => NotificationPage()));
                      },
                      child: Icon(
                        Icons.notifications_none,
                        color: kWhiteColor,
                      )),
                ),
                Expanded(
                  child: FlatButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Allvideo()));
                      },
                      child: Icon(
                        Icons.content_copy_rounded,
                        color: kWhiteColor,
                      )),
                ),
              ]),
        ),
      ),
    );
  }
}
