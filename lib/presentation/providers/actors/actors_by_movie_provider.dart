import 'package:cinemapedia/domain/entities/actor.dart';

import 'package:cinemapedia/presentation/providers/actors/actors_repository_provider.dart';
import 'package:cinemapedia/presentation/providers/providers.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final actorsByMovieProvider =
    StateNotifierProvider<ActosByMovieNotifier, Map<String, List<Actor>>>(
        (ref) {
  final actorsRepository = ref.watch(actorsRepositoryProvider);
  return ActosByMovieNotifier(getActors: actorsRepository.getActorsByMovie);
});
/*
{
  '505642' : 
}
 */

typedef GetActorsCallback = Future<List<Actor>> Function(String movieId);

class ActosByMovieNotifier extends StateNotifier<Map<String, List<Actor>>> {
  final GetActorsCallback getActors;

  ActosByMovieNotifier({
    required this.getActors,
  }) : super({});

  Future<void> loadActors(String movieId) async {
    if (state[movieId] != null) return;
    final List<Actor> actors = await getActors(movieId);
    state = {...state, movieId: actors};
  }
}
