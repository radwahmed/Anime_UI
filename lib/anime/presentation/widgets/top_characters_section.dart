import 'package:flutter/material.dart';
import '../../data/repo/anime_repository.dart';
import '../utils/app_colors.dart';
import 'character_card.dart';

class TopCharactersSection extends StatelessWidget {
  const TopCharactersSection({super.key});

  @override
  Widget build(BuildContext context) {
    final characters = AnimeRepository.getTopCharacters();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: Text(
            'Top Characters',
            style: TextStyle(
              color: AppColors.textPrimary,
              fontSize: 24,
              fontWeight: FontWeight.w700,
              fontFamily: 'Raleway',
            ),
          ),
        ),
        const SizedBox(height: 20),
        SizedBox(
          height: 120,
          child: ListView.builder(
            padding: const EdgeInsets.only(left: 16),
            scrollDirection: Axis.horizontal,
            itemCount: characters.length,
            itemBuilder: (context, index) {
              return CharacterCard(
                character: characters[index],
              );
            },
          ),
        ),
      ],
    );
  }
}
