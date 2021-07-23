import 'package:flutter/material.dart';
import 'package:world_clock/world_class.dart';

class ChooseLocation extends StatefulWidget {
  const ChooseLocation({Key? key}) : super(key: key);

  @override
  _ChooseLocationState createState() => _ChooseLocationState();
}

class _ChooseLocationState extends State<ChooseLocation> {

  List<WorldClass> locations = [
    WorldClass('Kolkata','india.png','Asia/Kolkata'),
    WorldClass('Athens','greece.png','Europe/Berlin',),
    WorldClass('Cairo','egypt.png','Africa/Cairo'),
    WorldClass('Nairobi','kenya.png','Africa/Nairobi'),
    WorldClass('Chicago','usa.png','America/Chicago'),
    WorldClass('New York','usa.png','America/New_York'),
    WorldClass('Seoul','south_korea.png','Asia/Seoul'),
    WorldClass('Jakarta','indonesia.png','Asia/Jakarta'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Choose a Location'),
        centerTitle: true,
      ),
      body: ListView.builder(
        itemCount: locations.length,
        itemBuilder: (context, index) {
          return Card(
            child: ListTile(
              onTap: (){},
              title: Text(locations[index].location),
              
            ),
          );
        },
      ),


    );
  }
}
