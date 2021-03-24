import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile_project/bloc/teller_bloc.dart';

import 'constants.dart';
import 'models/tellerList.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TellerBloc tellerBloc;
@override
  void initState() {
   tellerBloc=BlocProvider.of<TellerBloc>(context);
   tellerBloc.add(PopularEvent());
   
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
                  _buildPlaylistAndSongs(size, tellerBloc)
                ],
              ),
            ),
           // _buildCurrentPlaying(size),
           // _buildBottomBar(size)
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
          tellerBloc..add(PopularEvent());
        } else {
          tellerBloc..add(RecentEvent());
        }
      },
      groupAlignment: -0.1,
      labelType: NavigationRailLabelType.all,
      selectedLabelTextStyle:
          TextStyle(color: kPrimaryColor, fontWeight: FontWeight.bold),
      unselectedLabelTextStyle:
          TextStyle(color: kLightColor, fontWeight: FontWeight.bold),
      leading: Column(
        children: [
          Icon(
            Icons.playlist_play,
            color: kPrimaryColor,
          ),
          SizedBox(height: 5.0),
          RotatedBox(
            quarterTurns: -1,
            child: Text(
              'Storyteler',
              style:
                  TextStyle(color: kPrimaryColor, fontWeight: FontWeight.bold),
            ),
          )
        ],
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
}

Widget _buildPlaylistAndSongs(Size size, TellerBloc tellerBloc) {
  return Column(
    children: [
      Container(
        height: 0.35 * size.height,
        width: size.width * 0.8,
        // color: Colors.purple,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: popularLists.length,
          itemBuilder: (context, index) => _buildPlaylistItem(
              image: tellerLists[index].imageUrl,
              title: tellerLists[index].stName),
        ),
      ),
      Container(
        height: 0.35 * size.height,
        width: size.width * 0.8,
        child: BlocBuilder<TellerBloc, TellerState>(
         buildWhen: (previous, current) => previous.situation != current.situation,
         bloc: tellerBloc,
          builder: (context, state) {
            return ListView.builder(
              itemCount: state.storyteller.length,
              itemBuilder: (context, index) => _buildSonglistItem(
                image: state.storyteller[index].imageUrl,
                title: state.storyteller[index].stName,
                subtitle: state.storyteller[index].stChannel,
        
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
                borderRadius: BorderRadius.circular(10.0), color: Colors.white),
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
      height: size.height * 0.103,
      padding: EdgeInsets.symmetric(horizontal: 40.0),
      decoration: BoxDecoration(
          color: kSecondaryColor,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(50.0), topRight: Radius.circular(50.0))),
      child: Row(
        children: [
          CircleAvatar(
              radius: 25,
              backgroundImage: AssetImage('assets/images/colors.jpg')),
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

Widget _buildBottomBar(Size size) {
  return Container(
    height: size.height * 0.65,
    color: kSecondaryColor,
    child: Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(50),
            topRight: Radius.circular(50),
          ),
          color: kWhiteColor),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          FlatButton(
              onPressed: () {},
              child: Icon(
                Icons.home,
                color: kLightColor,
              )),
          FlatButton(
              onPressed: () {},
              child: Icon(
                Icons.search,
                color: kLightColor,
              )),
          FlatButton(
              onPressed: () {},
              child: Icon(
                Icons.notifications_active,
                color: kLightColor,
              )),
          FlatButton(
              onPressed: () {},
              child: Icon(
                Icons.person,
                color: kLightColor,
              )),
        ],
      ),
    ),
  );
}
