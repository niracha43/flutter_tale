import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile_project/myaccount.dart';
import 'package:mobile_project/notificationPage.dart';
import 'package:mobile_project/searchPage.dart';
import 'package:fluttericon/linearicons_free_icons.dart';
import 'package:fluttericon/octicons_icons.dart';

import 'bloc/teller/teller_bloc.dart';
import 'bloc/video/video_bloc.dart';
import 'constants.dart';
import 'models/tellerList.dart';
import 'models/videoList.dart';
import 'storyteller_page.dart';

class HomePage extends StatefulWidget {
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
      backgroundColor: kWhiteColor,
      appBar: AppBar(
        title: Text(
          'Discover',
          textAlign: TextAlign.start,
          style: Theme.of(context)
              .textTheme
              .headline4
              .copyWith(fontWeight: FontWeight.bold, color: kPrimaryColor),
        ),
        elevation: 0,
        backgroundColor: Colors.transparent,
        actions: [
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Icon(
              Icons.lock,
              color: kPrimaryColor,
              size: 30,
            ),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: size.height * 0.72,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildNavigationRail(context),
                  _buildPlaylistAndSongs(size, videoBloc)
                ],
              ),
            ),
            _buildCurrentPlaying(size),
            _buildBottomBar(),
          ],
        ),
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
          videoBloc..add(RecentEvent());
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
          Navigator.of(context).pushNamed(StorytellerPage.routesName);
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
              child: Text('Recent'),
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
          child: BlocBuilder<TellerBloc, TellerState>(
            builder: (context, state) {
              return ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: state.storyteller.length,
                itemBuilder: (context, index) => _buildPlaylistItem(
                    image: state.storyteller[index].imageUrl,
                    title: state.storyteller[index].stName),
              );
            },
          ),
        ),
        Container(
          height: 0.35 * size.height,
          width: size.width * 0.8,
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
    );
  }

  Widget _buildPlaylistItem({String title, String image}) {
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
              child: Text(
                title,
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 20),
              ),
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

  Widget _buildCurrentPlaying(Size size) {
    return GestureDetector(
      // onTap: () {
      //   Navigator.pushNamed(context, '/video');
      // },
      child: Container(
        height: 70,
        padding: EdgeInsets.symmetric(horizontal: 40.0),
        decoration: BoxDecoration(
            color: kSecondaryColor,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(50.0),
                topRight: Radius.circular(50.0))),
        child: Row(
          children: [
            CircleAvatar(
                radius: 25,
                backgroundImage: AssetImage('assets/images/1.jpeg')),
            SizedBox(
              width: 10.0,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Rewrite the stars',
                  style: TextStyle(
                      color: kPrimaryColor,
                      fontWeight: FontWeight.bold,
                      fontSize: 15),
                ),
                Text(
                  'Zac Effron',
                  style: TextStyle(color: kLightColor2, fontSize: 12),
                )
              ],
            ),
            Expanded(
              child: Container(),
            ),
            Icon(
              Icons.favorite_border,
              color: kPrimaryColor,
            ),
            SizedBox(width: 10.0),
            Container(
              height: 30,
              width: 30,
              decoration: BoxDecoration(
                  borderRadius: BorderRadiusDirectional.circular(10.0),
                  color: Colors.white),
              child: Icon(
                Icons.pause,
                color: kPrimaryColor,
              ),
            )
          ],
        ),
      ),
    );
  }

  int activeTab = 0;
  Widget _buildBottomBar() {
    List items = [
      LineariconsFree.home,
      Octicons.search,
      Icons.notifications_none,
      Icons.person_outline
    ];
    List pages = [
      HomePage(),
      SearchPage(),
      NotificationPage(),
      MyaccountPage()
    ];
    return Container(
      height: 65,
      color: kSecondaryColor,
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(50),
              topRight: Radius.circular(50),
            ),
            color: kWhiteColor),
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: List.generate(items.length, (index) {
                return IconButton(
                    icon: Icon(
                      items[index],
                      color: activeTab == index ? kPrimaryColor : kLightColor,
                    ),
                    onPressed: () {
                      setState(() {
                        activeTab = index;
                      });
                    });
              })
              //  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              //   children: [
              //   FlatButton(
              //       onPressed: () {
              //         // Navigator.push(context,
              //         //     MaterialPageRoute(builder: (context) => HomePage()));
              //       },
              //       child: Icon(
              //         Icons.home,
              //         color: kLightColor,
              //       )),
              //   FlatButton(
              //       onPressed: () {
              //         Navigator.push(context,
              //             MaterialPageRoute(builder: (context) => SearchPage()));
              //       },
              //       child: Icon(
              //         Icons.search,
              //         color: kLightColor,
              //       )),
              //   FlatButton(
              //       onPressed: () {
              //         Navigator.push(
              //             context,
              //             MaterialPageRoute(
              //                 builder: (context) => NotificationPage()));
              //       },
              //       child: Icon(
              //         Icons.notifications_active,
              //         color: kLightColor,
              //       )),
              //   FlatButton(
              //       onPressed: () {
              //         Navigator.push(context,
              //             MaterialPageRoute(builder: (context) => MyaccountPage()));
              //       },
              //       child: Icon(
              //         Icons.person,
              //         color: kLightColor,
              //       )),
              // ]

              ),
        ),
      ),
    );
  }

  Widget getBody() {
    return IndexedStack(
      index: activeTab,
      children: [HomePage(), SearchPage(), NotificationPage(), MyaccountPage()],
    );
  }
}
