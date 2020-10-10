// import 'package:flutter/foundation.dart';
import 'dart:async';
import 'dart:convert';
import 'package:eight_for_good/notif-dialog.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Notif extends StatelessWidget {
	@override
	

// 	Widget build(BuildContext context) {
// 		return MaterialApp(home:Scaffold(body: PostScreen(),),);
// 	}
// }

// class PostScreen extends StatefulWidget {
// 	@override
// 	_PostScreenState createState() => _PostScreenState();
// }

// class _PostScreenState extends State<PostScreen> {
	
// 	List<Post> _postList = new List<Post>();
	
// 		Future<List<Post> > fetchPost() async {
// 			final response = [];
// 			await http.get('https://forchange-7d138.web.app/get-events');
			
// 			if (response.statusCode == 200) {
// 				List<dynamic> values=new List<dynamic>();
// 				values = json.decode(response.body);
// 				if(values.length>0){
// 					for(int i=0;i<values.length;i++){
// 						if(values[i]!=null){
// 							Map<String,dynamic> map=values[i];
// 							_postList .add(Post.fromJson(map));
// 						}
// 					}
// 				}
// 			return _postList;
			
// 			} else {
// 				throw Exception("Failed to load post");
// 			}
// 		}
// 	}
	
// 	mixin Post {
//   static Post fromJson(Map<String, > map) {}
		
// 	}
// @override
// Widget build(BuildContext context){
// 	return Container();
// }
	
// @override
// void initState() {
// 	fetchPost();
// }

	// var res = [{
	// 	"eventImage": "https://www.giving.sg/image/logo?img_id=8771842",
	// 	"eventID": 1,
	// 	"eventTitle": "Plastic-Less July",
	// 	"startDate": DateTime.july,
	// 	"endDate": DateTime.july,
	// 	"startTime": "9:00AM",
	// 	"endTime": "5:00PM",
	// 	"eventDesc": "Plastic-Less July is a programme that encourages reduced usage of plastic. Together with our blossom friends, we can save the mother earth! Note that volunteers must be present for all the listed days.",
	// 	"eventBroadcast": "",
	// 	"eventVolunteers": {
	// 		"volunteerID": 10,
	// 		"messages": ["You have successfully signed up for this event. Please await while our befrienders confirm your slot!", "Your slot has been confirmed. Click this notification to view details."],
	// 		"status": "IP",
	// 		"birthDate": "9:00AM 23 July 2000"
	// 	}
	// }];
	
	// Widget build(BuildContext context) {

	// FutureBuilder(
    //      builder: (BuildContext context, AsyncSnapshot res){
    //        return Container(
    //          child: ListTile(
	// 			res.data.map((item) {
	// 				return ListTile(
	// 					leading: Icon(Icons.calendar_today),
	// 					title: Text(item["eventTitle"]),
	// 					subtitle: Text(item["eventVolunteers"]["messages"]));
	// 				}).toList())
    //        );

    //      }
    //    );
	// }

	Widget build(BuildContext context) {
	return Center(
	  child: Card(
		child: Column(
		  mainAxisSize: MainAxisSize.min,
		  children: <Widget>[
			const ListTile(
				leading: Icon(Icons.calendar_today),
				title: Text('Plastic-Less July'),
				subtitle: Text('You have successfully signed up for this event. Please await while our befrienders confirm your slot!'),
				// onTap: () => _tapCallback,
			),
			const ListTile(
				leading: Icon(Icons.calendar_today),
				title: Text('Plastic-Less July'),
				subtitle: Text('Your slot has been confirmed. Click this notification to view details.'),
				// onTap: () => {
				// 	Navigator.push(
				// 		context,
				// 		MaterialPageRoute(builder: (context) => Event()),
				// 	);
				// } 
			),
			Row(
			  mainAxisAlignment: MainAxisAlignment.end,
			  children: <Widget>[
			    RaisedButton(
			      child: const Text('I ACKNOWLEDGE'),
			      onPressed: () {/* ... */},
			    ),
			    const SizedBox(width: 8),
			  ],
			),
			const ListTile(
				leading: Icon(Icons.calendar_today),
				title: Text('Plastic-Less July'),
				subtitle: Text('Get ready, this event is happening tomorrow!'),
			),
			const ListTile(
				leading: Icon(Icons.calendar_today),
				title: Text('Plastic-Less July'),
				subtitle: Text('Reminder: Plastic-Less July is happening in in 2 hours\' time! We hope to see you soon'),
			),
			Row(
			  mainAxisAlignment: MainAxisAlignment.end,
			  children: <Widget>[
			    RaisedButton(
			      child: const Text('I ACKNOWLEDGE'),
			      onPressed: () {/* ... */},
			    ),
			    const SizedBox(width: 8),
			  ],
			),
      const ListTile(
				leading: Icon(Icons.calendar_today),
				title: Text('Hey Blossomer, Happy Birthday!'),
				subtitle: Text('It\'s your special day and we just want to thank you for your hard work...'),
			),
      Row(
			  mainAxisAlignment: MainAxisAlignment.end,
			  children: <Widget>[
			    RaisedButton(
			      child: const Text('VIEW A'),
			      onPressed: () {         
              Navigator.push(
              	context,
              	MaterialPageRoute(
                  builder: (context) => NotifDialog()
                  ),
              );
              },
			    ),
			    const SizedBox(width: 8),
			  ],
			),
		  ],
      
		),
	  ),
	);
  }
}

