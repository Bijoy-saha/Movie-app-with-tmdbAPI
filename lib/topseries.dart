// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

// ignore: use_key_in_widget_constructors
class TopShows extends StatelessWidget {
  final List tv;
  TopShows(this.tv);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black,
      padding: EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        // ignore: prefer_const_literals_to_create_immutables
        children: [
          Text(
            'Top Shows ❤️',
            style: TextStyle(
              fontSize: 26,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Container(
            height: 250,
            child: ListView.builder(
              padding: EdgeInsets.all(10),
                scrollDirection: Axis.horizontal,
                itemCount: tv.length,
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () {},
                    child: Container(
                      padding: EdgeInsets.all(5),
                      width: 270,
                      child: Column(
                        
                        children: [
                          Container(
                            padding: EdgeInsets.all(10),
                            height: 200,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                                image: DecorationImage(
                              image: NetworkImage(
                                'https://image.tmdb.org/t/p/w500' +
                                    tv[index]['poster_path'],
                              ),
                              fit: BoxFit.cover,
                            )),
                          ),
                          // ignore: avoid_unnecessary_containers
                          Container(
                            child: Text(
                              // ignore: prefer_if_null_operators
                              tv[index]['original_name'] != null
                                  ? tv[index]['original_name']
                                  : 'loading',
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                }),
          ),
        ],
      ),
    );
  }
}
