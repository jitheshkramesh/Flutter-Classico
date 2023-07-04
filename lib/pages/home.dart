import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  Map data = {};

  @override
  Widget build(BuildContext context) {
    data =data.isNotEmpty ? data :  ModalRoute
        .of(context)
        ?.settings
        ?.arguments as Map;

    bool isDayTime =   data['isDaytime'] ? true:false;

    // set background image
    String bgImage = isDayTime ? 'day.jpg' : 'night.jpg';
    Color? bgColor = isDayTime ? Colors.blue : Colors.indigo[700];

    print(data);
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        backgroundColor: Colors.blue[900],
        title: const Text('Home page'),
        centerTitle: true,
        elevation: 0,
      ),
      body: SafeArea(
      child: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/$bgImage'),
              fit: BoxFit.cover,
            )
        ),
        child: Padding(
          padding: const EdgeInsets.fromLTRB(0, 120.0, 0, 0),
          child: Column(
          children: [
            TextButton.icon(
                onPressed: () async {
               dynamic result = await Navigator.pushNamed(context, '/location');
               if(result != null){
                 setState(() {
                   data = {
                     'time': result['time'],
                     'location': result['location'],
                     'isDaytime': result['isDaytime'],
                     'flag': result['flag']
                   };
                 });
               }
               },
                icon: Icon(Icons.edit_location,
                  color: Colors.grey[300],),
                label: Text(
                    'Edit Location',
                  style: TextStyle(
                    color: Colors.grey[300],
                  ),
                )
            ),
            SizedBox(height: 20.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  data['location'],
                  style: TextStyle(
                    fontSize: 28.0,
                    letterSpacing: 2.0,
                    color: Colors.white
                  ),
                ),
              ],
            ),
            SizedBox(height: 20.0),
            Text(
                data['time'],
                style: TextStyle(
                  fontSize: 66.0,
                    color: Colors.white
                )
            ),
          ],
      ),
        ),
      ),
      )
    );
  }
}
