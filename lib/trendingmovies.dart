// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:movieratingwithtmdb/descrip.dart';

// ignore: use_key_in_widget_constructors
class TrendingMovies extends StatelessWidget {
  final List trending;
  TrendingMovies(this.trending);

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
            'Trending Movies ❤️',
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
                itemCount: trending.length,
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Description(
                              trending[index]['title'],
                              trending[index]['overview'],

                              'https://image.tmdb.org/t/p/w500' +
                                  trending[index]['backdrop_path'],


                              'https://image.tmdb.org/t/p/w500' +
                                  trending[index]['poster_path'],


                              trending[index]['vote_average'].toString(),
                              
                              trending[index]['release_date']),
                        ),
                      );
                    },
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
                                    trending[index]['poster_path'],
                              ),
                            )),
                          ),
                          // ignore: avoid_unnecessary_containers
                          Container(
                            child: Text(
                              // ignore: prefer_if_null_operators
                              trending[index]['title'] != null
                                  ? trending[index]['title']
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
