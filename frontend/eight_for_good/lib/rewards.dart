import 'package:flutter/material.dart';

//void main() => runApp(Rewards());

class Rewards extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final title = 'Rewards';

    return Scaffold(
        appBar: AppBar(
              backgroundColor: Colors.white,
              title: Text(
                title,
                style: TextStyle(
                  color: Colors.black,
                ),
              ),
              
            ),
        body: ListView(
          children: <Widget>[
            ListTile(
              leading: Icon(Icons.map),
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
              leading: Icon(Icons.map),
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
      
    );
  }
}
