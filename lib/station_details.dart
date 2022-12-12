import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:freshmilksoftware/map_screen.dart';

import 'package:http/http.dart' as http;

class ShopDetails extends StatefulWidget {
  late int id;
  late String type;

  //api key AIzaSyAawt_kS_sTuYCmHBD9Zd8_nq1o3IghVyI

  ShopDetails({required this.id, required this.type});

  @override
  State<ShopDetails> createState() => _ShopDetailsState();
}

class _ShopDetailsState extends State<ShopDetails> {
  List apiData = [];

  @override
  void initState() {
    super.initState();
    getStationDetails();
  }

  getStationDetails() async {
    var res = await http.get(Uri.parse(
        'http://www.poznan.pl/mim/plan/map_service.html?mtype=pub_transport&co=stacje_rowerowe'));

    if (res.statusCode == 200) {
      var data = jsonDecode(res.body);
      print(data['features']);
      apiData = data['features'];
      print('list data');
      print(apiData[0]);
      print('list data');
      print(apiData.contains(15618));
      return apiData;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Station Details'),
      ),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('ID: ${widget.id.toString()}'),
            Text('Type: ${widget.type}'),
            TextButton(
                onPressed: () {
                  print('map');
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return MapScreen();
                  }));
                },
                child: const Text('Map'))
          ],
        ),
      ),
    );
  }
}
