// ignore_for_file: prefer_const_constructors

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:lg_ui_task/services/lg_service.dart';
import 'package:lg_ui_task/utils/constants/flyto_offsets.dart';
import 'package:provider/provider.dart';

class TasksTab extends StatelessWidget {
  const TasksTab({super.key});

  @override
  Widget build(BuildContext context) {
    final lgService = Provider.of<LgService>(context);

    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          customListTile(
            text: 'Google voice',
            icon: Icons.mic,
            onPressed: () async {
              Navigator.of(context).pushNamed('/voice');
            },
          ),
          customListTile(
            text: 'Gemini Logo',
            icon: Icons.fitbit,
            onPressed: () async {
              Navigator.of(context).pushNamed('/gemini');
            },
          ),
          customListTile(
            text: 'Diwali Nightlight',
            icon: Icons.filter_drama_outlined,
            onPressed: () async {
              String content =
                  await rootBundle.loadString('assets/kmls/nightlight.kml');
              ByteData coastLineData =
                  await rootBundle.load('assets/kmls/Coastlines_15m.png');
              Uint8List coastLine = coastLineData.buffer.asUint8List();
              ByteData viirsData = await rootBundle.load(
                  'assets/kmls/VIIRS_SNPP_DayNightBand_At_Sensor_Radiance.png');
              Uint8List viirs = viirsData.buffer.asUint8List();
              await lgService.sendFile(
                  '/var/www/html/nightlight.kml', utf8.encode(content));
              await lgService.sendFile(
                  '/var/www/html/Coastlines_15m.png', coastLine);
              await lgService.sendFile(
                  '/var/www/html/VIIRS_SNPP_DayNightBand_At_Sensor_Radiance.png',
                  viirs);
              await lgService.execCommand(
                  'echo "http://lg1:81/nightlight.kml" > /var/www/html/kmls.txt');
              await lgService.execCommand(
                  'echo "flytoview=$nightlightOffset" > /tmp/query.txt');
            },
          ),
          customListTile(
            text: '3D KML',
            icon: Icons.threed_rotation_rounded,
            onPressed: () async {
              String content =
                  await rootBundle.loadString('assets/kmls/blue_gift.kml');
              String contentDae =
                  await rootBundle.loadString('assets/kmls/blue_gift.dae');
              String content2 =
                  await rootBundle.loadString('assets/kmls/green_gift.kml');
              String contentDae2 =
                  await rootBundle.loadString('assets/kmls/green_gift.dae');
              await lgService.sendFile(
                  '/var/www/html/blue_gift.kml', utf8.encode(content));
              await lgService.sendFile(
                  '/var/www/html/blue_gift.dae', utf8.encode(contentDae));
              await lgService.execCommand(
                  'echo "http://lg1:81/blue_gift.kml" > /var/www/html/kmls.txt');
              await lgService.sendFile(
                  '/var/www/html/green_gift.kml', utf8.encode(content2));
              await lgService.sendFile(
                  '/var/www/html/green_gift.dae', utf8.encode(contentDae2));
              await lgService.execCommand(
                  'echo "http://lg1:81/green_gift.kml" >> /var/www/html/kmls.txt');
              await lgService.execCommand(
                  'echo "flytoview=$christmasTreeOffset" > /tmp/query.txt');
            },
          ),
          customListTile(
            text: 'Progress Bar',
            icon: Icons.bar_chart_rounded,
            onPressed: () async {
              Navigator.of(context).pushNamed('/progress');
            },
          ),
          customListTile(
            text: 'Animated navbar',
            icon: Icons.animation,
            onPressed: () async {
              Navigator.of(context).pushNamed('/navbar');
            },
          ),
          customListTile(
            text: 'Animated tabbar',
            icon: Icons.tab,
            onPressed: () async {
              Navigator.of(context).pushNamed('/tabbar');
            },
          ),
          customListTile(
            text: 'Clear KML',
            icon: Icons.cancel_outlined,
            onPressed: () async {
              await lgService.execCommand('> /var/www/html/kmls.txt');

              print('Clear KML');
            },
          ),
        ],
      ),
    );
  }
}

Widget customButton({required String text, required Function onPressed}) {
  return ElevatedButton(
    onPressed: () {
      onPressed();
    },
    style: ElevatedButton.styleFrom(
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(4.0))),
    child: Text(
      text,
      style: TextStyle(fontSize: 16),
    ),
  );
}

Widget customListTile(
    {required String text,
    required IconData icon,
    required Function onPressed}) {
  return ListTile(
    leading: Icon(icon),
    title: Text(text),
    onTap: () {
      onPressed();
    },
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4.0)),
  );
}
