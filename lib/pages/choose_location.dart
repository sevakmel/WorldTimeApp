import 'package:flutter/material.dart';
import 'package:world_time/services/world_time.dart';

class ChooseLocation extends StatefulWidget {

  @override
  State<ChooseLocation> createState() => _ChooseLocationState();
}

class _ChooseLocationState extends State<ChooseLocation> {
  // int counter = 0;

  List<WorldTime> locations = [
    WorldTime(location: 'London', flag: 'uk.png', url: 'Europe/London'),
    WorldTime(location: 'Yerevan', flag: 'armenia.png', url: 'Asia/Dubai'),
    WorldTime(location: 'Moscow', flag: 'usa.png', url: 'Europe/Moscow'),
    WorldTime(location: 'Madrid', flag: 'spain.png', url: 'Europe/Madrid'),
    WorldTime(location: 'Jakarta', flag: 'india.png', url: 'Asia/Jakarta'),
    WorldTime(location: 'Brazil', flag: 'brazil.png', url: 'America/Lima'),
    WorldTime(location: 'Cairo', flag: 'egypt.png', url: 'Africa/Cairo'),
    WorldTime(location: 'New York', flag: 'usa.png', url: 'America/New_York'),
  ];

  void updateTime(index) async {
    WorldTime instance = locations[index];
    await instance.getTime();
    Navigator.pop(context, {
      'location': instance.location,
      'flag': instance.flag,
      'time': instance.time,
      'isDayTime': instance.isDayTime,
    });
  }

  @override
  Widget build(BuildContext context) {
    final ButtonStyle style =
    ElevatedButton.styleFrom(textStyle: const TextStyle(fontSize: 20));
    return Scaffold(
      backgroundColor: Colors.green[200],
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

            padding: const EdgeInsets.symmetric(vertical: 1.0, horizontal: 6.0),
            child: Card(
              child: ListTile(
                onTap: () {
                  updateTime(index);
                },
                title: Text(locations[index].location),
                leading: CircleAvatar(
                  backgroundImage: AssetImage('assets/${locations[index].flag}'),
                ),
              ),
            ),
          );
        },
      )

      /*adding a counter button:
      body: ElevatedButton(
        style: style,
        onPressed: () {
          setState(() {
            counter += 1;
          });
        },
        child: Text('$counter times'),
      ),
*/
    );
  }
}
