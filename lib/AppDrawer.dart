import 'package:flutter/material.dart';
import 'package:json_api/HomePage.dart';

class AppDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          UserAccountsDrawerHeader(
            accountName: Text('Strategic Technologies'),
            accountEmail: Text('info@stratech.co.ke'),
            decoration: BoxDecoration(
              color: Colors.deepOrange,
            ),
          ),
          ListTile(
            title: Text('Home Page'),
            leading: Icon(
              Icons.search,
              color: Colors.orange,
            ),
            onTap: () {
              //Used for closing drawer
              Navigator.of(context).pop();
              Navigator.of(context).push(
                  MaterialPageRoute(builder: (BuildContext c) => HomePage()));
            },
          ),
          ListTile(
            title: Text('Second Page'),
            leading: Icon(
              Icons.add,
              color: Colors.red,
            ),
            onTap: () {
              //Used for closing drawer
              Navigator.of(context).pop();
            },
          ),
          ListTile(
            title: Text('Third Page'),
            leading: Icon(
              Icons.title,
              color: Colors.purple,
            ),
            onTap: () {
              //Used for closing drawer
              Navigator.of(context).pop();
            },
          ),
          ListTile(
            title: Text('Fourth Page'),
            leading: Icon(
              Icons.list,
              color: Colors.green,
            ),
            onTap: () {
              //Used for closing drawer
              Navigator.of(context).pop();
            },
          ),
          Divider(
            height: 5.0,
          ),
          ListTile(
            title: Text('Close'),
            leading: Icon(
              Icons.close,
              color: Colors.red,
            ),
            onTap: () {
              Navigator.of(context).pop();
            },
          ),
        ],
      ),
    );
  }
}
