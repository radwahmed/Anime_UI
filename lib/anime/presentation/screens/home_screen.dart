import 'package:flutter/material.dart';
import '../utils/app_colors.dart';
import '../widgets/background_stars.dart';
import '../widgets/category_tabs.dart';
import '../widgets/featured_anime_section.dart';
import '../widgets/top_characters_section.dart';
import '../widgets/custom_bottom_nav.dart';
import 'anime_detail_screen.dart';

class HomeScreen extends StatelessWidget {
  final Function(String)? onAnimeSelected;

  void _navigateToAnimeDetail(BuildContext context, String animeTitle) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => AnimeDetailScreen(animeTitle: animeTitle),
      ),
    );
  }

  const HomeScreen({
    super.key,
    this.onAnimeSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              AppColors.lightPurple.withOpacity(0.2),
              AppColors.cardBackground,
            ],
          ),
        ),
        child: Stack(
          children: [
            const Positioned.fill(
              child: BackgroundStar(),
            ),
            SingleChildScrollView(
              child: Column(
                children: [
                  const SizedBox(height: 80),
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'Where Anime Comes Alive',
                        style: TextStyle(
                          color: AppColors.textPrimary,
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 18),
                  const CategoryTabs(),
                  const SizedBox(height: 16),
                  FeaturedAnimeSection(
                    onAnimeSelected: (animeTitle) =>
                        _navigateToAnimeDetail(context, animeTitle),
                  ),
                  const SizedBox(height: 15),
                  const TopCharactersSection(),
                  const SizedBox(height: 80),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: const CustomBottomNav(),
    );
  }
}
