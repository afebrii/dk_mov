import 'package:dio/dio.dart';
import 'package:dk_mov/data/repositories/movie_repository.dart';
import 'package:dk_mov/domain/entities/actor.dart';
import 'package:dk_mov/domain/entities/movie.dart';
import 'package:dk_mov/domain/entities/movie_detail.dart';
import 'package:dk_mov/domain/entities/result.dart';

class TmdbMovieRepository implements MovieRepository {
  final Dio? _dio;
  final String _accessToken =
      'eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiJiY2RiZjVlMmZjMTI4MzE0OTc2MGY5MTI3YTI2NjlhYiIsIm5iZiI6MTcxOTM3OTU3My43MTQ2NTIsInN1YiI6IjY2NmY5ZTYwZTZhZTRkMzI0NTI2NWQ0ZCIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.wUx3fERpfXUAuP4USU37K0C8PpA0_muLcwbzqg9A8jQ';

  late final Options _options = Options(headers: {
    'Authorization': 'Bearer $_accessToken',
    'accept': 'application/json'
  });

  TmdbMovieRepository({Dio? dio}) : _dio = dio ?? Dio();

  @override
  Future<Result<List<Actor>>> getActors({required int id}) async {
    try {
      final response = await _dio!.get('https://api.themoviedb.org/3/movie/1022789/credits?language=en-US', options: _options);

      final results = List<Map<String, dynamic>>.from(response.data['cast']);

      return Result.success(results.map((e) => Actor.fromJSON(e)).toList());
    } on DioException catch (e) {
      return Result.failed('${e.message}');
    }
  }

  @override
  Future<Result<MovieDetail>> getDetail({required int id}) async {
    try {
      final response = await _dio!.get('https://api.themoviedb.org/3/movie/movie_id?language=en-US', options: _options);

      return Result.success(MovieDetail.fromJSON(response.data));
    } on DioException catch (e) {
      return Result.failed('${e.message}');
    }
  }

  @override
  Future<Result<List<Movie>>> getNowPlaying({int page = 1}) async =>
      _getMovies(_MovieCategory.nowPlaying.toString(), page: page);

  @override
  Future<Result<List<Movie>>> getUpComing({int page = 1}) async =>
      _getMovies(_MovieCategory.upComing.toString(), page: page);

  Future<Result<List<Movie>>> _getMovies(String category,
      {int page = 1}) async {
    try {
      final response = await _dio!.get(
          'https://api.themoviedb.org/3/movie/now_playing?language=en-US&page=$page',
          options: _options);

      final results = List<Map<String, dynamic>>.from(response.data['results']);

      return Result.success(results.map((e) => Movie.fromJSON(e)).toList());
    } on DioException catch (e) {
      return Result.failed('${e.message}');
    }
  }
}

enum _MovieCategory {
  nowPlaying('now_playing'),
  upComing('upcoming');

  final String _instring;

  const _MovieCategory(String inString) : _instring = inString;

  @override
  String toString() => _instring;
}
