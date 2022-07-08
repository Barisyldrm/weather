import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'Search.dart';
import 'main.dart';

class HomePage2 extends StatefulWidget {
  const HomePage2({Key? key}) : super(key: key);

  @override
  State<HomePage2> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage2> {
  String sehir = 'Konya';
  double? sicaklik;
  int? sicaklikInt;
  var locationData;

  Future<void> getTemperature() async {
    var locationTemp = await http.get(
      Uri.parse(
          'https://api.openweathermap.org/data/2.5/weather?q=$sehir&units=metric&appid=f8f2a519518c1939df060ac0a5a8f235'),
    );

    var temperatureDataParsed = jsonDecode(locationTemp.body);
    setState(() {
      sicaklik = temperatureDataParsed['main']['temp'];
    });

    sicaklikInt = sicaklik?.round();
  }

  Future<void> getLocation() async {
    var locationData = await http.get(
      Uri.parse(
          'https://api.openweathermap.org/data/2.5/weather?q=$sehir&units=metric&appid=f8f2a519518c1939df060ac0a5a8f235'),
    );

    var locationDataParsed = jsonDecode(locationData.body);

    setState(() {
      sehir = locationDataParsed['name'];
    });

  }

  void getDataFromAPI() async {
    await getLocation();
    getTemperature();
  }

  @override
  void initState() {
    getDataFromAPI();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/images/hava2.jpeg'),
          fit: BoxFit.cover,
        ),
      ),
      child: sicaklikInt == null
          ? Center(child: CircularProgressIndicator())
          : Scaffold(appBar: metod(),

        backgroundColor: Colors.transparent,
        body: Center(
          child:
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                '$sicaklikInt° C',
                style: TextStyle(
                  color: Colors.amber,
                  fontWeight: FontWeight.w900,
                  fontSize: 80,
                ),
              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    '$sehir',
                    style: TextStyle(
                      color: Colors.amber,
                      fontSize: 35,
                    ),
                  ),
                  IconButton(
                    onPressed: () async {
                      sehir = await Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const SearchPage2()),
                      );
                      getDataFromAPI();
                      setState(() {
                        sehir = sehir;
                      });
                    },
                    icon: Icon(

                      Icons.thermostat_sharp,
                      color: Colors.amber,
                      size: 30,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),

    );
  }
}