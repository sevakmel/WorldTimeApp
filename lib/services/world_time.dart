import 'package:http/http.dart';
import 'dart:convert';
import 'package:intl/intl.dart';

class WorldTime {

  String location;
  late String time;
  String flag;
  String url;
  late bool isDayTime;

  WorldTime({required this.location, required this.flag, required this.url});

  Future<void> getTime() async {

    try {
      //make a request
      Response response = await get('http://worldtimeapi.org/api/timezone/$url');
      Map data = jsonDecode(response.body);
      // print(data);

      // get properties from data
      String datetime = data['datetime'];
      String offset = data['utc_offset'].substring(1,3);

      // print ('$datetime ------- $offset');

      //create a DateTime object
      DateTime now = DateTime.parse(datetime);
      now = now.add(Duration(hours: int.parse(offset)));

      // set the time property
      isDayTime = now.hour > 6 && now.hour < 20 ? true: false;
      time = DateFormat.jm().format(now);
    }
    catch (e) {
      print('caught errors: $e');
      time = 'could not get time';
    }
  }
}
