import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  Map data = {};

  @override
  Widget build(BuildContext context) {

    data = (ModalRoute.of(context)!.settings.arguments) as Map;

    String location = data['location'];
    String time = data['time'];
    String flag = data['flag'];
    String bgImg = data['isDayTime'] ? 'day.png' : 'night.png';
    Color? bgColor = data['isDayTime'] ? Colors.lightBlue : Colors.blue[900];

    return Scaffold(
      backgroundColor: bgColor,
      body: SafeArea(
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/$bgImg'),
              fit: BoxFit.cover,
            )
          ),
          child: Padding(
            padding: EdgeInsets.fromLTRB(0, 120.0, 0, 0),
            child:  Column(
              children: [
                ElevatedButton.icon(
                    onPressed: (){Navigator.pushNamed(context, '/location');},
                    icon: Icon(
                      Icons.edit_location,
                    ),
                    label: Text(
                      'Edit Location',
                    )),
                SizedBox(height: 20,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      location,
                      style: TextStyle(
                        fontSize: 35.0,
                        color: Colors.white
                        // fontFamily: FontFace('')
                      )
                    )
                  ],
                ),
                SizedBox(height: 20,),
                Text(
                  time,
                  style: TextStyle(
                    fontSize: 66,
                    color: Colors.white,
                  )
                )
              ],
            )
          ),
        ),
      )
    );
  }
}
