import '../models/anime_model.dart';
import '../models/character_model.dart';
import '../models/anime_detail_model.dart';
import '../models/subscription_plan_model.dart';

class AnimeRepository {
  static List<AnimeModel> getFeaturedAnime() {
    return [
      const AnimeModel(
        title: 'Detective Conan',
        imageUrl: 'assets/images/detective_conan.png',
        rating: 5.0,
        type: 'Mystery',
        isNew: true,
      ),
      const AnimeModel(
        title: 'Hunter x Hunter',
        imageUrl: 'assets/images/hunter.png',
        rating: 5.0,
        type: 'Adventure',
      ),
      const AnimeModel(
        title: 'One Piece',
        imageUrl: 'assets/images/one_piece.jpg',
        rating: 5.0,
        type: 'Adventure',
      ),
      const AnimeModel(
        title: 'Demon Slayer',
        imageUrl: 'assets/images/demon.jpg',
        rating: 5.0,
        type: 'Adventure',
      ),
    ];
  }

  static List<CharacterModel> getTopCharacters() {
    return [
      const CharacterModel(
        name: 'Gon Freecss',
        imageUrl: 'assets/images/gon.png',
        anime: 'Hunter x Hunter',
      ),
      const CharacterModel(
        name: 'Naruto Uzumaki',
        imageUrl: 'assets/images/naruto.png',
        anime: 'Naruto',
      ),
      const CharacterModel(
        name: 'Luffy',
        imageUrl: 'assets/images/luffy.jpg',
        anime: 'One Piece',
      ),
      const CharacterModel(
        name: 'Tanjiro Kamado',
        imageUrl: 'assets/images/tanjiro.jpg',
        anime: 'Demon Slayer',
      ),
    ];
  }

  static AnimeDetailModel getDemonSlayerDetails() {
    return const AnimeDetailModel(
      title: 'DEMON SLAYER',
      imageUrl: 'assets/images/demon.jpg',
      genres: ['Dark Fantasy', 'Action', 'Adventure'],
      views: '3M views',
      claps: '2K clap',
      seasons: '4 Seasons',
      description:
          'Demon Slayer: Kimetsu no Yaiba follows Tanjiro, a kind-hearted boy who becomes a demon slayer after his family is slaughtered and his sister is turned into a demon. Experience breathtaking battles, stunning animation, and an emotional journey of courage and hope.',
    );
  }

  static AnimeDetailModel getDetectiveCononDetails() {
    return const AnimeDetailModel(
      title: 'DETECTIVE CONAN',
      imageUrl: 'assets/images/detective_conan.png',
      genres: ['Mystery', 'Crime', 'Drama'],
      views: '5M views',
      claps: '3.5K clap',
      seasons: '25+ Seasons',
      description: 'A brilliant detective in a child\'s body solving mysteries',
    );
  }

  static AnimeDetailModel getHunterHunterDetails() {
    return const AnimeDetailModel(
      title: 'HUNTER X HUNTER',
      imageUrl: 'assets/images/hunter.png',
      genres: ['Adventure', 'Fantasy', 'Shounen'],
      views: '2.8M views',
      claps: '1.9K clap',
      seasons: '6 Seasons',
      description:
          'A young boy\'s journey to become a Hunter and find his father',
    );
  }

  static AnimeDetailModel getOnePieceDetails() {
    return const AnimeDetailModel(
      title: 'One Piece',
      imageUrl: 'assets/images/one_piece.jpg',
      genres: ['Dark Fantasy', 'Action', 'Drama'],
      views: '4.2M views',
      claps: '2.7K clap',
      seasons: '4 Seasons',
      description: 'Humanity\'s fight for survival against giant titans',
    );
  }

  static AnimeDetailModel? getAnimeDetails(String title) {
    switch (title.toLowerCase()) {
      case 'demon slayer':
        return getDemonSlayerDetails();
      case 'detective conan':
        return getDetectiveCononDetails();
      case 'hunter x hunter':
        return getHunterHunterDetails();
      case 'one piece':
        return getOnePieceDetails();
      default:
        return getDemonSlayerDetails();
    }
  }

  static List<SubscriptionPlanModel> getSubscriptionPlans() {
    return [
      const SubscriptionPlanModel(
        title: 'Monthly',
        price: '\$5 USD',
        duration: '/Month',
        description: 'Include Family Sharing',
        features: [
          'Unlimited anime streaming',
          'HD quality videos',
          'Family sharing (up to 6 members)',
          'Download for offline viewing',
          'No ads',
        ],
      ),
      const SubscriptionPlanModel(
        title: 'Annually',
        price: '\$50 USD',
        duration: '/Year',
        description: 'Include Family Sharing',
        features: [
          'Everything in Monthly plan',
          '2 months free',
          'Priority customer support',
          'Early access to new releases',
          'Premium content library',
        ],
      ),
    ];
  }
}
