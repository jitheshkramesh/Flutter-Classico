import 'dart:convert';
import 'package:classico/pages/world-time.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Loading extends StatefulWidget {
  @override
  State<Loading> createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {

  String time = 'loading';

  void getData() async {
    WorldTime instance = WorldTime(location: 'Berlin', flag: 'germany.png', url: 'Europe/Berlin',isDaytime: true);
    await instance.getTime();

    Navigator.pushReplacementNamed(context, '/home', arguments: {
       'location': instance.location,
       'flag': instance.flag,
       'time': instance.time,
      'isDaytime': instance.isDaytime
     });

    print(instance.time);
    setState(() {
      time = instance.time!;
    });

  }

  @override
  void initState() {
    super.initState();
    getData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.blue[900],
        body: Center(
            child: SpinKitFadingCube(
              color: Colors.white,
              size: 50.0,
            )
        )
    );
  }
}
