import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:freshmilksoftware/station_details.dart';

import 'package:http/http.dart' as http;

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List apiData = [];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getData();
  }

  getData() async {
    var res = await http.get(Uri.parse(
        'http://www.poznan.pl/mim/plan/map_service.html?mtype=pub_transport&co=stacje_rowerowe'));

    if (res.statusCode == 200) {
      var data = jsonDecode(res.body);
      print(data['features']);
      apiData = data['features'];
      print('list data');
      print(apiData[0]);
      print('list data');
      return apiData;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Vehicles'),
      ),
      body: Container(
        child: FutureBuilder(
            future: getData(),
            builder: (context, AsyncSnapshot snapshot) {
              if (snapshot.hasData) {
                return ListView.builder(
                    itemCount: apiData.length,
                    itemBuilder: (context, index) {
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            padding: const EdgeInsets.all(8.0),
                            // child: Text(apiData[0]['geometry'].toString()),
                            child: TextButton(
                              onPressed: () {
                                print('pressed ${apiData[index]['id']}');
                                print('index -- ${apiData[index]}');
                                var id = apiData[index]['id'];
                                var type = apiData[index]['type'];
                                var properties = Navigator.push(
                                    context,
                                    (MaterialPageRoute(builder: (context) {
                                      return ShopDetails(
                                        id: int.parse(id),
                                        type: type,
                                      );
                                    })));
                              },
                              child:
                                  // Text('Station: ${apiData[index]['geometry']['coordinates'].toString()}'),
                                  Text(
                                      'Station: ${apiData[index]['id'].toString()}'),
                            ),
                          ),
                        ],
                      );
                    });
              } else if (snapshot.hasError) {
                return Text("${snapshot.error}");
              }
              return const Center(child: CircularProgressIndicator());
            }),
      ),
    );
  }
}
