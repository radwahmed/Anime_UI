import 'package:flutter/material.dart';
import '../../data/repo/anime_repository.dart';
import 'anime_card.dart';

class FeaturedAnimeSection extends StatelessWidget {
  final Function(String)? onAnimeSelected;

  const FeaturedAnimeSection({
    super.key,
    this.onAnimeSelected,
  });

  @override
  Widget build(BuildContext context) {
    final animeList = AnimeRepository.getFeaturedAnime();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(padding: EdgeInsets.symmetric(horizontal: 16)),
        const SizedBox(height: 16),
        SizedBox(
          height: 260,
          child: ListView.builder(
            padding: const EdgeInsets.only(left: 16),
            scrollDirection: Axis.horizontal,
            itemCount: animeList.length,
            itemBuilder: (context, index) {
              final anime = animeList[index];
              return AnimeCard(
                anime: anime,
                onTap: () {
                  if (onAnimeSelected != null) {
                    onAnimeSelected!(anime.title);
                  }
                },
              );
            },
          ),
        ),
      ],
    );
  }
}
