import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        CircularContainerWithSVG(
          contentPath: 'assets/icons/menu_icon.svg', // Path to SVG file
          contentType: ContainerContentType.svg, // To load SVG
        ),
        CircularContainerWithSVG(
          contentPath: '', // No path needed for icon
          contentType: ContainerContentType.icon, // To load an icon
        )
      ],
    );
  }
}

enum ContainerContentType {
  svg,
  icon,
}

class CircularContainerWithSVG extends StatelessWidget {
  final String contentPath;
  final ContainerContentType contentType; // New parameter

  CircularContainerWithSVG({
    required this.contentPath,
    this.contentType = ContainerContentType.svg, // Default to SVG
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 60,
      height: 60,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: Colors.amber.shade200,
      ),
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Center(
          child: contentType == ContainerContentType.svg
              ? SvgPicture.asset(
                  contentPath,
                  width: 30,
                  height: 30,
                )
              : const Icon(
                  Icons.settings, // Replace with your desired icon
                  size: 30,
                  color: Colors.black, // Adjust color as needed
                ),
        ),
      ),
    );
  }
}
