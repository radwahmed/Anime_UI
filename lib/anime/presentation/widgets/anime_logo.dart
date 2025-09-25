import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

class AnimeLogo extends StatelessWidget {
  const AnimeLogo({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    final words = title.split(' ');
    final firstLine = words.isNotEmpty ? words[0] : '';
    final secondLine = words.length > 1 ? words.sublist(1).join(' ') : '';

    return SizedBox(
      width: 200,
      height: 200,
      child: Stack(
        alignment: Alignment.center,
        clipBehavior: Clip.none,
        children: [
          Positioned(
            child: SvgPicture.asset(
              'assets/icons/Ellipse_3.svg',
              width: 140,
              height: 140,
            ),
          ),
          Positioned(
            left: 80,
            bottom: 20,
            child: SvgPicture.asset(
              'assets/icons/Ellipse_6.svg',
              width: 160,
              height: 160,
            ),
          ),
          Positioned(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  firstLine.toUpperCase(),
                  style: GoogleFonts.newRocker(
                    fontSize: 48,
                    fontWeight: FontWeight.w400,
                    color: Colors.black,
                    height: 0.9,
                    shadows: [
                      Shadow(
                        color: Colors.white.withOpacity(0.8),
                        blurRadius: 2,
                        offset: const Offset(1, 1),
                      ),
                    ],
                  ),
                ),
                Text(
                  secondLine.toUpperCase(),
                  style: GoogleFonts.newRocker(
                    fontSize: 38,
                    fontWeight: FontWeight.w400,
                    color: Colors.black,
                    height: 0.9,
                    shadows: [
                      Shadow(
                        color: Colors.white.withOpacity(0.8),
                        blurRadius: 2,
                        offset: const Offset(1, 1),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
