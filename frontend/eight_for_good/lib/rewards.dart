import 'package:flutter/material.dart';

void main() => runApp(Rewards());

class Rewards extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final title = 'Rewards';

    return MaterialApp(
      title: title,
      home: Scaffold(
        appBar: AppBar(
          title: Text(title),
        ),
        body: ListView(
          children: <Widget>[
            ListTile(
              leading: Icon(Icons.emoji_nature_outlined),
              title: Text('Your blossoming story begins here'),
            ),
            ListTile(
              leading: Icon(Icons.calendar_today),
              title: Text('Complete 3 volunteer sessions [3/3]'),
            ),
            ListTile(
              leading: Icon(Icons.card_giftcard),
              title: Text('Send a present to a Blossomee Beneficiary!'),
            ),
            ListTile(
              leading: Text(""),
              title: Text('_______________'),
            ),
            ListTile(
              leading: Icon(Icons.emoji_nature_outlined),
              title: Text('Alas, the next chapter begins here!'),
            ),
            ListTile(
              leading: Icon(Icons.calendar_today),
              title: Text('Complete 3 volunteer sessions [1/3]'),
            ),
            ListTile(
              leading: Icon(Icons.card_giftcard),
              title: Text('Story time!'),
            ),
          ],
          
        ),
      ),
    );
  }
}

@override
Widget build(BuildContext context) {
  return Scaffold(
    appBar: AppBar(title: Text("Testing")),
    body: Center(
      child: RaisedButton(
        child: Text("Show dialog"),
        onPressed: () {
          showDialog(
            context: context,
            builder: (context) {
              return Dialog(
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(40)),
                elevation: 16,
                child: Container(
                  height: 400.0,
                  width: 360.0,
                  child: ListView(
                    children: <Widget>[
                      SizedBox(height: 20),
                      Center(
                        child: Text(
                          "Leaderboard",
                          style: TextStyle(fontSize: 24, color: Colors.blue, fontWeight: FontWeight.bold),
                        ),
                      ),
                      SizedBox(height: 20),
                      _buildName(imageAsset: 'assets/chocolate.jpg', name: "Name 1", score: 1000),
                      _buildName(imageAsset: 'assets/chocolate.jpg', name: "Name 2", score: 2000),
                      _buildName(imageAsset: 'assets/chocolate.jpg', name: "Name 3", score: 3000),
                      _buildName(imageAsset: 'assets/chocolate.jpg', name: "Name 4", score: 4000),
                      _buildName(imageAsset: 'assets/chocolate.jpg', name: "Name 5", score: 5000),
                      _buildName(imageAsset: 'assets/chocolate.jpg', name: "Name 6", score: 6000),
                    ],
                  ),
                ),
              );
            },
          );
        },
      ),
    ),
  );
}

Widget _buildName({String imageAsset, String name, double score}) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 20.0),
    child: Column(
      children: <Widget>[
        SizedBox(height: 12),
        Container(height: 2, color: Colors.redAccent),
        SizedBox(height: 12),
        Row(
          children: <Widget>[
            CircleAvatar(
              backgroundImage: AssetImage(imageAsset),
              radius: 30,
            ),
            SizedBox(width: 12),
            Text(name),
            Spacer(),
            Container(
              padding: EdgeInsets.symmetric(vertical: 8, horizontal: 20),
              child: Text("${score}"),
              decoration: BoxDecoration(
                color: Colors.yellow[900],
                borderRadius: BorderRadius.circular(20),
              ),
            ),
          ],
        ),
      ],
    ),
  );
}