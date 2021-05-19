import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile_project/bloc/notification/notification_bloc.dart';
import 'package:mobile_project/models/notification_model.dart';

import 'constants.dart';
import 'currentplayer.dart';
import 'home_page.dart';
import 'models/video.dart';

class NotificationPage extends StatefulWidget {
  @override
  _NotificationPageState createState() => _NotificationPageState();
}

class _NotificationPageState extends State<NotificationPage> {
  NotificationBloc notificationBloc;
  @override
  void initState() {
    notificationBloc = BlocProvider.of<NotificationBloc>(context);

    notificationBloc.add(NotificateEvent());

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
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => HomePage()));
          },
        ),
        title: Text(
          "Notification",
          style: TextStyle(
            fontSize: 28.0,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        elevation: 0.0,
      ),
      body: Container(
        height: 0.9 * size.height,
        //   padding: EdgeInsets.only(top: 5),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(50.0),
            topRight: Radius.circular(50.0),
          ),
        ),
        alignment: Alignment.topCenter,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: BlocBuilder<NotificationBloc, NotificationState>(
            bloc: notificationBloc,
            builder: (context, state) {
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: ListView.builder(
                    scrollDirection: Axis.vertical,
                    itemCount: state.notification.length,
                    itemBuilder: (context, index) {
                      return _ListItemNotificate(state.notification[index]);
                    }),
              );
            },
          ),
        ),
      ),
    );
  }

// VideoList({
//         this.id,
//         this.videoName,
//         this.videoChannel,
//         this.date,
//         this.imageUrl,
//         this.videoUrl,
//     });
  Widget _ListItemNotificate(NotificationModel data) {
    return InkWell(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(
          builder: (BuildContext context) => CurrentPlayerPage(
              videoList: VideoList(
                  videoName: data.videoName,
                  date: data.date,
                  videoChannel: data.videoChannel,
                  videoUrl: data.videoUrl,
                  imageUrl: data.imageUrl)),
        ));
      },
      child: Container(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            CircleAvatar(
              backgroundImage: NetworkImage(data.imageSt),
            ),
            Expanded(
              flex: 5,
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(data.videoName,
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 18.0,
                            fontWeight: FontWeight.bold)),
                  ),
                  Text("${data.date}", style: TextStyle(color: Colors.grey)),
                ],
              ),
            ),
            Container(
              alignment: Alignment.center,
              padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
              // child: Image.network(
              //   data.imageUrl,
              //   height: 110,
              //   width: 100,
              // ),
              height: 80,
              width: 80,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: NetworkImage(data.imageUrl), fit: BoxFit.fill),
                  borderRadius: BorderRadius.circular(10.0)),
            )
          ],
        ),
      ),
    );
  }
}
