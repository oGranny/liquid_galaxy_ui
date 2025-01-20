import 'package:flutter/material.dart';

class AnimatedTabbar extends StatelessWidget {
  const AnimatedTabbar({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          bottom: const TabBar(
            splashFactory: NoSplash.splashFactory,
            tabAlignment: TabAlignment.start,
            isScrollable: true,
            tabs: [
              Tab(child: Icon(Icons.star)),
              Tab(child: Text("Favourates", style: TextStyle(fontSize: 18)))
            ],
          ),
          // title: const Text('Liquid Galaxy'),
          // backgroundColor: Colors.orange,
        ),
        body: TabBarView(
          children: [
            Container(),
            Container(),
          ],
        ),
      ),
    );
  }
}
