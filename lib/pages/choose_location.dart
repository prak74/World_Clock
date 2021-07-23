import 'package:flutter/material.dart';
import 'package:world_clock/world_class.dart';

class ChooseLocation extends StatefulWidget {
  const ChooseLocation({Key? key}) : super(key: key);

  @override
  _ChooseLocationState createState() => _ChooseLocationState();
}

class _ChooseLocationState extends State<ChooseLocation> {

  List<WorldClass> locations = [
    WorldClass('London','uk.png','Europe/London'),
    WorldClass('Athens','greece.png','Europe/Berlin',),
    WorldClass('Cairo','egypt.png','Africa/Cairo'),
    WorldClass('Nairobi','kenya.png','Africa/Nairobi'),
    WorldClass('Chicago','usa.png','America/Chicago'),
    WorldClass('New York','usa.png','America/New_York'),
    WorldClass('Seoul','south_korea.png','Asia/Seoul'),
    WorldClass('Jakarta','indonesia.png','Asia/Jakarta'),
  ];

  void updateTime(int index) async{
    WorldClass instance = locations[index];
    await instance.getTime();
    // print(instance);
    //navigate to home page
      Navigator.pop(context,{
        'location' : instance.location,
        'time' : instance.time,
        'flag' : instance.flag,
        'isDayTime' : instance.isDayTime,
      });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Choose a Location'),
        centerTitle: true,
      ),
      body: Container(
        color: Colors.yellow[100],
        child: ListView.builder(
          itemCount: locations.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 1.0, horizontal: 4.0),
              child: Card(
                elevation: 5,
                child: ListTile(
                  tileColor: Colors.yellow[400],
                  onTap: (){
                    updateTime(index);
                  },
                  title: Text(locations[index].location),
                  leading: CircleAvatar(
                    backgroundImage: AssetImage(
                      'assets/${locations[index].flag}'
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),


    );
  }
}
