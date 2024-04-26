import 'package:cinemapedia/presentation/providers/movies/movies_providers.dart';
import 'package:cinemapedia/presentation/widgets/movies/movie_masonry.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class PoPularView extends ConsumerStatefulWidget {
  const PoPularView({super.key});

  @override
  PoPularViewState createState() => PoPularViewState();
}

class PoPularViewState extends ConsumerState<PoPularView>
    with AutomaticKeepAliveClientMixin {
  bool isLoading = false;
  @override
  void initState() {
    super.initState();
    ref.read(popularMoviesProvider.notifier).loadNextPage();
  }

  void loadNextPage() async {
    if (isLoading) return;
    isLoading = true;

    final movies =
        await ref.read(popularMoviesProvider.notifier).loadNextPage();
    isLoading = false;
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    final popularMovies = ref.watch(popularMoviesProvider).toList();
    return Scaffold(
        body: MovieMasonry(
      loadNextPage: loadNextPage,
      movies: popularMovies,
    ));
  }

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;
}
