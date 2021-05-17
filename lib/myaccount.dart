import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyaccountPage extends StatefulWidget {
  @override
  _MyaccountState createState() => _MyaccountState();
}

class _MyaccountState extends State<MyaccountPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      appBar: AppBar(
        title: Text(
          "Account",
          style: TextStyle(
            fontSize: 28.0,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        elevation: 0.0,
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.more_horiz),
            iconSize: 30.0,
            color: Colors.white,
            onPressed: () {},
          ),
        ],
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
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  padding: EdgeInsets.all(10.0),
                  width: MediaQuery.of(context).size.width / 2,
                  height: MediaQuery.of(context).size.width / 2,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.white, width: 4),
                    shape: BoxShape.circle,
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.4),
                        spreadRadius: 4,
                        blurRadius: 5,
                        offset: Offset(0, 3), // changes position of shadow
                      ),
                    ],
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      image: NetworkImage(
                          "https://i.pinimg.com/564x/0b/08/06/0b08065d6eb81911d28a539a0fdbb1ae.jpg"),
                    ),
                  ),
                )
              ],
            ),
            // Padding(padding: EdgeInsets.only(bottom: 300, left: 174),
            //   child: CircleAvatar(
            //     backgroundColor: Colors.black54,
            //     child: IconButton(
            //       icon: Icon(
            //         Icons.edit,
            //         color: Colors.white,
            //       ),
            //       onPressed: (){},
            //     ),
            //   ),
            //  ),
            SizedBox(
              height: 30,
            ),
            Text(
              'Niracha_lee',
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                  fontSize: 20),
            ),
            SizedBox(
              height: 8,
            ),
            Text(
              '6231305014@lamduan.mfu.ac.th',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.black.withOpacity(0.6),
                fontSize: 16,
              ),
            ),
            SizedBox(
              height: 40,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                FlatButton(
                    onPressed: () {},
                    child: Icon(
                      Icons.play_circle_fill_rounded,
                      color: Colors.green,
                      size: 40.0,
                    )),
                FlatButton(
                    onPressed: () {},
                    child: Icon(
                      Icons.favorite,
                      color: Colors.redAccent,
                      size: 40.0,
                    )),
                FlatButton(
                    onPressed: () {},
                    child: Icon(
                      Icons.access_time,
                      color: Colors.blueAccent,
                      size: 40.0,
                    )),
              ],
            ),
            SizedBox(
              height: 15,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                Text(
                  '     All',
                ),
                Text(
                  '       Favorites',
                ),
                Text(
                  '    Recent',
                ),
              ],
            ),
            SizedBox(
              height: 40,
            ),
            Text(
              'Playlists',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.black,
                fontSize: 20,
              ),
              textAlign: TextAlign.left,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [],
            ),
          ],
        ),
      ),
    );
  }
}
