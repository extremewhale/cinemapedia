import 'package:cinemapedia/domain/entities/movie.dart';

abstract class MovieDatasource {
  Future<List<Movie>> getNowplaying({int page = 1});
}