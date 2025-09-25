import 'package:flutter/material.dart';
import '../../data/models/subscription_plan_model.dart';
import '../../data/repo/anime_repository.dart';
import '../utils/app_colors.dart';
import '../widgets/subscription_plan_card.dart';
import '../widgets/upgrade_plan_background.dart';

class UpgradePlanScreen extends StatefulWidget {
  const UpgradePlanScreen({super.key});

  @override
  State<UpgradePlanScreen> createState() => _UpgradePlanScreenState();
}

class _UpgradePlanScreenState extends State<UpgradePlanScreen> {
  int selectedPlanIndex = 0;

  @override
  Widget build(BuildContext context) {
    final plans = AnimeRepository.getSubscriptionPlans();

    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: Stack(children: [
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  const Color.fromARGB(255, 135, 104, 228).withOpacity(0.02),
                  Colors.white,
                  Colors.white,
                ],
              ),
            ),
          ),
          Column(
            children: [
              const Positioned.fill(
                child: BackgroundStars(),
              ),
              const SizedBox(height: 20),
              _buildCustomAppBar(context),
              _buildCharacterIllustration(),
              _buildTitleSection(),
              Expanded(
                child: _buildSubscriptionPlans(plans),
              ),
              _buildContinueButton(),
              const SizedBox(height: 20),
            ],
          ),
        ]),
      ),
    );
  }

  Widget _buildCustomAppBar(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Row(
        children: [
          const SizedBox(width: 30),
          const Expanded(
            child: Text(
              'Upgrade Plan',
              style: TextStyle(
                color: AppColors.textPrimary,
                fontSize: 22,
                fontWeight: FontWeight.w700,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          GestureDetector(
            onTap: () => Navigator.pop(context),
            child: Container(
              width: 27,
              height: 27,
              decoration: BoxDecoration(
                color: Colors.white,
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    blurRadius: 4,
                    offset: const Offset(0, 2),
                  ),
                ],
              ),
              child: const Icon(
                Icons.close,
                color: AppColors.textPrimary,
                size: 20,
              ),
            ),
          ),
          const SizedBox(width: 10)
        ],
      ),
    );
  }

  Widget _buildCharacterIllustration() {
    return SizedBox(
      height: 257,
      width: 257,
      child: Center(
        child: Image.asset("assets/images/rocket.png"),
      ),
    );
  }

  Widget _buildTitleSection() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        children: const [
          Text(
            'Seamless Anime\nExperience, Ad-Free.',
            style: TextStyle(
              color: AppColors.textPrimary,
              fontSize: 24,
              fontWeight: FontWeight.w700,
            ),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 5),
          Text(
            'Enjoy unlimited anime streaming without\ninterruptions.',
            style: TextStyle(
              color: AppColors.textSecondary,
              fontSize: 14,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }

  Widget _buildSubscriptionPlans(List<SubscriptionPlanModel> plans) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        children: plans.asMap().entries.map((entry) {
          final index = entry.key;
          final plan = entry.value;
          final isSelected = selectedPlanIndex == index;

          return GestureDetector(
            onTap: () {
              setState(() {
                selectedPlanIndex = index;
              });
            },
            child: SubscriptionPlanCard(
              plan: plan,
              isSelected: isSelected,
            ),
          );
        }).toList(),
      ),
    );
  }

  Widget _buildContinueButton() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Container(
        width: double.infinity,
        height: 56,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              AppColors.primary,
              AppColors.primary.withOpacity(0.8),
            ],
          ),
          borderRadius: BorderRadius.circular(28),
          boxShadow: [
            BoxShadow(
              color: AppColors.primary.withOpacity(0.3),
              blurRadius: 8,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Material(
          color: Colors.transparent,
          child: InkWell(
            borderRadius: BorderRadius.circular(28),
            onTap: () {
              _handleSubscription();
            },
            child: const Center(
              child: Text(
                'Continue',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  void _handleSubscription() {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: const Text('Subscription activated successfully!'),
        backgroundColor: Colors.green,
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );

    Future.delayed(const Duration(seconds: 2), () {
      if (mounted) {
        Navigator.pop(context);
      }
    });
  }
}
