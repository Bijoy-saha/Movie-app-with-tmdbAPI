// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:movieratingwithtmdb/topmovie.dart';
import 'package:movieratingwithtmdb/topseries.dart';
import 'package:movieratingwithtmdb/trendingmovies.dart';
import 'package:tmdb_api/tmdb_api.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List tv = [];
  List topmv = [];
  List trendingMovie = [];
  final apiKey = 'e3ae68ff9dbd91b1c46f70057225ce8f';
  final readAccessToken =
      'eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiJlM2FlNjhmZjlkYmQ5MWIxYzQ2ZjcwMDU3MjI1Y2U4ZiIsInN1YiI6IjYxZjRkNTdiZDcxZmI0MDA2OGZjYWZkOSIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.ZucM2dX3JWX1GARkDPIurlRiG00WB5-2xwAAACCDg3w';

  @override
  void initState() {
    loadmovies();
    super.initState();
  }

  loadmovies() async {
    TMDB tmdbwithcustomlogs = TMDB(
      ApiKeys(apiKey, readAccessToken),
      // ignore: prefer_const_constructors
      logConfig: ConfigLogger(
        showLogs: true,
        showErrorLogs: true,
      ),
    );
    Map trensingResult = await tmdbwithcustomlogs.v3.trending.getTrending();
    Map movieResult = await tmdbwithcustomlogs.v3.movies.getTopRated();
    Map tvshowResult = await tmdbwithcustomlogs.v3.tv.getPopular();

    setState(() {
      trendingMovie = trensingResult['results'];
      tv = tvshowResult['results'];
      topmv = movieResult['results'];
    });
    print(tv);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.pink,
        title: Text(
          'Movies🖤',
          style: TextStyle(
            fontSize: 25,
            color: Colors.black54,
          ),
        ),
      ),
      body: ListView(children: [
        TopShows(tv),
          TrendingMovies(trendingMovie),
        TopMovies(topmv),
      
      ]),
    );
  }
}
