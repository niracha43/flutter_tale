import 'package:flutter/material.dart';

import 'constants.dart';
import 'home_page.dart';

class NotificationPage extends StatelessWidget {
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
          child: Card(
            elevation: 5.0,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(40.0),
            ),
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: 100,
              padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Container(
                    width: 55.0,
                    height: 55.0,
                    child: CircleAvatar(
                      backgroundImage: NetworkImage(
                          "https://i.pinimg.com/564x/b3/11/b1/b311b1dd8cfd8083cd57677d98598048.jpg"),
                    ),
                  ),
                  SizedBox(
                    width: 5.0,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text("Test Notification",
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 18.0,
                              fontWeight: FontWeight.bold)),
                      Text("description", style: TextStyle(color: Colors.grey)),
                    ],
                  ),
                  Container(
                    alignment: Alignment.center,
                    padding:
                        EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
                    child: Image.network(
                      "https://i.pinimg.com/564x/25/a6/fd/25a6fdf2e79348741107c75092c25e5f.jpg",
                      height: 110,
                      width: 100,
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
