import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PageSwitcher extends StatefulWidget {
  @override
  State<PageSwitcher> createState() => _PageSwitcherState();
}

class _PageSwitcherState extends State<PageSwitcher> {
  @override
  Widget build(BuildContext context) {
    return TabBar(
      tabs: <Widget>[
        Tab(
          child: Text('data'),
          icon: Icon(Icons.cloud_outlined),
        ),
        Tab(
          child: Text('data'),
          icon: Icon(Icons.beach_access_sharp),
        ),
      ],
    );
  }
}
