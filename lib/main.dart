import 'package:flutter/material.dart';
import 'package:tmdb_app/constant/strings.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:tmdb_app/data/vos/actor_details_vo/actor_details_vo.dart';
import 'package:tmdb_app/data/vos/actor_vo/actor_vo.dart';
import 'package:tmdb_app/data/vos/actor_vo/know_for_vo.dart';
import 'package:tmdb_app/data/vos/credit_vo/cast_vo/cast_vo.dart';
import 'package:tmdb_app/data/vos/credit_vo/cast_vo/crew_vo.dart';
import 'package:tmdb_app/data/vos/genre_vo/genre_vo.dart';
import 'package:tmdb_app/data/vos/movie_vo/movie_vo.dart';
import 'package:tmdb_app/data/vos/movies_details_vo/movie_details_vo.dart';
import 'package:tmdb_app/data/vos/movies_details_vo/production_companies_vo.dart';
import 'package:tmdb_app/data/vos/movies_details_vo/production_countries_vo.dart';
import 'package:tmdb_app/pages/home_page.dart';

import 'constant/hive_constant.dart';

main() async {
  await Hive.initFlutter();

  Hive.registerAdapter(MovieVOAdapter());
  Hive.registerAdapter(GenreVOAdapter());
  Hive.registerAdapter(ActorVOAdapter());
  Hive.registerAdapter(KnownForVOAdapter());
  Hive.registerAdapter(ActorDetailsVOAdapter());
  Hive.registerAdapter(MovieDetailsVOAdapter());
  Hive.registerAdapter(ProductionCompaniesVOAdapter());
  Hive.registerAdapter(ProductionCountriesVOAdapter());
  Hive.registerAdapter(CastVOAdapter());
  Hive.registerAdapter(CrewVOAdapter());

  await Hive.openBox<MovieVO>(kBoxNameForMovieVO);
  await Hive.openBox<GenreVO>(kBoxNameForGenreVO);
  await Hive.openBox<ActorVO>(kBoxNameForActorVO);
  await Hive.openBox<ActorDetailsVO>(kBoxNameForActorDetailsVO);
  await Hive.openBox<String>(kBoxNameForSearchHistoryVO);
  await Hive.openBox<MovieDetailsVO>(kBoxNameForMovieDetailsVO);
  await Hive.openBox<CastVO>(kBoxNameForCastVO);
  await Hive.openBox<CrewVO>(kBoxNameForCrewVO);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: kAppTitle,
      home: HomePage(),
    );
  }
}
