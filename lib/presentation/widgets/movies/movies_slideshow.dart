import 'package:animate_do/animate_do.dart';
import 'package:card_swiper/card_swiper.dart';
import 'package:cinemapedia/domain/entities/movie.dart';
import 'package:flutter/material.dart';

class MoviesSlideshow extends StatelessWidget {
  final List<Movie> movies;
  const MoviesSlideshow({super.key, required this.movies});

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    return SizedBox(
        height: 210,
        width: double.infinity,
        child: Swiper(
            viewportFraction: 0.8,
            scale: 0.8,
            autoplay: true,
            pagination: SwiperPagination(
                margin: const EdgeInsets.only(top: 0),
                builder: DotSwiperPaginationBuilder(
                    activeColor: colors.primary, color: colors.secondary)),
            itemCount: movies.length,
            itemBuilder: (context, index) => _Slide(movie: movies[index])));
  }
}

class _Slide extends StatelessWidget {
  final Movie movie;
  const _Slide({required this.movie});

  @override
  Widget build(BuildContext context) {
    final decoration = BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        boxShadow: const [
          BoxShadow(
              color: Colors.black45, blurRadius: 10, offset: Offset(0, 10))
        ]);

    return Padding(
      padding: const EdgeInsets.only(bottom: 30),
      child: DecoratedBox(
        decoration: decoration,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: _buildImageWidget(),
        ),
      ),
    );
  }

  Widget _buildImageWidget() {
    return Stack(
      fit: StackFit.expand,
      children: [
        Image.network(
          movie.backdropPath,
          fit: BoxFit.cover,
          errorBuilder: (context, error, stackTrace) {
            return Image.network(
              'https://th.bing.com/th/id/R.e7d69c9bb33ccdfbdb90350d1ebe8a75?rik=Ru1WFG%2fpCGjxng&pid=ImgRaw&r=0',
              fit: BoxFit.cover,
            );
          },
        ),
      ],
    );
  }
}
