import 'package:cinemapedia/presentation/screens/views/movies/popular_view.dart';
import 'package:cinemapedia/presentation/screens/views/views.dart';
import 'package:cinemapedia/presentation/widgets/widgets.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  static const name = 'home-screen';
  final int pageIndex;
  const HomeScreen({super.key, required this.pageIndex});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late PageController _pageController;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: widget.pageIndex);
  }

  final viewRoutes = const <Widget>[
    HomeView(),
    PoPularView(),
    FavoritesView(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: _pageController,
        children: viewRoutes,
        physics: NeverScrollableScrollPhysics(),
      ),
      bottomNavigationBar: CustomBottomNavigation(
        currentIndex: widget.pageIndex,
        onPageChanged: (index) {
          _pageController.animateToPage(
            index,
            duration: Duration(milliseconds: 300), // Duración de la animación
            curve: Curves.ease, // Curva de animación
          );
        },
      ),
    );
  }
}
