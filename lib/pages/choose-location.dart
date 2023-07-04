import 'package:classico/pages/world-time.dart';
import 'package:flutter/material.dart';

class ChooseLocation extends StatefulWidget {
  @override
  _ChooseLocationState createState() => _ChooseLocationState();
}

class _ChooseLocationState extends State<ChooseLocation> {

  int counter = 0;

  List<WorldTime> locations = [
    WorldTime(url: 'Europe/London', location: 'London', flag: 'uk.jpg',isDaytime: false),
    WorldTime(url: 'Europe/Berlin', location: 'Athens', flag: 'greece.jpg',isDaytime: false),
    WorldTime(url: 'Africa/Cairo', location: 'Cairo', flag: 'egypt.jpg',isDaytime: false),
    WorldTime(url: 'Africa/Nairobi', location: 'Nairobi', flag: 'kenya.jpg',isDaytime: false),
    WorldTime(url: 'America/Chicago', location: 'Chicago', flag: 'usa.jpg',isDaytime: false),
    WorldTime(url: 'America/New_York', location: 'New York', flag: 'usa.jpg',isDaytime: false),
    WorldTime(url: 'Asia/Seoul', location: 'Seoul', flag: 'south_korea.jpg',isDaytime: false),
    WorldTime(url: 'Asia/Jakarta', location: 'Jakarta', flag: 'indonesia.jpg',isDaytime: false),
  ];

  void updateTime(index) async {
    print("location index $locations[index]");
    WorldTime instance = locations[index];
    await instance.getTime();
    Navigator.pop(context, {
      'location': instance.location,
      'time': instance.time,
      'flag': instance.flag,
      'isDaytime': instance.isDaytime,
    });
  }

  void getData() async {

    // simulate network request for a username
    String username = await Future.delayed(Duration(seconds: 3), () {
      return 'yoshi';
    });

    // simulate a network request to get the bio of that username
    String bio = await Future.delayed(Duration(seconds: 2), () {
      return 'vegan, musician & egg collector';
    });

    print('$username - $bio');

  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getData();
    print('hey there!');
  }

  @override
  Widget build(BuildContext context) {
    print('build function ran');
    return Scaffold(
        backgroundColor: Colors.grey[200],
        appBar: AppBar(
          backgroundColor: Colors.blue[900],
          title: Text('Choose a Location'),
          centerTitle: true,
          elevation: 0,
        ),
      body: ListView.builder(
          itemCount: locations.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 1.0, horizontal: 4.0),
              child: Card(
                child: ListTile(
                  onTap: () {updateTime(index);},
                  title: Text(locations[index].location),
                  leading: CircleAvatar(
                    backgroundImage: AssetImage('assets/${locations[index].flag}'),
                  ),
                ),
              ),
            );
          }
      ),
    );
  }
}