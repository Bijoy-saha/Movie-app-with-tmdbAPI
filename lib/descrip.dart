import 'package:flutter/material.dart';

class Description extends StatelessWidget {
  static const routeName = '/okay';
  String? name;
  String? description;
  String? bannerurl;
  String? posterurl;
  String? vote;
  // ignore: non_constant_identifier_names
  String? launch_on;
  // ignore: use_key_in_widget_constructors
  Description(
    this.name,
    this.description,
    this.bannerurl,
    this.posterurl,
    this.vote,
    this.launch_on,
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: ListView(
          children: [
            Container(
              height: 250,
              child: Stack(
                children: [
                  Positioned(
                    // ignore: sized_box_for_whitespace
                    child: Container(
                      height: 250,
                      width: double.infinity,
                      child: Image.network(
                        bannerurl!,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 10,
                    // ignore: avoid_unnecessary_containers
                    child: Container(
                      child: Text(
                        'average Rating ' + vote! + '⭐',
                        // ignore: prefer_const_constructors
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              // ignore: prefer_if_null_operators
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  name == null ? 'null' : name!,
                  style:
                      // ignore: prefer_const_constructors
                      TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  'releasing Date :' + launch_on!,
                  style:
                      // ignore: prefer_const_constructors
                      TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                ),
              ),
            ),
            SizedBox(height: 10),
            Row(
              children: [
                Container(
                  width: 200,
                  height: 150,
                  child: Image.network(
                    posterurl!,
                    fit: BoxFit.cover,
                  ),
                ),
                Flexible(
                  child: Container(
                    child: Text(description!),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
