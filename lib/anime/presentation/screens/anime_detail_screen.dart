import 'package:anime_streaming_app/anime/presentation/screens/upgrade_plan_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../../data/models/anime_detail_model.dart';
import '../../data/repo/anime_repository.dart';
import '../utils/app_colors.dart';
import '../widgets/anime_logo.dart';

class AnimeDetailScreen extends StatelessWidget {
  final String animeTitle;

  const AnimeDetailScreen({
    super.key,
    required this.animeTitle,
  });

  @override
  Widget build(BuildContext context) {
    final animeDetails = AnimeRepository.getAnimeDetails(animeTitle);

    if (animeDetails == null) {
      return const Scaffold(
        //appBar: AppBar(),
        body: Center(
          child: Text('Anime details not found'),
        ),
      );
    }

    return Scaffold(
      body: Stack(
        children: [
          // Background image with gradient
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  const Color(0xFF1A1033).withOpacity(0.5), // بنفسجي غامق
                  const Color(0xFF1A1033),
                ],
              ),
            ),
          ),

          // إضاءة ضبابية من النار (Glow Effect)
          Positioned(
            top: 140,
            left: 280,
            child: Container(
              width: 200,
              height: 200,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: const Color(0xFF1A1033),
                boxShadow: [
                  BoxShadow(
                    color: const Color.fromARGB(255, 212, 116, 13)
                        .withOpacity(0.6),
                    blurRadius: 100,
                    spreadRadius: 150,
                  ),
                ],
              ),
            ),
          ),

          Positioned(
            top: 750,
            right: 500,
            child: Container(
              width: 200,
              height: 200,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: const Color(0xFF1A1033),
                boxShadow: [
                  BoxShadow(
                    color:
                        const Color.fromARGB(255, 235, 125, 8).withOpacity(0.6),
                    blurRadius: 100,
                    spreadRadius: 150,
                  ),
                ],
              ),
            ),
          ),

          Column(
            children: [
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      _buildAnimeHeader(animeDetails),
                      const SizedBox(height: 15),
                      _buildGenres(animeDetails.genres),
                      const SizedBox(height: 15),
                      Divider(
                        color: Colors.white.withOpacity(0.2),
                        thickness: 1,
                        indent: 20,
                        endIndent: 20,
                      ),
                      const SizedBox(height: 5),
                      _buildStats(animeDetails),
                      const SizedBox(height: 5),
                      Divider(
                        color: Colors.white.withOpacity(0.2),
                        thickness: 1,
                        indent: 20,
                        endIndent: 20,
                      ),
                      const SizedBox(height: 10),
                      _buildDescription(animeDetails.description),
                      // عشان ميبقاش الكلام لازق في الزرار
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
      bottomNavigationBar: _buildActionButtons(context),
    );
  }

  Widget _buildAnimeHeader(AnimeDetailModel animeDetails) {
    return Column(
      children: [
        Stack(
          alignment: Alignment.center,
          clipBehavior: Clip.none,
          children: [
            SizedBox(
              height: 650,
              width: double.infinity,
              child: ClipRRect(
                child: Image.asset(
                  animeDetails.imageUrl,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Positioned(
              bottom: -80,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(14),
                child: AnimeLogo(
                  title: animeTitle,
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 60),
      ],
    );
  }
}

Widget _buildGenres(List<String> genres) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 20),
    child: Wrap(
      spacing: 12,
      children: genres.map((genre) {
        return Container(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
          decoration: BoxDecoration(
            color: Colors.white.withOpacity(0.1),
            borderRadius: BorderRadius.circular(20),
            border: Border.all(
              color: Colors.transparent,
            ),
          ),
          child: Text(
            genre,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 14,
              fontWeight: FontWeight.w400,
            ),
          ),
        );
      }).toList(),
    ),
  );
}

Widget _buildStats(AnimeDetailModel animeDetails) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 10),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        _buildStatItem("assets/icons/fa_solid_eye.svg", animeDetails.views),
        _buildStatItem("assets/icons/HandsClapping.svg", animeDetails.claps),
        _buildStatItem(
            "assets/icons/icon_park_solid_movie.svg", animeDetails.seasons),
      ],
    ),
  );
}

Widget _buildStatItem(String assetPath, String text) {
  return Row(
    children: [
      SvgPicture.asset(
        assetPath,
        width: 18,
        height: 18,
        color: Colors.white.withOpacity(0.9),
      ),
      const SizedBox(width: 6),
      Text(
        text,
        style: const TextStyle(
          color: Colors.white,
          fontSize: 14,
          fontWeight: FontWeight.w400,
        ),
      ),
    ],
  );
}

Widget _buildDescription(String description) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 20),
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SvgPicture.asset("assets/icons/fire.svg"),
        const SizedBox(width: 5),
        Expanded(
          child: Text(
            description,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 12,
              fontWeight: FontWeight.w500,
              height: 1.5,
            ),
            textAlign: TextAlign.left,
          ),
        ),
      ],
    ),
  );
}

Widget _buildActionButtons(BuildContext context) {
  return Container(
    width: double.infinity,
    height: 70,
    color: AppColors.secondary,
    padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
    child: Row(
      children: [
        Expanded(
          child: Container(
            height: 50,
            decoration: BoxDecoration(
              color: const Color(0x8D899866),
              borderRadius: BorderRadius.circular(25),
              border: Border.all(
                color: Colors.white.withOpacity(0.3),
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SvgPicture.asset("assets/icons/Vector.svg"),
                const SizedBox(width: 8),
                const Text(
                  'Preview',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                    fontSize: 15,
                  ),
                ),
              ],
            ),
          ),
        ),
        const SizedBox(width: 16),
        Expanded(
          child: GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const UpgradePlanScreen(),
                ),
              );
            },
            child: Container(
              height: 50,
              decoration: BoxDecoration(
                color: AppColors.primary,
                borderRadius: BorderRadius.circular(25),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SvgPicture.asset("assets/icons/fa_solid_eye.svg"),
                  const SizedBox(width: 8),
                  const Text(
                    'Watch Now',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                      fontSize: 15,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    ),
  );
}
