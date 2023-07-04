import 'package:flutter/material.dart';

class Aboutus extends StatefulWidget {
  const Aboutus({super.key});

  @override
  State<Aboutus> createState() => _AboutusState();
}

class _AboutusState extends State<Aboutus> {
  int counter = 0;
  @override
  Widget build(BuildContext context) {
    print('build function ran');
    return Scaffold(
        backgroundColor: Colors.grey[200],
        appBar: AppBar(
          backgroundColor: Colors.blue[900],
          title: const Text('About us page'),
          centerTitle: true,
          elevation: 0,
        ),
        body: SafeArea(
            child:Row(
              children: [
                ElevatedButton (
                  onPressed: (){
                    setState(() {
                      counter += 1;
                    });
                  },
                  child: Text('$counter'),
                ),
                TextButton.icon(
                    onPressed: () {
                      Navigator.pushNamed(context, '/home');
                    },
                    icon: const Icon(Icons.home),
                    label: const Text(
                        'Home'
                    )
                ),
                TextButton.icon(
                    onPressed: () {
                      Navigator.pushNamed(context, '/');
                    },
                    icon: const Icon(Icons.downloading),
                    label: const Text(
                        'Loading'
                    )
                )
              ],
            )
        )
    );
  }
}
