import 'package:flutter/material.dart';
import '../../data/models/subscription_plan_model.dart';
import '../utils/app_colors.dart';

class SubscriptionPlanCard extends StatelessWidget {
  final SubscriptionPlanModel plan;
  final bool isSelected;

  const SubscriptionPlanCard({
    super.key,
    required this.plan,
    required this.isSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.only(bottom: 16),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: isSelected ? AppColors.secondary : Colors.white,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: isSelected ? AppColors.secondary : Colors.grey.shade300,
          width: 1,
        ),
        boxShadow: [
          BoxShadow(
            color: isSelected
                ? AppColors.primary.withOpacity(0.15)
                : Colors.black.withOpacity(0.05),
            blurRadius: isSelected ? 12 : 6,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Row(
        children: [
          SizedBox(
            width: 60,
            height: 60,
            child: Image.asset(
              "assets/images/video.png",
              width: 30,
              height: 30,
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(
                      plan.title,
                      style: TextStyle(
                        color:
                            isSelected ? Colors.white : AppColors.textPrimary,
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 4),
                Text(
                  plan.price + plan.duration,
                  style: TextStyle(
                    color: isSelected
                        ? Colors.white.withOpacity(0.9)
                        : AppColors.textPrimary,
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(height: 2),
                Text(
                  plan.description,
                  style: TextStyle(
                    color: isSelected
                        ? Colors.white.withOpacity(0.7)
                        : AppColors.textSecondary,
                    fontSize: 12,
                  ),
                ),
              ],
            ),
          ),
          Container(
            width: 24,
            height: 24,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(
                color: isSelected ? AppColors.primary : AppColors.secondary,
                width: 2,
              ),
              color: isSelected ? AppColors.primary : Colors.transparent,
            ),
            child: isSelected
                ? const Icon(
                    Icons.check,
                    color: AppColors.secondary,
                    size: 18,
                  )
                : null,
          ),
        ],
      ),
    );
  }
}
