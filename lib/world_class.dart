import 'package:http/http.dart';
import 'dart:convert';
import 'package:intl/intl.dart';

class WorldClass{

  String location;
  String flag;
  String url;
  late String time;
  late bool isDayTime;

  WorldClass(this.location,this.flag,this.url);

  Future<void> getTime() async{
    try {
      //request data
      Response response =
          await get(Uri.parse('http://worldtimeapi.org/api/timezone/$url'));
      Map data = jsonDecode(response.body);
      // print(data['datetime']);

      //get offset
      String offset = data['utc_offset'];
      int hoursOff = int.parse(offset.substring(1, 3));
      int minutesOff = int.parse(offset.substring(4, 6));
      // print(hoursOff);
      // print(minutesOff);

      //Calculate time
      DateTime now = DateTime.parse(data['datetime']);
      now = now.add(Duration(hours: hoursOff, minutes: minutesOff));
      isDayTime = now.hour > 6 && now.hour < 20 ? true : false;
      time = DateFormat.jm().format(now);
    }
    catch (e) {
      print('caught error: $e');
      time = 'could not get time data';
    }
  }
}