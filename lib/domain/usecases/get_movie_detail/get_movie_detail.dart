import 'package:dk_mov/data/repositories/movie_repository.dart';
import 'package:dk_mov/domain/entities/movie_detail.dart';
import 'package:dk_mov/domain/entities/result.dart';
import 'package:dk_mov/domain/usecases/get_movie_detail/get_movie_detail_param.dart';
import 'package:dk_mov/domain/usecases/usecase.dart';

class GetMovieDetail
    implements UseCase<Result<MovieDetail>, GetMovieDetailParam> {
  final MovieRepository _movieRepository;

  GetMovieDetail({required MovieRepository movieRepository})
      : _movieRepository = movieRepository;

  @override
  Future<Result<MovieDetail>> call(GetMovieDetailParam params) async {
    var movieDetailResult =
        await _movieRepository.getDetail(id: params.movie.id);

    return switch (movieDetailResult) {
      Success(value: final movieDetail) => Result.success(movieDetail),
      Failed(:final message) => Result.failed(message)
    };
  }
}
