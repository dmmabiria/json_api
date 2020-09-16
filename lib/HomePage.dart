import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:http/http.dart' as http;
import 'package:json_api/DetailPage.dart';
import 'AppDrawer.dart';
import 'dart:convert';
import 'dart:async';
import 'package:json_api/Model/Data.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<MaterialColor> _color = [
    Colors.purple,
    Colors.brown,
    Colors.pink,
    Colors.teal,
    Colors.cyan,
    Colors.indigo,
  ];
  Future<List<Data>> getAllData() async {
    // Await the http get response, then decode the json-formatted response
    var api = 'http://jsonplaceholder.typicode.com/photos';
    var data = await http.get(api);
    var jsonData = json.decode(data.body);

    // ignore: non_constant_identifier_names
    List<Data> ListOf = [];
    for (var i in jsonData) {
      //Object of Data class
      Data data = Data(i['id'], i['title'], i['url'], i['thumbnailUrl']);
      ListOf.add(data);
    }
    return ListOf;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('JSON Parsing API'),
        backgroundColor: Colors.deepOrange,
        actions: [
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () => debugPrint("Search"),
          ),
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () => debugPrint("Add"),
          )
        ],
      ),
      drawer: AppDrawer(),
      body: ListView(
        children: [
          Container(
            height: 250.0,
            margin: EdgeInsets.all(10.0),
            child: FutureBuilder(
              future: getAllData(),
              // ignore: missing_return
              builder: (BuildContext c, AsyncSnapshot snapshot) {
                if (snapshot.data == null) {
                  return Center(
                    child: Text('Loading Horizontally Arranged Photos...'),
                  );
                } else {
                  return ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: snapshot.data.length,
                      itemBuilder: (BuildContext c, int index) {
                        MaterialColor mColor = _color[index % _color.length];
                        return Card(
                          elevation: 10.0,
                          child: InkWell(
                            onTap: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (BuildContext c) =>
                                      DetailPage(snapshot.data[index])));
                            },
                            child: Column(
                              children: [
                                Image.network(
                                  snapshot.data[index].url,
                                  height: 150.0,
                                  width: 150.0,
                                  fit: BoxFit.cover,
                                ),
                                SizedBox(
                                  height: 7.0,
                                ),
                                Container(
                                  // height: 70.0,
                                  margin: EdgeInsets.all(6.0),
                                  child: Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                        child: CircleAvatar(
                                          backgroundColor: mColor,
                                          foregroundColor: Colors.white,
                                          child: Text(
                                            snapshot.data[index].id.toString(),
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        width: 6.0,
                                      ),
                                      Container(
                                        width: 100.0,
                                        child: Text(
                                          snapshot.data[index].title,
                                          softWrap: true,
                                          maxLines: 4,
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      });
                }
              },
            ),
          ),
          SizedBox(
            height: 7.0,
          ),
          Container(
            margin: EdgeInsets.all(10.0),
            height: MediaQuery.of(context).size.height,
            child: FutureBuilder(
                future: getAllData(),
                builder: (BuildContext c, AsyncSnapshot snapshot) {
                  if (snapshot.data == null) {
                    return Center(
                      child: Text('Loading Vertically Arranged Photos...'),
                    );
                  } else {
                    return ListView.builder(
                        itemCount: snapshot.data.length,
                        itemBuilder: (BuildContext c, int index) {
                          MaterialColor mColor = _color[index % _color.length];
                          return Card(
                            elevation: 7.0,
                            child: Container(
                              height: 80.0,
                              child: InkWell(
                                onTap: () {
                                  Navigator.of(context).push(MaterialPageRoute(
                                      builder: (BuildContext c) =>
                                          DetailPage(snapshot.data[index])));
                                },
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Expanded(
                                        flex: 1,
                                        child: Image.network(
                                          snapshot.data[index].url,
                                          height: 100.0,
                                          fit: BoxFit.cover,
                                        )),
                                    SizedBox(width: 6.0),
                                    Expanded(
                                      flex: 2,
                                      child: Text(
                                        snapshot.data[index].title,
                                        maxLines: 4,
                                        overflow: TextOverflow.ellipsis,
                                        style: TextStyle(fontSize: 16.0),
                                      ),
                                    ),
                                    Expanded(
                                      flex: 1,
                                      child: Align(
                                        alignment: Alignment.center,
                                        child: CircleAvatar(
                                          child: Text(snapshot.data[index].id
                                              .toString()),
                                          backgroundColor: mColor,
                                          foregroundColor: Colors.white,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          );
                        });
                  }
                }),
          )
        ],
      ),
    );
  }
}
