import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../utils/app_colors.dart';

class CustomBottomNav extends StatefulWidget {
  const CustomBottomNav({super.key});

  @override
  State<CustomBottomNav> createState() => _CustomBottomNavState();
}

class _CustomBottomNavState extends State<CustomBottomNav> {
  int selectedIndex = 0;

  final List<String> navLabels = [
    'Home',
    'Library',
    'Search',
    'Language',
    'Settings'
  ];

  final List<String> navIcons = [
    "assets/icons/home.svg",
    "assets/icons/library.svg",
    "assets/icons/search.svg",
    "assets/icons/world.svg",
    "assets/icons/setting.svg",
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      decoration: const BoxDecoration(
        color: Colors.white,
        border: Border(
          top: BorderSide(
            color: AppColors.lightPurple,
            width: 0.5,
          ),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: List.generate(navIcons.length, (index) {
          return _buildNavItem(navIcons[index], navLabels[index], index);
        }),
      ),
    );
  }

  Widget _buildNavItem(String assetPath, String label, int index) {
    final isSelected = selectedIndex == index;

    return GestureDetector(
      onTap: () {
        setState(() {
          selectedIndex = index;
        });
      },
      child: Container(
        padding: const EdgeInsets.all(8),
        child: isSelected
            ? Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                decoration: BoxDecoration(
                  color: AppColors.primary,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    SvgPicture.asset(
                      assetPath,
                      width: 20,
                      height: 20,
                      color: Colors.white,
                    ),
                    const SizedBox(width: 6),
                    Text(
                      label,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 13,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              )
            : SvgPicture.asset(assetPath,
                width: 22, height: 22, color: AppColors.textSecondary),
      ),
    );
  }
}
