import 'package:flutter/material.dart';
import '../utils/app_colors.dart';

class CategoryTabs extends StatefulWidget {
  const CategoryTabs({super.key});

  @override
  State<CategoryTabs> createState() => _CategoryTabsState();
}

class _CategoryTabsState extends State<CategoryTabs> {
  int selectedIndex = 0;
  final List<String> categories = [
    'All',
    'Popular',
    'Trending',
    'New Releases'
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: categories.length,
        itemBuilder: (context, index) {
          final isSelected = selectedIndex == index;
          return GestureDetector(
            onTap: () {
              setState(() {
                selectedIndex = index;
              });
            },
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 200),
              margin: const EdgeInsets.only(right: 12),
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
              decoration: BoxDecoration(
                color: isSelected ? AppColors.primary : Colors.white,
                borderRadius: BorderRadius.circular(25),
                border: isSelected
                    ? null
                    : Border.all(
                        color: AppColors.lightPurple.withOpacity(0.2),
                        width: 1,
                      ),
              ),
              child: Center(
                child: Text(
                  categories[index],
                  style: TextStyle(
                    color: isSelected ? Colors.white : AppColors.primary,
                    fontWeight: isSelected ? FontWeight.bold : FontWeight.w500,
                    fontSize: 18,
                    fontFamily: 'Raleway',
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
