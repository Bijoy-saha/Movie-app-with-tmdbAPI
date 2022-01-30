// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

// ignore: use_key_in_widget_constructors
class TopMovies extends StatelessWidget {
  final List toping;
  TopMovies(this.toping);

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
            'Top Movies ❤️',
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
                scrollDirection: Axis.horizontal,
                itemCount: toping.length,
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () {},
                    child: Container(
                      width: 170,
                      child: Column(
                        children: [
                          Container(
                            height: 200,
                            decoration: BoxDecoration(
                                image: DecorationImage(
                              image: NetworkImage(
                                'https://image.tmdb.org/t/p/w500' +
                                    toping[index]['poster_path'],
                              ),
                            )),
                          ),
                          // ignore: avoid_unnecessary_containers
                          Container(
                            child: Text(
                              // ignore: prefer_if_null_operators
                              toping[index]['title'] != null
                                  ? toping[index]['title']
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
