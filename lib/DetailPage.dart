import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:json_api/AppDrawer.dart';

import 'Model/Data.dart';

class DetailPage extends StatefulWidget {
  Data data;
  DetailPage(this.data);
  @override
  _DetailPageState createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Photo Detail Page'),
        backgroundColor: Colors.green,
      ),
      drawer: AppDrawer(),
      body: ListView(
        children: [
          Container(
              margin: EdgeInsets.all(10.0),
              child: Column(
                children: [
                  Image.network(
                    widget.data.url,
                    height: 250.0,
                    width: MediaQuery.of(context).size.width,
                    fit: BoxFit.cover,
                  ),
                  SizedBox(
                    height: 100.0,
                  ),
                  Container(
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          flex: 1,
                          child: CircleAvatar(
                            child: Text(widget.data.id.toString()),
                          ),
                        ),
                        Expanded(
                          flex: 2,
                          child: Text(
                            widget.data.title,
                            maxLines: 4,
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ))
        ],
      ),
    );
  }
}
